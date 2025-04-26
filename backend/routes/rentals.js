const express = require('express');
const router = express.Router();
const rentalController = require('../controllers/rentalController'); // Placeholder

// GET /api/rentals - Get all rentals (Admin only - Placeholder)
router.get('/', /* authMiddleware.isAdmin, */ rentalController.getAllRentals);

// GET /api/rentals/:id - Get rental by ID
router.get('/:id', rentalController.getRentalById);

// POST /api/rentals - Create a new rental
router.post('/', rentalController.createRental);

// PUT /api/rentals/:id - Update rental by ID (Admin only or limited customer updates)
router.put('/:id', /* authMiddleware.isAuth, */ rentalController.updateRental);

// DELETE /api/rentals/:id - Delete rental by ID (Admin only - Placeholder)
router.delete('/:id', /* authMiddleware.isAdmin, */ rentalController.deleteRental);

// GET /api/rentals/customer/:customerId - Get rentals for a specific customer
router.get('/customer/:customerId', /* authMiddleware.isAuth, */ rentalController.getRentalsByCustomer);

module.exports = router;