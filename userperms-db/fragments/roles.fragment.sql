-- roles.fragment.sql
-- #provides roles

CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  role TEXT NOT NULL UNIQUE,
  descr TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);
