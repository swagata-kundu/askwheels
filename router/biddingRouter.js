var router = require('express').Router();

var controllerIndex = require('../controller/index');

router.post('/', controllerIndex.bid.submitBid);

module.exports = router;
