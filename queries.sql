//transfer access id to url
UPDATE User_access u JOIN Access a ON(u.user_access_access=a.access_id) SET u.user_access_access = a.access_url;