import { sqliteDatabase as db } from "@root/dbConnect";

export async function hasPermission( userEmail : string, permissionName : string ) {
  const result : any = await db.prepare(`SELECT
    CASE
        WHEN SUM(rp.is_permitted = 'Y') > 0 THEN 1  
        ELSE 0
    END AS is_permitted
FROM users u
JOIN user_roles ur ON u.id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id
JOIN role_permissions rp ON r.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
WHERE u.user_email = '${userEmail}' AND p.permission_name = '${permissionName}'
GROUP BY rp.permission_id, p.permission_name;`).get();

  if(!result || !Boolean(result?.is_permitted)) return false;
  return true;
}