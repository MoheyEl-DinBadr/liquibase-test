-- liquibase formatted sql

-- changeset moheyeldinbadr:1677903642770-1
CREATE TABLE "article" ("id" BIGINT NOT NULL, "title" VARCHAR(255), "authored" date, CONSTRAINT "article_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677903642770-2
CREATE TABLE "comment" ("id" BIGINT NOT NULL, "comment" VARCHAR(255), "article_id" BIGINT NOT NULL, CONSTRAINT "comment_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677903642770-3
ALTER TABLE "comment" ADD CONSTRAINT "comment_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "article" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- liquibase formatted sql

-- liquibase formatted sql

-- changeset moheyeldinbadr:1677906545959-1
CREATE TABLE "article" ("id" BIGINT NOT NULL, "title" VARCHAR(255), "authored" date, CONSTRAINT "article_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677906545959-2
CREATE TABLE "comment" ("id" BIGINT NOT NULL, "comment" VARCHAR(255), "article_id" BIGINT NOT NULL, CONSTRAINT "comment_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677906545959-3
ALTER TABLE "comment" ADD CONSTRAINT "comment_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "article" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- liquibase formatted sql

-- changeset moheyeldinbadr:1677906756949-1
CREATE TABLE "article" ("id" BIGINT NOT NULL, "title" VARCHAR(255), "authored" date, CONSTRAINT "article_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677906756949-2
CREATE TABLE "comment" ("id" BIGINT NOT NULL, "comment" VARCHAR(255), "article_id" BIGINT NOT NULL, CONSTRAINT "comment_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677906756949-3
ALTER TABLE "comment" ADD CONSTRAINT "comment_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "article" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- liquibase formatted sql

-- changeset moheyeldinbadr:1677906766269-1
CREATE TABLE "article" ("id" BIGINT NOT NULL, "title" VARCHAR(255), "authored" date, CONSTRAINT "article_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677906766269-2
CREATE TABLE "comment" ("id" BIGINT NOT NULL, "comment" VARCHAR(255), "article_id" BIGINT NOT NULL, CONSTRAINT "comment_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677906766269-3
ALTER TABLE "comment" ADD CONSTRAINT "comment_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "article" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- liquibase formatted sql

-- changeset moheyeldinbadr:1677906809675-1
CREATE TABLE "article" ("id" BIGINT NOT NULL, "title" VARCHAR(255), "authored" date, CONSTRAINT "article_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677906809675-2
CREATE TABLE "comment" ("id" BIGINT NOT NULL, "comment" VARCHAR(255), "article_id" BIGINT NOT NULL, CONSTRAINT "comment_pkey" PRIMARY KEY ("id"));

-- changeset moheyeldinbadr:1677906809675-3
ALTER TABLE "comment" ADD CONSTRAINT "comment_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "article" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

