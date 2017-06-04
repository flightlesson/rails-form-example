-- NOTICE: this file was machine generated; see Makefile!
-- Sun Jun 4 08:04:18 EDT 2017

-- authentication_methods.fragment.sql
-- #provides authentication_methods

CREATE TABLE authentication_methods (
  id SERIAL PRIMARY KEY,
  methodname TEXT NOT NULL UNIQUE,
  descr TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);
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

-- permissions.fragment.sql
-- #provides permissions

CREATE TABLE permissions (
  id SERIAL PRIMARY KEY,
  permission TEXT NOT NULL UNIQUE,
  descr TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);
-- roles.fragment.sql
-- #provides roles

CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  role TEXT NOT NULL UNIQUE,
  descr TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);
-- roles_users.fragment.sql
-- #requires roles
-- #requires users
-- #provides roles_users

create table roles_users (
  role_id INT NOT NULL REFERENCES roles(id),
  user_id INT NOT NULL REFERENCES users(id)
);
-- permissions_roles.fragment.sql
-- #requires roles
-- #requires permissions
-- #provides permissions_roles

create table permissions_roles (
  role_id INT NOT NULL REFERENCES roles(id),
  permission_id INT NOT NULL REFERENCES permissions(id)
);
