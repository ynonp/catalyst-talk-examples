-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Tue Jan 28 23:29:06 2014
-- 

;
BEGIN TRANSACTION;
--
-- Table: contacts
--
CREATE TABLE contacts (
  id INTEGER PRIMARY KEY NOT NULL,
  name text NOT NULL,
  email text NOT NULL
);
CREATE UNIQUE INDEX name_unique ON contacts (name);
--
-- Table: roles
--
CREATE TABLE roles (
  id INTEGER PRIMARY KEY NOT NULL,
  name text NOT NULL
);
CREATE UNIQUE INDEX name_unique02 ON roles (name);
--
-- Table: user_roles
--
CREATE TABLE user_roles (
  user_id integer NOT NULL,
  role_id integer NOT NULL,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX user_roles_idx_role_id ON user_roles (role_id);
CREATE INDEX user_roles_idx_user_id ON user_roles (user_id);
--
-- Table: users
--
CREATE TABLE users (
  id INTEGER PRIMARY KEY NOT NULL,
  active char(1) NOT NULL,
  username text NOT NULL,
  password text NOT NULL,
  password_expires timestamp,
  name text NOT NULL,
  email_address text NOT NULL
);
CREATE UNIQUE INDEX username_unique ON users (username);
COMMIT;
