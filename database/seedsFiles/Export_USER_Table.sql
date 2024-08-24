
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS users (
	id         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	user_name           TEXT(255),
	user_first_name     TEXT(255),
	user_last_name      TEXT(255),
	user_email          TEXT(255) NOT NULL,
	hashed_password     TEXT(255),
	bypass_rbac_flag    TEXT DEFAULT 'N' CHECK(bypass_rbac_flag IN ('Y', 'N')),
	soft_delete_flag    TEXT DEFAULT 'N' CHECK(soft_delete_flag IN ('Y', 'N')),
    one_time_password   TEXT,
    is_one_time_pwd_used  TEXT DEFAULT 'N' CHECK(is_one_time_pwd_used IN ('Y', 'N')),
    user_type           TEXT CHECK(user_type IN ('customer', 'employee', 'vendor' , 'prospect')),
	security_question_1 TEXT,
	security_answer_1   TEXT,
	security_question_2 TEXT,
	security_answer_2   TEXT,
	deleted_at          TEXT,
	is_verified         TEXT DEFAULT 'N' CHECK(is_verified IN ('Y', 'N')),
	created_at          TEXT DEFAULT (current_timestamp),
	updated_at          TEXT
);


-- NOTE: All of user's password is `Password123@` 

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (1, 'admin_user', 'Admin', 'User', 'admin@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (2, 'salesmgr_user', 'SalesMgr', 'User', 'salesmgr@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (3, 'salesperson_user', 'SalesPerson', 'User', 'salesperson@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (4, 'contentmgr_user', 'ContentMgr', 'User', 'contentmgr@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (5, 'contenteditor_user', 'ContentEditor', 'User', 'contenteditor@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (6, 'client_user', 'Client', 'User', 'client@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (7, 'pwsadmin_user', 'PWSAdmin', 'User', 'pwsadmin@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (8, 'pwstechsupport_user', 'PWSTechSupport', 'User', 'pwstechsupport@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (9, 'pwscustservice_user', 'PWSCustService', 'User', 'pwscustservice@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (10, 'extrarole01_user', 'ExtraRole01', 'User', 'extrarole01@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');

INSERT INTO users (
    id, user_name, user_first_name, user_last_name, user_email, hashed_password, bypass_rbac_flag, soft_delete_flag, is_one_time_pwd_used, user_type, is_verified, updated_at
) VALUES
    (11, 'extrarole02_user', 'ExtraRole02', 'User', 'extrarole02@example.com', '$argon2id$v=19$m=65536,t=3,p=4$h9NLlYVURVR75dUS/rYWpg$0TJQvQ6tVZ8R4Anx5wRtuh2wUusmfg8E3QwquwzZjDY', 'N', 'N', 'N', 'employee', 'Y', '2024-07-20 10:20:30');
  

--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS users_user_email_unique ON users (user_email);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

