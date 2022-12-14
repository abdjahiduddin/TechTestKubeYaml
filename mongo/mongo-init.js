db.auth('admin-user', 'admin-password')

db = db.getSiblingDB('dealTechTest')

db.createUser({
  user: 'jay',
  pwd: 'toor',
  roles: [
    {
      role: 'readWrite',
      db: 'dealTechTest',
    },
  ],
});