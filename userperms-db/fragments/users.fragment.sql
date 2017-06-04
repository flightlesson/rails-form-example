-- users.fragment.sql
-- #requires authentication_methods
-- #provides users

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL UNIQUE,
  realname TEXT,
  authentication_methods_id INT NOT NULL REFERENCES authentication_methods(id),
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);

