
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: user_roles

CREATE TABLE IF NOT EXISTS user_roles (
	user_role_id    INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	user_id         INTEGER NOT NULL,
	user_email      TEXT(255) NOT NULL,
	role_id         INTEGER NOT NULL,
	role_name       TEXT(255) NOT NULL,
	created_at         TEXT DEFAULT (current_timestamp),
	updated_at         TEXT,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (user_email) REFERENCES users(user_email) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (role_id) REFERENCES roles(role_id) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (role_name) REFERENCES roles(role_name) ON UPDATE no action ON DELETE cascade
);

-- Insert user role entries
INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (1, 1, 'admin@example.com', 1, 'Admin', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (2, 2, 'salesmgr@example.com', 2, 'SalesMgr', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (3, 3, 'salesperson@example.com', 3, 'SalesPerson', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (4, 4, 'contentmgr@example.com', 4, 'ContentMgr', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (5, 5, 'contenteditor@example.com', 5, 'ContentEditor', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (6, 6, 'client@example.com', 6, 'Client', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (7, 7, 'pwsadmin@example.com', 7, 'PWSAdmin', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (8, 8, 'pwstechsupport@example.com', 8, 'PWSTechSupport', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (9, 9, 'pwscustservice@example.com', 9, 'PWSCustService', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (10, 10, 'extrarole01@example.com', 10, 'ExtraRole01', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (11, 11, 'extrarole02@example.com', 11, 'ExtraRole02', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (12, 12, 'extrarole03@example.com', 12, 'ExtraRole03', '2024-07-20 10:20:30');

INSERT INTO user_roles (
    user_role_id, user_id, user_email, role_id, role_name, updated_at
) VALUES
    (13, 13, 'anonymous@example.com', 13, 'Anonymous', '2024-07-20 10:20:30');

CREATE UNIQUE INDEX IF NOT EXISTS  unique_user_role ON user_roles (user_id , role_id);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;