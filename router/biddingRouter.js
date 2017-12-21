var router = require('express').Router();

var controllerIndex = require('../controller/index');

router.post('/', controllerIndex.bid.submitBid);
router.post('/dealer', controllerIndex.bid.dealerBid);
router.post('/seller', controllerIndex.bid.sellerBid);

module.exports = router;
