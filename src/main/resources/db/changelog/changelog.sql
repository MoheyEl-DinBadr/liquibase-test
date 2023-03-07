--liquibase formatted sql

-- changeset moheyeldinbadr:1677903642770-1
-- preconditions onFail:MARK_RAN on_Error:MARK_RAN
-- precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_name='article'
CREATE TABLE "article" ("id" BIGINT NOT NULL, "title" VARCHAR(255), "authored" date, CONSTRAINT "article_pkey" PRIMARY KEY ("id"));
-- rollback drop table article cascade;

-- changeset moheyeldinbadr:1677903642770-2
-- preconditions onFail:MARK_RAN on_Error:MARK_RAN
-- precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_name = 'comment'
CREATE TABLE "comment" ("id" BIGINT NOT NULL, "comment" VARCHAR(255), "article_id" BIGINT NOT NULL, CONSTRAINT "comment_pkey" PRIMARY KEY ("id"));
ALTER TABLE "comment" ADD CONSTRAINT "comment_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "article" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;
-- rollback drop table comment;

-- changeset moheyeldinbadr:data
-- preconditions onFail:MARK_RAN on_Error:MARK_RAN
-- precondition-sql-check expectedResult:0 select count(*) from article
INSERT INTO "article"(id, title, authored) VALUES (1, 'testTitle', NOW());
INSERT INTO "comment"(id, comment, article_id) VALUES (1, 'testComment', 1);
-- rollback truncate article, comment;
