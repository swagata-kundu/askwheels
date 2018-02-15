var router = require('express').Router();

var controllerIndex = require('../controller/index');
var authUtils = require('../libs/authUtils');

router.get('/vehicle/:vehicleId', controllerIndex.auction.auctionDetail);
router.post('/vehicle', controllerIndex.auction.uploadVehicle);
router.post('/seller/closed', controllerIndex.wishlist.sellerClosedDeals);
router.post('/seller/payment', controllerIndex.auction.getSellerPayment);
router.post('/seller', controllerIndex.auction.auctionListSeller);
router.post('/dealer', controllerIndex.auction.auctionListDealer);
router.post(
    '/vehicle/admin/list',
    authUtils.verifyAdmin,
    controllerIndex.auction.vehicleListAdmin
);
router.put(
    '/vehicle/admin/status',
    authUtils.verifyAdmin,
    controllerIndex.auction.changeVehicleStatus
);
router.put('/dealer/wishlist', controllerIndex.wishlist.addDealerWishList);
router.get('/dealer/wishlist', controllerIndex.wishlist.dealerWishList);
router.get('/dealer/win', controllerIndex.wishlist.dealerWins);


module.exports = router;