const { validationResult } = require('express-validator');
const { body } = require('express-validator'); // Import body separately
const db = require('../config/database');
const bcrypt = require('bcrypt');

const registerCustomer = async (req, res) => {
    // 1. Validation checks
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }

    try {
        const { name, email, password, phone, driverLicense } = req.body;

        // Check if email already exists
        const connection = await db.getConnection();
        const emailExistsResult = await connection.execute(
            `SELECT COUNT(*) FROM Customers WHERE Email = :email`,
            [email]
        );
        const emailCount = emailExistsResult.rows[0][0]; // Assuming COUNT(*) returns a single number

        if (emailCount > 0) {
            await connection.release();
            return res.status(400).json({ errors: [{ msg: 'Email already exists' }] });
        }

        // 2. Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // 3. Insert the user into the database
        const result = await connection.execute(
            `INSERT INTO Customers (CustomerID, Name, Email, Password, Phone, DriverLicense) VALUES (customers_seq.NEXTVAL, :name, :email, :password, :phone, :driverLicense)`,
            [name, email, hashedPassword, phone, driverLicense],
            { autoCommit: true }
        );

        await connection.release();

        // 4. Send a success response
        res.status(201).json({ message: 'User registered successfully' });

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to register user' });
    }
};

const getAllCustomers = async (req, res) => {
    try {
        const connection = await db.getConnection();
        const result = await connection.execute(`SELECT * FROM Customers`);
        const customers = result.rows;
        await connection.release();

        res.status(200).json({ customers });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch customers' });
    }
};

const getCustomerById = async (req, res) => {
    try {
        const customerId = req.params.id;
        const connection = await db.getConnection();
        const result = await connection.execute(
            `SELECT * FROM Customers WHERE CustomerID = :id`,
            [customerId]
        );
        const customer = result.rows[0]; // Assuming the first row is the customer
        await connection.release();

        if (customer) {
            res.status(200).json({ customer });
        } else {
            res.status(404).json({ message: 'Customer not found' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch customer' });
    }
};

const updateCustomer = async (req, res) => {
    try {
        const customerId = req.params.id;
        const { name, email, phone, driverLicense } = req.body;

        const connection = await db.getConnection();
        const result = await connection.execute(
            `UPDATE Customers SET Name = :name, Email = :email, Phone = :phone, DriverLicense = :driverLicense WHERE CustomerID = :id`,
            [name, email, phone, driverLicense, customerId],
            { autoCommit: true }
        );

        if (result.rowsAffected > 0) {
            res.status(200).json({ message: 'Customer updated successfully' });
        } else {
            res.status(404).json({ message: 'Customer not found' });
        }
        await connection.release();
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to update customer' });
    }
};

const deleteCustomer = async (req, res) => {
    try {
        const customerId = req.params.id;

        const connection = await db.getConnection();
        const result = await connection.execute(
            `DELETE FROM Customers WHERE CustomerID = :id`,
            [customerId],
            { autoCommit: true }
        );

        if (result.rowsAffected > 0) {
            res.status(200).json({ message: 'Customer deleted successfully' });
        } else {
            res.status(404).json({ message: 'Customer not found' });
        }
        await connection.release();
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to delete customer' });
    }
};

const loginCustomer = async (req, res) => {
    try {
        const { email, password } = req.body;

        const connection = await db.getConnection();
        const result = await connection.execute(
            `SELECT * FROM Customers WHERE Email = :email`,
            [email]
        );
        const customer = result.rows[0];
        await connection.release();

        if (customer) {
            const passwordMatch = await bcrypt.compare(password, customer[2]); // Assuming hashed password is in the 3rd column
            if (passwordMatch) {
                res.status(200).json({ message: 'Login successful' });
            } else {
                res.status(401).json({ error: 'Invalid credentials' });
            }
        } else {
            res.status(404).json({ error: 'Customer not found' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Login failed' });
    }
};

module.exports = {
    getAllCustomers,
    getCustomerById,
    registerCustomer,
    updateCustomer,
    deleteCustomer,
    loginCustomer
};