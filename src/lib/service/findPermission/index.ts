import { sqliteDatabase as db } from "@root/dbConnect";

export async function hasPermission(userEmail: string, permissionName: string) {
  const result: any = await db.prepare(`
    SELECT
      CASE
        WHEN u.bypass_rbac_flag = 'Y' THEN 1
        WHEN SUM(rp.is_permitted = 'Y') > 0 THEN 1  
        ELSE 0
      END AS is_permitted
    FROM users u
    LEFT JOIN user_roles ur ON u.id = ur.user_id
    LEFT JOIN roles r ON ur.role_id = r.role_id
    LEFT JOIN role_permissions rp ON r.role_id = rp.role_id
    LEFT JOIN permissions p ON rp.permission_id = p.permission_id
    WHERE u.user_email = ? AND (u.bypass_rbac_flag = 'Y' OR p.permission_name = ?)
    GROUP BY u.id, p.permission_name;
  `).get(userEmail, permissionName);

  if (!result || !Boolean(result?.is_permitted)) return false;
  return true;
}
