
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS sessions (
	id TEXT(128) PRIMARY KEY NOT NULL,
	email TEXT(255),
	user_name TEXT(255),
	user_id TEXT(50) NOT NULL,
	expires_at integer NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE no action ON DELETE no action
);

CREATE TABLE IF NOT EXISTS verification_tokens (
	token TEXT(255) PRIMARY KEY NOT NULL,
	user_id TEXT NOT NULL,
	type TEXT NOT NULL,
	expires_at integer NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE no action ON DELETE cascade
);
CREATE UNIQUE INDEX IF NOT EXISTS verification_tokens_token_unique ON verification_tokens (token);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;