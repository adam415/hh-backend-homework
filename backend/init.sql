CREATE TYPE hh_user_type AS ENUM(
    'EMPLOYER',
    'APPLICANT'
);

CREATE TABLE hh_user(
    id                      BIGSERIAL       PRIMARY KEY,
    created_at              TIMESTAMPTZ     NOT NULL,
    updated_at              TIMESTAMPTZ     NOT NULL,
    name                    VARCHAR         NOT NULL,
    type                    hh_user_type    NOT NULL
);

CREATE TABLE hh_company(
    id                      BIGSERIAL       PRIMARY KEY,
    created_at              TIMESTAMPTZ     NOT NULL,
    updated_at              TIMESTAMPTZ     NOT NULL,
    name                    VARCHAR         NOT NULL,
    user_id                 BIGINT          REFERENCES hh_user(id)
);

CREATE TABLE hh_resume(
    id                      BIGSERIAL       PRIMARY KEY,
    created_at              TIMESTAMPTZ     NOT NULL,
    updated_at              TIMESTAMPTZ     NOT NULL,
    title                   VARCHAR         NOT NULL,
    user_id                 BIGINT          REFERENCES hh_user(id),
    experience              VARCHAR         NOT NULL,
    contacts                VARCHAR         NOT NULL
);

CREATE TABLE hh_vacancy(
    id                      BIGSERIAL       PRIMARY KEY,
    created_at              TIMESTAMPTZ     NOT NULL,
    updated_at              TIMESTAMPTZ     NOT NULL,
    title                   VARCHAR         NOT NULL,
    company_id              BIGINT          REFERENCES hh_company(id),
    salary                  BIGINT          NULL,
    description             VARCHAR         NOT NULL,
    contacts                VARCHAR         NOT NULL
);

CREATE TABLE hh_negotiation(
    id                      BIGSERIAL       PRIMARY KEY,
    created_at              TIMESTAMPTZ     NOT NULL,
    updated_at              TIMESTAMPTZ     NOT NULL,
    vacancy_id              BIGINT          REFERENCES hh_vacancy(id),
    resume_id               BIGINT          REFERENCES hh_resume(id)
);