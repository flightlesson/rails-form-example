-- roles_users.fragment.sql
-- #requires roles
-- #requires users
-- #provides roles_users

create table roles_users (
  role_id INT NOT NULL REFERENCES roles(id),
  user_id INT NOT NULL REFERENCES users(id)
);
