var router = require('express').Router();

var controllerIndex = require('../controller/index');
var authUtils = require('../libs/authUtils');

router.get('/vehicle/:vehicleId', controllerIndex.auction.auctionDetail);
router.post('/vehicle', controllerIndex.auction.uploadVehicle);
router.post('/seller', controllerIndex.auction.auctionListSeller);
router.post('/dealer', controllerIndex.auction.auctionListDealer);
router.post('/vehicle/admin/list', authUtils.verifyAdmin, controllerIndex.auction.vehicleListAdmin);
router.put('/vehicle/admin/status', authUtils.verifyAdmin, controllerIndex.auction.changeVehicleStatus);
router.get('/features', controllerIndex.auction.listFeatures);
router.put('/wishlist', controllerIndex.wishlist.addDealerWishList);
router.get('/wishlist', controllerIndex.wishlist.dealerWishList);

module.exports = router;