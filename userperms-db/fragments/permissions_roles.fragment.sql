-- permissions_roles.fragment.sql
-- #requires roles
-- #requires permissions
-- #provides permissions_roles

create table permissions_roles (
  role_id INT NOT NULL REFERENCES roles(id),
  permission_id INT NOT NULL REFERENCES permissions(id)
);
