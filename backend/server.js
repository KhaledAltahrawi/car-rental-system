const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
//const db = require('./config/database'); // Remove this line

// Load environment variables
dotenv.config();
console.log('server.js: Loaded environment variables');

// Initialize express app
const app = express();
console.log('server.js: Initialized express app');

// Middleware
app.use(cors());
console.log('server.js: Used cors middleware');
app.use(express.json());
console.log('server.js: Used express.json middleware');

// Import routes
const carsRouter = require('./routes/cars');
const customersRouter = require('./routes/customers');
const rentalsRouter = require('./routes/rentals');
const carTypesRouter = require('./routes/carTypes');
const locationsRouter = require('./routes/locations');
console.log('server.js: Imported routes');

// Use routes as middleware
app.use('/api/cars', carsRouter);
console.log('server.js: Used /api/cars route');
app.use('/api/customers', customersRouter);
console.log('server.js: Used /api/customers route');
app.use('/api/rentals', rentalsRouter);
console.log('server.js: Used /api/rentals route');
app.use('/api/car-types', carTypesRouter);
console.log('server.js: Used /api/car-types route');
app.use('/api/locations', locationsRouter);
console.log('server.js: Used /api/locations route');

// Simple test route
app.get('/', (req, res) => {
    res.json({ message: 'Welcome to Car Rental System API' });
});
console.log('server.js: Defined / route');

// Set port and start server
const PORT = process.env.PORT || 5000;

async function startServer() {
    try {
        console.log('server.js: Attempting to initialize database connection...');
        const db = require('./config/database'); // Dynamically import db
        await db.initialize();
        console.log('server.js: Database connection initialized successfully.');
        app.listen(PORT, () => {
            console.log(`Server is running on port ${PORT}`);
        });
        console.log('server.js: Server started listening');
    } catch (error) {
        console.error('server.js: Failed to start server due to database connection error:', error);
        console.error('server.js: Error details:', error);
        console.error('server.js: DB_USER:', process.env.DB_USER);
        console.error('server.js: DB_PASSWORD:', process.env.DB_PASSWORD);
        console.error('server.js: DB_CONNECTION_STRING:', process.env.DB_CONNECTION_STRING);
    }
}

(async () => {
    await startServer();
    console.log('server.js: startServer() called');
})();

// Handle server shutdown to close the connection pool
process.on('SIGINT', async () => {
    console.log('server.js: Shutting down server and closing database connection pool...');
    try {
        const db = require('./config/database'); // Dynamically import db here too (for consistency)
        await db.close();
        console.log('server.js: Database connection pool closed');
        process.exit(0);
    } catch (err) {
        console.error('server.js: Error closing database connection pool:', err);
        process.exit(1);
    }
});