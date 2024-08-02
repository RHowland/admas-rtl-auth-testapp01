PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS failed_login_attempts (
	id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	user_email TEXT NOT NULL,
	timestamp TEXT,
	FOREIGN KEY (user_email) REFERENCES users(user_email) ON UPDATE no action ON DELETE cascade
);
CREATE UNIQUE INDEX IF NOT EXISTS unique_failed_login_attempts ON failed_login_attempts (user_email,timestamp);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;