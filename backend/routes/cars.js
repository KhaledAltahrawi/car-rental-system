const express = require('express');
const router = express.Router();
const carController = require('../controllers/carController'); // Placeholder   

// GET /api/cars - Get all cars
router.get('/', carController.getAllCars);

// GET /api/cars/:id - Get car by ID
router.get('/:id', carController.getCarById);

// POST /api/cars - Create a new car (Admin only - Placeholder)
router.post('/', /* authMiddleware.isAdmin, */ carController.createCar);

// PUT /api/cars/:id - Update car by ID (Admin only - Placeholder)
router.put('/:id', /* authMiddleware.isAdmin, */ carController.updateCar);

// DELETE /api/cars/:id - Delete car by ID (Admin only - Placeholder)
router.delete('/:id', /* authMiddleware.isAdmin, */ carController.deleteCar);

module.exports = router;
