
CREATE TABLE "order"
(
  id         int8      NOT NULL GENERATED ALWAYS AS IDENTITY,
  user_id    int8      NOT NULL,
  name       varchar   NOT NULL,
  status     smallint  NOT NULL DEFAULT 0,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

COMMENT ON TABLE "order" IS 'order';

CREATE TABLE pay
(
  id         int8      NOT NULL GENERATED ALWAYS AS IDENTITY,
  user_id    int8      NOT NULL,
  name       varchar   NOT NULL,
  status     smallint  NOT NULL DEFAULT 0,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

COMMENT ON TABLE pay IS 'pay';

CREATE TABLE "user"
(
  id         int8      NOT NULL GENERATED ALWAYS AS IDENTITY,
  email      varchar   NOT NULL UNIQUE,
  password   varchar  ,
  name       varchar  ,
  status     smallint  NOT NULL DEFAULT 0,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

COMMENT ON TABLE "user" IS 'user';

ALTER TABLE "order"
  ADD CONSTRAINT FK_user_TO_order
    FOREIGN KEY (user_id)
    REFERENCES "user" (id);

ALTER TABLE pay
  ADD CONSTRAINT FK_user_TO_pay
    FOREIGN KEY (user_id)
    REFERENCES "user" (id);

CREATE INDEX status
  ON "order" (status ASC);

CREATE INDEX status
  ON pay (status ASC);

