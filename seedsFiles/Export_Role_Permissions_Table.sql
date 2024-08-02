--
-- File generated with SQLiteStudio v3.4.4 on Tue Jul 23 23:36:52 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: role_permissions
-- DROP TABLE IF EXISTS role_permissions;


CREATE TABLE IF NOT EXISTS role_permissions (
    id                  INTEGER    PRIMARY KEY AUTOINCREMENT NOT NULL,
    role_id             INTEGER    NOT NULL,
    role_name           TEXT (255) NOT NULL,
    permission_id       INTEGER    NOT NULL,
    permission_name     TEXT (255) NOT NULL,
    is_permitted        TEXT NOT NULL CHECK(is_permitted IN ('Y', 'N')),
    created_at          TEXT DEFAULT (current_timestamp),
	updated_at          TEXT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (role_name) REFERENCES roles(role_name) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (permission_id) REFERENCES permissions(permission_id) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (permission_name) REFERENCES permissions(permission_name) ON UPDATE no action ON DELETE cascade
);




-- Admin access permissions

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                1,
                                1,
                                'Admin',
                                1,
                                'Dashboard Menu',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                2,
                                1,
                                'Admin',
                                2,
                                'UserData Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                3,
                                1,
                                'Admin',
                                3,
                                'Content Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                4,
                                1,
                                'Admin',
                                4,
                                'Analytics Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                5,
                                1,
                                'Admin',
                                5,
                                'Proposal Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                6,
                                1,
                                'Admin',
                                6,
                                'LogData Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                7,
                                1,
                                'Admin',
                                7,
                                'Read Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                8,
                                1,
                                'Admin',
                                8,
                                'Update Text',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                9,
                                1,
                                'Admin',
                                9,
                                'Update Images',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                10,
                                1,
                                'Admin',
                                10,
                                'Publish Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                11,
                                1,
                                'Admin',
                                11,
                                'Create Proposal',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                12,
                                1,
                                'Admin',
                                12,
                                'Create Price Quote',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );


-- SalesMgr access permissions

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                13,
                                2,
                                'SalesMgr',
                                1,
                                'Dashboard Menu',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                14,
                                2,
                                'SalesMgr',
                                3,
                                'Content Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                15,
                                2,
                                'SalesMgr',
                                4,
                                'Analytics Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                16,
                                2,
                                'SalesMgr',
                                5,
                                'Proposal Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                17,
                                2,
                                'SalesMgr',
                                7,
                                'Read Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                18,
                                2,
                                'SalesMgr',
                                11,
                                'Create Proposal',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                19,
                                2,
                                'SalesMgr',
                                12,
                                'Create Price Quote',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );


-- SalesPerson access permissions

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                20,
                                3,
                                'SalesPerson',
                                1,
                                'Dashboard Menu',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                21,
                                3,
                                'SalesPerson',
                                5,
                                'Proposal Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                22,
                                3,
                                'SalesPerson',
                                7,
                                'Read Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                23,
                                3,
                                'SalesPerson',
                                11,
                                'Create Proposal',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                24,
                                3,
                                'SalesPerson',
                                12,
                                'Create Price Quote',
                                'N',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );




-- ContentMgr access permissions

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                25,
                                4,
                                'ContentMgr',
                                1,
                                'Dashboard Menu',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                26,
                                4,
                                'ContentMgr',
                                3,
                                'Content Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                27,
                                4,
                                'ContentMgr',
                                4,
                                'Analytics Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                28,
                                4,
                                'ContentMgr',
                                7,
                                'Read Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                29,
                                4,
                                'ContentMgr',
                                8,
                                'Update Text',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                30,
                                4,
                                'ContentMgr',
                                9,
                                'Update Images',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                31,
                                4,
                                'ContentMgr',
                                10,
                                'Publish Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );




-- ContentEditor access permissions

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                32,
                                5,
                                'ContentEditor',
                                1,
                                'Dashboard Menu',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                33,
                                5,
                                'ContentEditor',
                                7,
                                'Read Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                34,
                                5,
                                'ContentEditor',
                                8,
                                'Update Text',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                35,
                                5,
                                'ContentEditor',
                                9,
                                'Update Images',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                36,
                                5,
                                'ContentEditor',
                                10,
                                'Publish Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );


-- PWSAdmin access permissions



INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                37,
                                7,
                                'PWSAdmin',
                                1,
                                'Dashboard Menu',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                38,
                                7,
                                'PWSAdmin',
                                2,
                                'UserData Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                39,
                                7,
                                'PWSAdmin',
                                3,
                                'Content Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                40,
                                7,
                                'PWSAdmin',
                                4,
                                'Analytics Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                41,
                                7,
                                'PWSAdmin',
                                5,
                                'Proposal Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                42,
                                7,
                                'PWSAdmin',
                                6,
                                'LogData Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                43,
                                7,
                                'PWSAdmin',
                                7,
                                'Read Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                44,
                                7,
                                'PWSAdmin',
                                8,
                                'Update Text',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                45,
                                7,
                                'PWSAdmin',
                                9,
                                'Update Images',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                46,
                                7,
                                'PWSAdmin',
                                10,
                                'Publish Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                47,
                                7,
                                'PWSAdmin',
                                11,
                                'Create Proposal',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                48,
                                7,
                                'PWSAdmin',
                                12,
                                'Create Price Quote',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );



-- PWSTechSupport access permissions

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                50,
                                8,
                                'PWSTechSupport',
                                1,
                                'Dashboard Menu',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                51,
                                8,
                                'PWSTechSupport',
                                2,
                                'UserData Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                52,
                                8,
                                'PWSTechSupport',
                                3,
                                'Content Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                53,
                                8,
                                'PWSTechSupport',
                                4,
                                'Analytics Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                54,
                                8,
                                'PWSTechSupport',
                                5,
                                'Proposal Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                55,
                                8,
                                'PWSTechSupport',
                                6,
                                'LogData Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                56,
                                8,
                                'PWSTechSupport',
                                7,
                                'Read Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                57,
                                8,
                                'PWSTechSupport',
                                8,
                                'Update Text',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                58,
                                8,
                                'PWSTechSupport',
                                9,
                                'Update Images',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                59,
                                8,
                                'PWSTechSupport',
                                10,
                                'Publish Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                60,
                                8,
                                'PWSTechSupport',
                                11,
                                'Create Proposal',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                61,
                                8,
                                'PWSTechSupport',
                                12,
                                'Create Price Quote',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );


-- PWSCustService access permissions

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                62,
                                9,
                                'PWSCustService',
                                1,
                                'Dashboard Menu',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                63,
                                9,
                                'PWSCustService',
                                2,
                                'UserData Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                64,
                                9,
                                'PWSCustService',
                                3,
                                'Content Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                65,
                                9,
                                'PWSCustService',
                                4,
                                'Analytics Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                66,
                                9,
                                'PWSCustService',
                                5,
                                'Proposal Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                67,
                                9,
                                'PWSCustService',
                                6,
                                'LogData Page',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                68,
                                9,
                                'PWSCustService',
                                7,
                                'Read Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                69,
                                9,
                                'PWSCustService',
                                8,
                                'Update Text',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                70,
                                9,
                                'PWSCustService',
                                9,
                                'Update Images',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                71,
                                9,
                                'PWSCustService',
                                10,
                                'Publish Content',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                72,
                                9,
                                'PWSCustService',
                                11,
                                'Create Proposal',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                73,
                                9,
                                'PWSCustService',
                                12,
                                'Create Price Quote',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );



-- Client access permissions

INSERT INTO role_permissions (
                                id,
                                role_id,
                                role_name,
                                permission_id,
                                permission_name,
                                is_permitted,
                                created_at,
                                updated_at
                            )
                            VALUES (
                                49,
                                6,
                                'Client',
                                12,
                                'Create Price Quote',
                                'Y',
                                '2024-07-09 11:19:59',
                                '2024-07-20 10:25:30'
                            );

-- Index: unique_role_permissions
-- DROP INDEX IF EXISTS unique_role_permissions;

CREATE UNIQUE INDEX IF NOT EXISTS unique_role_permissions ON role_permissions (
    role_id,
    permission_id
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;