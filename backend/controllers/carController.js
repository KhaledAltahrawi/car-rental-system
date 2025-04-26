// Placeholder functions for carController

const getAllCars = (req, res) => {
    res.json({ message: 'Get all cars' });
};

const getCarById = (req, res) => {
    res.json({ message: `Get car by ID: ${req.params.id}` });
};

const createCar = (req, res) => {
    res.json({ message: 'Create a new car' });
};

const updateCar = (req, res) => {
    res.json({ message: `Update car by ID: ${req.params.id}` });
};

const deleteCar = (req, res) => {
    res.json({ message: `Delete car by ID: ${req.params.id}` });
};

module.exports = {
    getAllCars,
    getCarById,
    createCar,
    updateCar,
    deleteCar
};