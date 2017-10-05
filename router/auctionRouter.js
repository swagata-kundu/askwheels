var router = require('express').Router();

var controllerIndex = require('../controller/index');

router.post('/vehicle', controllerIndex.auction.uploadVehicle);
router.get('/features', controllerIndex.auction.listFeatures);

module.exports = router;