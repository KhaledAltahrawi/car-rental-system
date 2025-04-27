const express = require('express');
const router = express.Router();
const customerController = require('../controllers/customerController');
const { body } = require('express-validator');

// GET /api/customers - Get all customers (Admin only - Placeholder)
router.get('/', /* authMiddleware.isAdmin, */ customerController.getAllCustomers);

// GET /api/customers/:id - Get customer by ID
router.get('/:id', customerController.getCustomerById);

// POST /api/customers/register - Register a new customer
router.post(
    '/register',
    [
        body('name').notEmpty().withMessage('Name is required'),
        body('email').isEmail().withMessage('Invalid email address'),
        body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
        body('phone').notEmpty().withMessage('Phone is required'),
        body('driverLicense').notEmpty().withMessage('DriverLicense is required'),
    ],
    customerController.registerCustomer
);

// POST /api/customers/login - Login a customer
router.post(
    '/login',
    [
        body('email').isEmail().withMessage('Invalid email address'),
        body('password').notEmpty().withMessage('Password is required'),
    ],
    customerController.loginCustomer
);

// PUT /api/customers/:id - Update customer by ID (Customer or Admin)
router.put('/:id', /* authMiddleware.isAuth, */ customerController.updateCustomer);

// DELETE /api/customers/:id - Delete customer by ID (Admin only - Placeholder)
router.delete('/:id', /* authMiddleware.isAdmin, */ customerController.deleteCustomer);

module.exports = router;