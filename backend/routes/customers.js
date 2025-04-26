const express = require('express');
const router = express.Router();
const customerController = require('../controllers/customerController'); // Placeholder

// GET /api/customers - Get all customers (Admin only - Placeholder)
router.get('/', /* authMiddleware.isAdmin, */ customerController.getAllCustomers);

// GET /api/customers/:id - Get customer by ID
router.get('/:id', customerController.getCustomerById);

// POST /api/customers/register - Register a new customer
router.post('/register', customerController.registerCustomer);

// POST /api/customers/login - Login a customer
router.post('/login', customerController.loginCustomer);

// PUT /api/customers/:id - Update customer by ID (Customer or Admin)
router.put('/:id', /* authMiddleware.isAuth, */ customerController.updateCustomer);

// DELETE /api/customers/:id - Delete customer by ID (Admin only - Placeholder)
router.delete('/:id', /* authMiddleware.isAdmin, */ customerController.deleteCustomer);

module.exports = router;