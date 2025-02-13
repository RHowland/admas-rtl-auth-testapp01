CREATE TABLE `failed_login_attempts` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_email` text NOT NULL,
	`reason` text,
	`timestamp` text NOT NULL,
	FOREIGN KEY (`user_email`) REFERENCES `users`(`user_email`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `permissions` (
	`permission_id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`permission_name` text(255) NOT NULL,
	`permission_type` text NOT NULL,
	`created_at` text DEFAULT current_timestamp,
	`updated_at` text
);
--> statement-breakpoint
CREATE TABLE `role_permissions` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`role_id` integer NOT NULL,
	`role_name` text(255) NOT NULL,
	`permission_id` integer NOT NULL,
	`permission_name` text(255) NOT NULL,
	`is_permitted` text NOT NULL,
	`created_at` text DEFAULT current_timestamp,
	`updated_at` text,
	FOREIGN KEY (`role_id`) REFERENCES `roles`(`role_id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`role_name`) REFERENCES `roles`(`role_name`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`permission_id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`permission_name`) REFERENCES `permissions`(`permission_name`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `roles` (
	`role_id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`role_name` text(255) NOT NULL,
	`is_visible` text NOT NULL,
	`created_at` text DEFAULT current_timestamp,
	`updated_at` text
);
--> statement-breakpoint
CREATE TABLE `sessions` (
	`id` text(128) PRIMARY KEY NOT NULL,
	`email` text(255),
	`user_name` text(255),
	`user_id` text(50) NOT NULL,
	`expires_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `user_roles` (
	`user_role_id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_id` integer NOT NULL,
	`user_email` text(255) NOT NULL,
	`role_id` integer NOT NULL,
	`role_name` text(255) NOT NULL,
	`created_at` text DEFAULT current_timestamp,
	`updated_at` text,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`user_email`) REFERENCES `users`(`user_email`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`role_id`) REFERENCES `roles`(`role_id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`role_name`) REFERENCES `roles`(`role_name`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`user_name` text(255),
	`user_first_name` text(255),
	`user_last_name` text(255),
	`user_email` text(255) NOT NULL,
	`hashed_password` text(255),
	`bypass_rbac_flag` text DEFAULT 'N' NOT NULL,
	`soft_delete_flag` text DEFAULT 'N' NOT NULL,
	`one_time_password` text,
	`user_type` text NOT NULL,
	`is_one_time_pwd_used` text DEFAULT 'N' NOT NULL,
	`security_question_1` text,
	`security_answer_1` text,
	`security_question_2` text,
	`security_answer_2` text,
	`deleted_at` text,
	`is_verified` text DEFAULT 'N' NOT NULL,
	`created_at` text DEFAULT current_timestamp,
	`updated_at` text
);
--> statement-breakpoint
CREATE TABLE `verification_tokens` (
	`token` text(255) PRIMARY KEY NOT NULL,
	`user_id` integer NOT NULL,
	`type` text NOT NULL,
	`expires_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `unique_failed_login_attempts` ON `failed_login_attempts` (`user_email`,`timestamp`);--> statement-breakpoint
CREATE UNIQUE INDEX `permissions_permission_name_unique` ON `permissions` (`permission_name`);--> statement-breakpoint
CREATE UNIQUE INDEX `unique_role_permission` ON `role_permissions` (`role_id`,`permission_id`);--> statement-breakpoint
CREATE UNIQUE INDEX `roles_role_name_unique` ON `roles` (`role_name`);--> statement-breakpoint
CREATE UNIQUE INDEX `unique_user_role` ON `user_roles` (`user_id`,`role_id`);--> statement-breakpoint
CREATE UNIQUE INDEX `users_user_email_unique` ON `users` (`user_email`);--> statement-breakpoint
CREATE UNIQUE INDEX `verification_tokens_token_unique` ON `verification_tokens` (`token`);