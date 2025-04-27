const jwt = require('jsonwebtoken');
require('dotenv').config();

const JWT_SECRET = process.env.JWT_SECRET;

const authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1]; // Bearer <token>

    if (token == null) {
        return res.sendStatus(401); // Unauthorized - No token
    }

    jwt.verify(token, JWT_SECRET, (err, user) => {
        if (err) {
            return res.sendStatus(403); // Forbidden - Invalid token
        }

        req.user = user; // Add user information (e.g., userId) to the request object
        next(); // Proceed to the next middleware or route handler
    });
};

module.exports = { authenticateToken };