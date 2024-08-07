import { sql } from "drizzle-orm";
import { text, integer, sqliteTable, uniqueIndex , primaryKey  } from "drizzle-orm/sqlite-core";

// User table with roles as a comma-separated string
export const users = sqliteTable("users", {
  id: integer("id", {
    mode: 'number'
  }).primaryKey({ autoIncrement: true }),
  userName: text("user_name", {
    length: 255,
  }),
  userFirstName: text("user_first_name", {
    length: 255,
  }),
  userLastName: text("user_last_name", {
    length: 255,
  }),
  userEmail: text("user_email", {
    length: 255,
  }).unique().notNull(),
  hashedPassword: text("hashed_password", {
    length: 255,
  }),
  bypassRbacFlag: text("bypass_rbac_flag", {
    length: 2,
  }),
  softDeleteFlag:  text("soft_delete_flag", {
    length: 2,
  }),
  otp: text("one_time_password"),
  securityQuestion1 : text("security_question_1"),
  securityAnswer1 : text("security_answer_1"),
  securityQuestion2 : text("security_question_2"),
  securityAnswer2 : text("security_answer_2"),
  deletedAt: text("deleted_at"),
  isVerified: integer('is_verified', { mode: 'boolean' }).notNull().default(false),
  createdAt: text("created_at").default(sql`current_timestamp`),
  updatedAt: text("updated_at"),
});

export const failedLoginAttempts = sqliteTable("failed_login_attempts", {
  id: integer("id", {
    mode: 'number'
  }).primaryKey({ autoIncrement: true }),
    userEmail: text('user_email').notNull().references(() => users.userEmail, { onDelete: 'cascade' }).notNull(),
    reason: text('reason'),
    timeStamp: text("timestamp").notNull(),
},(table) => ({
  unique: uniqueIndex("unique_failed_login_attempts").on(table.userEmail, table.timeStamp)
}))


export const userRoles = sqliteTable("user_roles", {
  userRoleId: integer("user_role_id", {
    mode: 'number'
  }).primaryKey({ autoIncrement: true }),
  userId: integer("user_id").references(() => users.id, { onDelete: 'cascade' }).notNull(),
  userEmail: text("user_email", {
    length: 255,
  }).references(() => users.userEmail, { onDelete: 'cascade' }).notNull(),
  roleId: integer("role_id").references(() => roles.roleId, { onDelete: 'cascade' }).notNull(),
  roleName: text("role_name", {
    length: 255,
  }).references(() => roles.roleName, { onDelete: 'cascade' }).notNull(),
  createdAt: text("created_at").default(sql`current_timestamp`),
  updatedAt: text("updated_at"),
}, (table) => ({
  unique: uniqueIndex("unique_user_role").on(table.userId, table.roleId)
}));




// Role table
export const roles = sqliteTable("roles", {
  roleId: integer("role_id", {
    mode: 'number'
  }).primaryKey({ autoIncrement: true }),
  roleName: text("role_name", {
    length: 255,
  }).unique().notNull(),
  isVisible: text("is_visible", {
    enum: ["Y" , "N"], 
  }).notNull(), 
  createdAt: text("created_at").default(sql`current_timestamp`),
  updatedAt: text("updated_at"),
});



// Permission table
export const permissions = sqliteTable("permissions", {
  permissionId: integer("permission_id", {
    mode: 'number'
  }).primaryKey({ autoIncrement: true }),
  permissionName: text("permission_name", {
    length: 255,
  }).unique().notNull(),
  permissionType : text("permission_type", {
    enum: ["content" , "page"], 
  }).notNull(),
  createdAt: text("created_at").default(sql`current_timestamp`),
  updatedAt: text("updated_at"),
});

// RolePermission table


export const rolePermissions = sqliteTable("role_permissions", {
  id: integer("id", {
    mode: 'number'
  }).primaryKey({ autoIncrement: true }),
  roleId: integer("role_id").references(() => roles.roleId, { onDelete: 'cascade' }).notNull(),
  roleName: text("role_name", {
    length: 255,
  }).references(() => roles.roleName, { onDelete: 'cascade' }).notNull(),
  permissionId: integer("permission_id").references(() => permissions.permissionId, { onDelete: 'cascade' }).notNull(),
  permissionName: text("permission_name", {
    length: 255,
  }).references(() => permissions.permissionName, { onDelete: 'cascade' }).notNull(),
  isPermitted: text("is_permitted", {
    enum: [ "Y" , "N"]
  }).notNull(),
  createdAt: text("created_at").default(sql`current_timestamp`),
  updatedAt: text("updated_at"),
}, (table) => ({
  unique: uniqueIndex("unique_role_permission").on(table.roleId, table.permissionId)
}));

export const verificationTokens = sqliteTable("verification_tokens", {
  token: text("token", {
    length: 255, 
  }).notNull().unique().primaryKey(),
  userId: integer("user_id").references(() => users.id, {onDelete: 'cascade'}).notNull(),  
  type: text("type", {
    enum: ["resetPass", "signUpVerify" , "newPassword"], 
  }).notNull(),
  expiresAt: integer("expires_at").notNull(),
});


export const sessions = sqliteTable("sessions", {
  id: text("id", {
    length: 128,
  }).primaryKey(),
  email: text("email", {
    length: 255,
  }),
  userName: text("user_name", {
    length: 255,
  }),
  userId: text("user_id", {
    length: 50,
  }).notNull()
    .references(() => users.id),
    expiresAt: integer("expires_at").notNull(),
});








// import { sql } from "drizzle-orm";
// import { text, integer, sqliteTable } from "drizzle-orm/sqlite-core";

// export const user = sqliteTable("user", {
//   id: text("id", {
//     length: 128, 
//   }).primaryKey(),
//   name: text("name", {
//     length: 255,
//   }),
//   email: text("email", {
//     length: 255,
//   }).unique().notNull(),
//   hashedPassword: text("hashed_password", {
//     length: 255,
//   }),
//   isVerified: integer('is_verified', { mode: 'boolean' }).notNull().default(false),
//   createdAt: integer("created_at").notNull().default(sql`current_timestamp`),
//   updatedAt: integer("updated_at").notNull(),
// });

// export const verificationToken = sqliteTable("verification_token", {
//   token: text("token", {
//     length: 255, 
//   }).notNull().unique().primaryKey(),
//   userId: text("user_id").references(() => user.id, {onDelete: 'cascade'}).notNull(),  
//   type: text("type", {
//     enum: ["resetPass", "signUpVerify" , "newPassword"], 
//   }).notNull(),
//   createdAt: integer("created_at").notNull().default(sql`current_timestamp`),
//   expiresAt: integer("expires_at").notNull(), 
// });


// export const session = sqliteTable("session", {
//   id: text("id", {
//     length: 128,
//   }).primaryKey(),
//   email: text("email", {
//     length: 255,
//   }),
//   name: text("name", {
//     length: 255,
//   }),
//   userId: text("user_id", {
//     length: 50,
//   }).notNull()
//     .references(() => user.id),
//     expires_at: integer("expires_at").notNull(),
// });
