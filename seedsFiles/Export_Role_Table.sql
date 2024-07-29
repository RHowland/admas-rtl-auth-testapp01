--
-- File generated with SQLiteStudio v3.4.4 on Tue Jul 23 22:56:51 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: roles
-- DROP TABLE IF EXISTS roles;

CREATE TABLE IF NOT EXISTS roles (
    role_id     INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	role_name   TEXT(255) NOT NULL,
	is_visible  TEXT NOT NULL,
	created_at  TEXT DEFAULT CURRENT_TIMESTAMP,
	updated_at  TEXT
);

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     1,
                     'Admin',
					 'Y',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     2,
                     'SalesMgr',
					 'Y',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     3,
                     'SalesPerson',
					 'Y',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     4,
                     'ContentMgr',
					 'Y',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at 
                 )
                 VALUES (
                     5,
                     'ContentEditor',
					 'Y',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     6,
                     'Client',
					 'Y',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     7,
                     'PWSAdmin',
					 'Y',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     8,
                     'PWSTechSupport',
					 'Y',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );
				 
INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     9,
                     'PWSCustService',
					 'Y',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );
				 
INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     10,
                     'ExtraRole01',
					 'N',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at 
                 )
                 VALUES (
                     11,
                     'ExtraRole02',
					 'N',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );

INSERT INTO roles (
                     role_id,
                     role_name,
					 is_visible,
                     created_at,
                     updated_at
                 )
                 VALUES (
                     12,
                     'ExtraRole03',
					 'N',
                     '2024-07-09 11:19:59',
                     '2024-07-20 10:20:30'
                 );
                

-- Index: role_name_unique
-- DROP INDEX IF EXISTS role_name_unique;

CREATE UNIQUE INDEX IF NOT EXISTS role_name_unique ON roles (
    role_name
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
