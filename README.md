# Experimenting will Dojo widgets in a Rails application

This application uses form to allow editing of users, roles, and permissions tables
where there are many-many relations between users and roles and between roles and permissions.

create table users (
  id int unique not null primary key,
  username text unique not null,
  realname text not null,
  authenticationMethod int references authenticationMethods(id) not null,
);

create table authenticationMethods (
  id int unique not null primary key,
  methodname text unique not null,
  descr text
);

create table roles (
  id int unique not null primary key,
  rolename text unique not null,
  descr text
);

create table users_roles (
  userid int not null references users(id),
  roleid int not null references roles(id),
  unique(userid,roleid)
);

create table permissions (
  id int unique not null primary key,
  permission text not null unique,
  descr text
);

create table roles_permissions (
  roleid int references roles(id),
  permissionid int references permissions(id),
  unique(roleid,permissionid)
);
