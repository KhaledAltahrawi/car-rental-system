// Placeholder functions for locationController

const getAllLocations = (req, res) => {
    res.json({ message: 'Get all locations' });
};

const getLocationById = (req, res) => {
    res.json({ message: `Get location by ID: ${req.params.id}` });
};

const createLocation = (req, res) => {
    res.json({ message: 'Create a new location' });
};

const updateLocation = (req, res) => {
    res.json({ message: `Update location by ID: ${req.params.id}` });
};

const deleteLocation = (req, res) => {
    res.json({ message: `Delete location by ID: ${req.params.id}` });
};

module.exports = {
    getAllLocations,
    getLocationById,
    createLocation,
    updateLocation,
    deleteLocation
};