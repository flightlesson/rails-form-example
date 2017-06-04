-- authentication_methods.fragment.sql
-- #provides authentication_methods

CREATE TABLE authentication_methods (
  id SERIAL PRIMARY KEY,
  methodname TEXT NOT NULL UNIQUE,
  descr TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);
