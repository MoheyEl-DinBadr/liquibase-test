package com.mohey.liquibasetest;

import io.r2dbc.spi.Row;
import io.r2dbc.spi.RowMetadata;
import lombok.SneakyThrows;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.sql.init.dependency.DependsOnDatabaseInitialization;
import org.springframework.context.annotation.Bean;
import org.springframework.r2dbc.core.DatabaseClient;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.BiFunction;

@SpringBootApplication
public class LiquibaseTestApplication {

    public static void main(String[] args) {
        SpringApplication.run(LiquibaseTestApplication.class, args);
    }


    @Bean
    @DependsOnDatabaseInitialization
    ApplicationRunner runner(DatabaseClient client, ArticleRowMapper articleRowMapper) {
        return args -> {

            var sql = """ 
                   SELECT c.id as comment_id,
                          c.comment as comment,
                          a.id as article_id,
                          a.title as title,
                          a.authored as authored
                   FROM article a
                   LEFT JOIN comment c
                   ON c.article_id = a.id
                    """;
            var list = client.sql(sql).map(articleRowMapper).all().collectList().block();
            assert list != null;
            new HashSet<>(list)
                    .forEach(System.out::println);


        };
    }
}


record Comment (Long id, String text) {

}
record Article(Long id, String title, LocalDate authored, List<Comment> comments){

}

@Component
class ArticleRowMapper implements BiFunction<Row, RowMetadata, Article> {

    private final Map<Long, Article> articles = new ConcurrentHashMap<>();


    @SneakyThrows
    private Article build(Long articleId, Row row) {
        return new Article(articleId,
                row.get("title", String.class),
                row.get("authored", LocalDate.class),
                new ArrayList<>());
    }

    @Override
    public Article apply(Row row, RowMetadata rowMetadata) {
        var articleId = row.get("article_id", Long.class);
        var commentId = row.get("comment_id", Long.class);
        var article = this.articles.computeIfAbsent(articleId,
                arId -> build(arId, row));
        if (commentId > 0) {
            article.comments().add(new Comment(commentId, row.get("comment", String.class)));
        }
        return article;
    }
}
