-- permissions.fragment.sql
-- #provides permissions

CREATE TABLE permissions (
  id SERIAL PRIMARY KEY,
  permission TEXT NOT NULL UNIQUE,
  descr TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);
