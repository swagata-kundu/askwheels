var router = require('express').Router();

var controllerIndex = require('../controller/index');

router.post('/dealer', controllerIndex.notification.dealerNotification);
router.post('/seller', controllerIndex.notification.sellerNotification);


module.exports = router;