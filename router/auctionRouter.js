var router = require('express').Router();

var controllerIndex = require('../controller/index');

router.post('/vehicle', controllerIndex.auction.uploadVehicle);

module.exports = router;