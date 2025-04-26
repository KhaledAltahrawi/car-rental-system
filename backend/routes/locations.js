const express = require('express');
const router = express.Router();
const locationController = require('../controllers/locationController'); // Placeholder

// GET /api/locations - Get all locations
router.get('/', locationController.getAllLocations);

// GET /api/locations/:id - Get location by ID
router.get('/:id', locationController.getLocationById);

// POST /api/locations - Create a new location (Admin only - Placeholder)
router.post('/', /* authMiddleware.isAdmin, */ locationController.createLocation);

// PUT /api/locations/:id - Update location by ID (Admin only - Placeholder)
router.put('/:id', /* authMiddleware.isAdmin, */ locationController.updateLocation);

// DELETE /api/locations/:id - Delete location by ID (Admin only - Placeholder)
router.delete('/:id', /* authMiddleware.isAdmin, */ locationController.deleteLocation);

module.exports = router;