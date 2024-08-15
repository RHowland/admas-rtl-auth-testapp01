-- File Name: Export_Role_Permissions_Table.sql
-- 
-- File edited by Rich Howland, 2024-08-15
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: role_permissions
DROP TABLE IF EXISTS role_permissions;


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



-- ********************************************************
-- Admin permissions, id starts with 1, id ends with 11
-- role_id = 1

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
                                'CanAccessDashboardPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanAccessUserDataPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanAccessContentPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanAccessAnalyticsPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanAccessProposalPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanAccessLogDataPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanReadContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanUpdateContentText',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanUpdateContentImages',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanPublishContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanAccessPriceQuotePage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- SaleMgr Permissions,  id starts with 12, id ends with 22
-- role_id = 2

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
                                2,
                                'SalesMgr',
                                1,
                                'CanAccessDashboardPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                13,
                                2,
                                'SalesMgr',
                                2,
                                'CanAccessUserDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanAccessContentPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanAccessAnalyticsPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                'CanAccessProposalPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'CanAccessLogDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                7,
                                'CanReadContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                8,
                                'CanUpdateContentText',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                20,
                                2,
                                'SalesMgr',
                                9,
                                'CanUpdateContentImages',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                2,
                                'SalesMgr',
                                10,
                                'CanPublishContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                2,
                                'SalesMgr',
                                11,
                                'CanAccessPriceQuotePage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- SalesPerson Permissions,  id starts with 23, id ends with 33
-- role_id = 3

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
                                1,
                                'CanAccessDashboardPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                2,
                                'CanAccessUserDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                25,
                                3,
                                'SalesPerson',
                                3,
                                'CanAccessContentPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                3,
                                'SalesPerson',
                                4,
                                'CanAccessAnalyticsPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                3,
                                'SalesPerson',
                                5,
                                'CanAccessProposalPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                3,
                                'SalesPerson',
                                6,
                                'CanAccessLogDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                3,
                                'SalesPerson',
                                7,
                                'CanReadContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                3,
                                'SalesPerson',
                                8,
                                'CanUpdateContentText',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                3,
                                'SalesPerson',
                                9,
                                'CanUpdateContentImages',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                32,
                                3,
                                'SalesPerson',
                                10,
                                'CanPublishContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                3,
                                'SalesPerson',
                                11,
                                'CanAccessPriceQuotePage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- ContentMgr Permissions,  id starts with 34, id ends with 44
-- role_id = 4

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
                                4,
                                'ContentMgr',
                                1,
                                'CanAccessDashboardPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                4,
                                'ContentMgr',
                                2,
                                'CanAccessUserDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                4,
                                'ContentMgr',
                                3,
                                'CanAccessContentPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                37,
                                4,
                                'ContentMgr',
                                4,
                                'CanAccessAnalyticsPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                4,
                                'ContentMgr',
                                5,
                                'CanAccessProposalPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                4,
                                'ContentMgr',
                                6,
                                'CanAccessLogDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                4,
                                'ContentMgr',
                                7,
                                'CanReadContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                4,
                                'ContentMgr',
                                8,
                                'CanUpdateContentText',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                4,
                                'ContentMgr',
                                9,
                                'CanUpdateContentImages',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                4,
                                'ContentMgr',
                                10,
                                'CanPublishContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                4,
                                'ContentMgr',
                                11,
                                'CanAccessPriceQuotePage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- ContentEditor Permissions,  id starts with 45, id ends with 55
-- role_id = 5

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
                                5,
                                'ContentEditor',
                                1,
                                'CanAccessDashboardPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                5,
                                'ContentEditor',
                                2,
                                'CanAccessUserDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                5,
                                'ContentEditor',
                                3,
                                'CanAccessContentPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                5,
                                'ContentEditor',
                                4,
                                'CanAccessAnalyticsPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                49,
                                5,
                                'ContentEditor',
                                5,
                                'CanAccessProposalPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                50,
                                5,
                                'ContentEditor',
                                6,
                                'CanAccessLogDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                5,
                                'ContentEditor',
                                7,
                                'CanReadContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                5,
                                'ContentEditor',
                                8,
                                'CanUpdateContentText',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                5,
                                'ContentEditor',
                                9,
                                'CanUpdateContentImages',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                5,
                                'ContentEditor',
                                10,
                                'CanPublishContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                5,
                                'ContentEditor',
                                11,
                                'CanAccessPriceQuotePage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- Client Permissions,  id starts with 56, id ends with 66
-- role_id = 6

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
                                6,
                                'Client',
                                1,
                                'CanAccessDashboardPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'Client',
                                2,
                                'CanAccessUserDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'Client',
                                3,
                                'CanAccessContentPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'Client',
                                4,
                                'CanAccessAnalyticsPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'Client',
                                5,
                                'CanAccessProposalPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'Client',
                                6,
                                'CanAccessLogDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                62,
                                6,
                                'Client',
                                7,
                                'CanReadContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'Client',
                                8,
                                'CanUpdateContentText',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'Client',
                                9,
                                'CanUpdateContentImages',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'Client',
                                10,
                                'CanPublishContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                6,
                                'Client',
                                11,
                                'CanAccessPriceQuotePage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- PWSAdmin Permissions,  id starts with 67, id ends with 77
-- role_id = 7

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
                                7,
                                'PWSAdmin',
                                1,
                                'CanAccessDashboardPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                7,
                                'PWSAdmin',
                                2,
                                'CanAccessUserDataPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                7,
                                'PWSAdmin',
                                3,
                                'CanAccessContentPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                7,
                                'PWSAdmin',
                                4,
                                'CanAccessAnalyticsPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                7,
                                'PWSAdmin',
                                5,
                                'CanAccessProposalPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                7,
                                'PWSAdmin',
                                6,
                                'CanAccessLogDataPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                7,
                                'PWSAdmin',
                                7,
                                'CanReadContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                74,
                                7,
                                'PWSAdmin',
                                8,
                                'CanUpdateContentText',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                75,
                                7,
                                'PWSAdmin',
                                9,
                                'CanUpdateContentImages',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                76,
                                7,
                                'PWSAdmin',
                                10,
                                'CanPublishContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                77,
                                7,
                                'PWSAdmin',
                                11,
                                'CanAccessPriceQuotePage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- PWSTechSupport Permissions,  id starts with 78, id ends with 88
-- role_id = 8

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
                                78,
                                8,
                                'PWSTechSupport',
                                1,
                                'CanAccessDashboardPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                79,
                                8,
                                'PWSTechSupport',
                                2,
                                'CanAccessUserDataPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                80,
                                8,
                                'PWSTechSupport',
                                3,
                                'CanAccessContentPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                81,
                                8,
                                'PWSTechSupport',
                                4,
                                'CanAccessAnalyticsPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                82,
                                8,
                                'PWSTechSupport',
                                5,
                                'CanAccessProposalPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                83,
                                8,
                                'PWSTechSupport',
                                6,
                                'CanAccessLogDataPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                84,
                                8,
                                'PWSTechSupport',
                                7,
                                'CanReadContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                85,
                                8,
                                'PWSTechSupport',
                                8,
                                'CanUpdateContentText',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                86,
                                8,
                                'PWSTechSupport',
                                9,
                                'CanUpdateContentImages',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                87,
                                8,
                                'PWSTechSupport',
                                10,
                                'CanPublishContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                88,
                                8,
                                'PWSTechSupport',
                                11,
                                'CanAccessPriceQuotePage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- PWSCustService Permissions,  id starts with 89, id ends with 99
-- role_id = 9

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
                                89,
                                9,
                                'PWSCustService',
                                1,
                                'CanAccessDashboardPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                90,
                                9,
                                'PWSCustService',
                                2,
                                'CanAccessUserDataPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                91,
                                9,
                                'PWSCustService',
                                3,
                                'CanAccessContentPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                92,
                                9,
                                'PWSCustService',
                                4,
                                'CanAccessAnalyticsPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                93,
                                9,
                                'PWSCustService',
                                5,
                                'CanAccessProposalPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                94,
                                9,
                                'PWSCustService',
                                6,
                                'CanAccessLogDataPage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                95,
                                9,
                                'PWSCustService',
                                7,
                                'CanReadContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                96,
                                9,
                                'PWSCustService',
                                8,
                                'CanUpdateContentText',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                97,
                                9,
                                'PWSCustService',
                                9,
                                'CanUpdateContentImages',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                98,
                                9,
                                'PWSCustService',
                                10,
                                'CanPublishContent',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                99,
                                9,
                                'PWSCustService',
                                11,
                                'CanAccessPriceQuotePage',
                                'Y',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- ExtraRole01 Permissions,  id starts with 100, id ends with 110
-- role_id = 10

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
                                100,
                                10,
                                'ExtraRole01',
                                1,
                                'CanAccessDashboardPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                101,
                                10,
                                'ExtraRole01',
                                2,
                                'CanAccessUserDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                102,
                                10,
                                'ExtraRole01',
                                3,
                                'CanAccessContentPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                103,
                                10,
                                'ExtraRole01',
                                4,
                                'CanAccessAnalyticsPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                104,
                                10,
                                'ExtraRole01',
                                5,
                                'CanAccessProposalPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                105,
                                10,
                                'ExtraRole01',
                                6,
                                'CanAccessLogDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                106,
                                10,
                                'ExtraRole01',
                                7,
                                'CanReadContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                107,
                                10,
                                'ExtraRole01',
                                8,
                                'CanUpdateContentText',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                108,
                                10,
                                'ExtraRole01',
                                9,
                                'CanUpdateContentImages',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                109,
                                10,
                                'ExtraRole01',
                                10,
                                'CanPublishContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                110,
                                10,
                                'ExtraRole01',
                                11,
                                'CanAccessPriceQuotePage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- ExtraRole02 Permissions,  id starts with 111, id ends with 121
-- role_id = 11

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
                                111,
                                11,
                                'ExtraRole02',
                                1,
                                'CanAccessDashboardPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                112,
                                11,
                                'ExtraRole02',
                                2,
                                'CanAccessUserDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                113,
                                11,
                                'ExtraRole02',
                                3,
                                'CanAccessContentPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                114,
                                11,
                                'ExtraRole02',
                                4,
                                'CanAccessAnalyticsPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                115,
                                11,
                                'ExtraRole02',
                                5,
                                'CanAccessProposalPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                116,
                                11,
                                'ExtraRole02',
                                6,
                                'CanAccessLogDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                117,
                                11,
                                'ExtraRole02',
                                7,
                                'CanReadContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                118,
                                11,
                                'ExtraRole02',
                                8,
                                'CanUpdateContentText',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                119,
                                11,
                                'ExtraRole02',
                                9,
                                'CanUpdateContentImages',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                120,
                                11,
                                'ExtraRole02',
                                10,
                                'CanPublishContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                121,
                                11,
                                'ExtraRole02',
                                11,
                                'CanAccessPriceQuotePage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- ********************************************************
-- ExtraRole03 Permissions,  id starts with 122, id ends with 132
-- role_id = 12

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
                                122,
                                12,
                                'ExtraRole03',
                                1,
                                'CanAccessDashboardPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                123,
                                12,
                                'ExtraRole03',
                                2,
                                'CanAccessUserDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                124,
                                12,
                                'ExtraRole03',
                                3,
                                'CanAccessContentPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                125,
                                12,
                                'ExtraRole03',
                                4,
                                'CanAccessAnalyticsPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                126,
                                12,
                                'ExtraRole03',
                                5,
                                'CanAccessProposalPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                127,
                                12,
                                'ExtraRole03',
                                6,
                                'CanAccessLogDataPage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                128,
                                12,
                                'ExtraRole03',
                                7,
                                'CanReadContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                129,
                                12,
                                'ExtraRole03',
                                8,
                                'CanUpdateContentText',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                130,
                                12,
                                'ExtraRole03',
                                9,
                                'CanUpdateContentImages',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                131,
                                12,
                                'ExtraRole03',
                                10,
                                'CanPublishContent',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
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
                                132,
                                12,
                                'ExtraRole03',
                                11,
                                'CanAccessPriceQuotePage',
                                'N',
                                '2024-08-15 00:15:00',
                                '2024-08-15 00:15:00'
                            );

-- Index: unique_role_permissions
DROP INDEX IF EXISTS unique_role_permissions;

CREATE UNIQUE INDEX IF NOT EXISTS unique_role_permissions ON role_permissions (
    role_id,
    permission_id
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
