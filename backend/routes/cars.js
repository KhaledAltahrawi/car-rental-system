const express = require('express');
const router = express.Router();
const carController = require('../controllers/carController');
const { authenticateToken } = require('../middleware/authMiddleware'); // Import the middleware

// GET /api/cars - Get all cars
router.get('/', carController.getAllCars);

// GET /api/cars/:id - Get car by ID
router.get('/:id', carController.getCarById);

// POST /api/cars - Create a new car (Protected - requires authentication)
router.post('/', authenticateToken, carController.createCar);

// PUT /api/cars/:id - Update car by ID (Protected - requires authentication)
router.put('/:id', authenticateToken, carController.updateCar);

// DELETE /api/cars/:id - Delete car by ID (Protected - requires authentication)
router.delete('/:id', authenticateToken, carController.deleteCar);

module.exports = router;