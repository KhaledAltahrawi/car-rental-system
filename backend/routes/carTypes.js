const express = require('express');
const router = express.Router();
const carTypeController = require('../controllers/carTypeController'); // Placeholder

// GET /api/car-types - Get all car types
router.get('/', carTypeController.getAllCarTypes);

// GET /api/car-types/:id - Get car type by ID
router.get('/:id', carTypeController.getCarTypeById);

// POST /api/car-types - Create a new car type (Admin only - Placeholder)
router.post('/', /* authMiddleware.isAdmin, */ carTypeController.createCarType);

// PUT /api/car-types/:id - Update car type by ID (Admin only - Placeholder)
router.put('/:id', /* authMiddleware.isAdmin, */ carTypeController.updateCarType);

// DELETE /api/car-types/:id - Delete car type by ID (Admin only - Placeholder)
router.delete('/:id', /* authMiddleware.isAdmin, */ carTypeController.deleteCarType);

module.exports = router;