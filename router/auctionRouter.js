var router = require('express').Router();

var controllerIndex = require('../controller/index');

router.post('/vehicle', controllerIndex.auction.uploadVehicle);
router.post('/vehicle/list', controllerIndex.auction.vehicleListAdmin);
router.put('/vehicle/status', controllerIndex.auction.changeVehicleStatus);
router.get('/features', controllerIndex.auction.listFeatures);

module.exports = router;