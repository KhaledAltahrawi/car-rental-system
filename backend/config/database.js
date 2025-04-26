const oracledb = require('oracledb');

// Set oracledb connection pool configuration
const dbConfig = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    connectString: process.env.DB_CONNECTION_STRING,
    poolMin: 2,
    poolMax: 5,
    poolIncrement: 1
};

// Initialize the Oracle connection pool
async function initialize() {
    try {
        await oracledb.createPool(dbConfig);
        console.log('Connection pool created successfully');
    } catch (err) {
        console.error('Error creating connection pool:', err);
        throw err;
    }
}

// Close the connection pool
async function close() {
    try {
        await oracledb.getPool().close(0);
        console.log('Connection pool closed');
    } catch (err) {
        console.error('Error closing connection pool:', err);
        throw err;
    }
}

// Get a connection from the pool
async function getConnection() {
    try {
        return await oracledb.getPool().getConnection();
    } catch (err) {
        console.error('Error getting connection from pool:', err);
        throw err;
    }
}

module.exports = { initialize, close, getConnection };