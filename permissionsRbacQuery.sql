-- Retrieve all permissions for all roles:

SELECT r.role_name AS role_name, rp.permission_id AS permission_id, p.permission_name AS permission_name, rp.is_permitted AS is_permitted
FROM roles r
JOIN role_permissions rp ON r.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
ORDER BY r.role_name, rp.permission_id;

-- Retrieve all permissions by specific role name:

SELECT rp.permission_id AS permission_id, p.permission_name AS permission_name, rp.is_permitted AS is_permitted
FROM roles r
JOIN role_permissions rp ON r.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
WHERE r.role_name = :role_name;


-- Retrieve all permissions of a user by user email:

SELECT rp.permission_id AS permission_id, p.permission_name AS permission_name, p.permission_type AS permission_type, r.role_name AS role, MAX(rp.is_permitted) AS is_permitted
FROM users u
JOIN user_roles ur ON u.id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id
JOIN role_permissions rp ON r.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
WHERE u.user_email = :userEmail
GROUP BY rp.permission_id, p.permission_name;


-- Find if a specific user has a specific permission with email and permissionName:

SELECT u.user_name, u.user_email, r.role_id , r.role_name,  rp.permission_id AS permission_id, p.permission_name AS permission_name, 
    CASE
        WHEN SUM(rp.is_permitted = 'Y') > 0 THEN 'Y'  
        ELSE 'N' 
    END AS is_permitted
FROM users u
JOIN user_roles ur ON u.id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id
JOIN role_permissions rp ON r.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
WHERE u.user_email = :user_email AND p.permission_name = :permissionName
GROUP BY rp.permission_id, p.permission_name;


-- Find if a specific user has a specific permission with userId and permissionId:

SELECT u.user_name, u.user_email, r.role_id , r.role_name,  rp.permission_id AS permission_id, p.permission_name AS permission_name, 
    CASE
        WHEN SUM(rp.is_permitted = 'Y') > 0 THEN 'Y'  
        ELSE 'N' 
    END AS is_permitted
FROM users u
JOIN user_roles ur ON u.id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id
JOIN role_permissions rp ON r.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
WHERE u.id = :user_id AND p.permission_id = :permissionId
GROUP BY rp.permission_id, p.permission_name;


-- Find if a specific user has a specific permission returning with Boolean[true|false]:

SELECT
    CASE
        WHEN SUM(rp.is_permitted = 'Y') > 0 THEN 'true'  
        ELSE 'false'
    END AS is_permitted
FROM users u
JOIN user_roles ur ON u.id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id
JOIN role_permissions rp ON r.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
WHERE u.user_email = :user_email AND p.permission_name = :permissionName
GROUP BY rp.permission_id, p.permission_name;