const db = require('../config/database');

const getAllCars = async (req, res) => {
    try {
        const connection = await db.getConnection();
        const result = await connection.execute(`SELECT * FROM Cars`);
        const cars = result.rows;
        await connection.release();
        res.status(200).json({ cars });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch cars' });
    }
};

const getCarById = async (req, res) => {
    const carId = req.params.id;
    try {
        const connection = await db.getConnection();
        const result = await connection.execute(
            `SELECT * FROM Cars WHERE CarID = :id`,
            [carId]
        );
        const car = result.rows[0];
        await connection.release();
        if (car) {
            res.status(200).json({ car });
        } else {
            res.status(404).json({ message: 'Car not found' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch car' });
    }
};

const createCar = async (req, res) => {
    const { make, model, year, licensePlate, status, carTypeId } = req.body;
    try {
        const connection = await db.getConnection();

        //  Use car_id_sequence.NEXTVAL in the INSERT statement
        const result = await connection.execute(
            `INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (car_id_sequence.NEXTVAL, :make, :model, :year, :licensePlate, :status, :carTypeId)`,
            [make, model, year, licensePlate, status, carTypeId],
            { autoCommit: true }
        );

        // Fetch the generated CarID
        const carIdResult = await connection.execute(`SELECT car_id_sequence.CURRVAL FROM dual`);
        const carId = carIdResult.rows[0][0];

        await connection.release();
        res.status(201).json({ message: 'Car created successfully', carId: carId });

    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to create car' });
    }
};

const updateCar = async (req, res) => {
    const carId = req.params.id;
    const { make, model, year, licensePlate, status, carTypeId } = req.body;
    try {
        const connection = await db.getConnection();
        const result = await connection.execute(
            `UPDATE Cars SET Make = :make, Model = :model, Year = :year, LicensePlate = :licensePlate, Status = :status, CarTypeID = :carTypeId WHERE CarID = :carId`,
            [make, model, year, licensePlate, status, carTypeId, carId],
            { autoCommit: true }
        );
        await connection.release();
        if (result.rowsAffected > 0) {
            res.status(200).json({ message: 'Car updated successfully' });
        } else {
            res.status(404).json({ message: 'Car not found' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to update car' });
    }
};

const deleteCar = async (req, res) => {
    const carId = req.params.id;
    try {
        const connection = await db.getConnection();
        const result = await connection.execute(
            `DELETE FROM Cars WHERE CarID = :id`,
            [carId],
            { autoCommit: true }
        );
        await connection.release();
        if (result.rowsAffected > 0) {
            res.status(200).json({ message: 'Car deleted successfully' });
        } else {
            res.status(404).json({ message: 'Car not found' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to delete car' });
    }
};

module.exports = {
    getAllCars,
    getCarById,
    createCar,
    updateCar,
    deleteCar
};