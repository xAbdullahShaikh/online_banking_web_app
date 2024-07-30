const mysql = require('mysql2/promise'); // Import promise-compatible version

// Create a MySQL pool
const pool = mysql.createPool({
  user: 'root',
  password: '',
  host: 'localhost',
  port: ,
  database: 'db_project',
});

module.exports = pool;
