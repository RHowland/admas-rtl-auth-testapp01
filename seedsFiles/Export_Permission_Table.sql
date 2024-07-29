--
-- File generated with SQLiteStudio v3.4.4 on Tue Jul 23 22:28:18 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: permission
-- DROP TABLE IF EXISTS permissions;

CREATE TABLE IF NOT EXISTS permissions (
    permission_id      INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    permission_name    TEXT NOT NULL,
    permission_type    TEXT NOT NULL CHECK(permission_type IN ('page', 'content')),
    created_at         TEXT DEFAULT CURRENT_TIMESTAMP,
	updated_at         TEXT
);


INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           1,
                           'Dashboard Menu',
                           'page',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           2,
                           'UserData Page',
                           'page',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           3,
                           'Content Page',
                           'page',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           4,
                           'Analytics Page',
                           'page',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           5,
                           'Proposal Page',
                           'page',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           6,
                           'LogData Page',
                           'page',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           7,
                           'Read Content',
                           'content',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           8,
                           'Update Text',
                           'content',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           9,
                           'Update Images',
                           'content',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           10,
                           'Publish Content',
                           'content',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           11,
                           'Create Proposal',
                           'content',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );

INSERT INTO permissions (
                           permission_id,
                           permission_name,
                           permission_type,
                           created_at,
                           updated_at
                       )
                       VALUES (
                           12,
                           'Create Price Quote',
                           'content',
                           '2024-07-09 11:19:59',
                           '2024-07-20 10:15:00'
                       );


-- Index: permission_name_unique
-- DROP INDEX IF EXISTS permission_name_unique;

CREATE UNIQUE INDEX IF NOT EXISTS permission_name_unique ON permissions (
    permission_name
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
