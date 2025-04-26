const db = require('../config/database');
const bcrypt = require('bcrypt');

const registerCustomer = async (req, res) => {
    try {
        const { name, email, password, phone, driverLicense } = req.body;

        // 1. Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // 2. Insert the user into the database
        const connection = await db.getConnection();
        const result = await connection.execute(
            `INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (customers_seq.NEXTVAL, :name, :email, :phone, :driverLicense)`,
            [name, email, hashedPassword, phone, driverLicense],
            { autoCommit: true } // Important for Oracle!
        );

        await connection.release();

        // 3. Send a success response
        res.status(201).json({ message: 'User registered successfully' });

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to register user' });
    }
};

module.exports = { registerCustomer };