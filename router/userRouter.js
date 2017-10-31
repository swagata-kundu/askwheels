var router = require('express').Router();

var authUtils = require('../libs/authUtils');

var controllerIndex = require('../controller/index');

router.patch('/', controllerIndex.user.updateProfile);
router.post('/block', controllerIndex.user.blockUser);
router.post('/seller/listing', controllerIndex.user.sellerListing);
router.post('/seller/dashboard', controllerIndex.user.sellerDashBoardInfo);
router.post('/subseller', controllerIndex.user.createSubseller);
router.post('/subseller/listing', controllerIndex.user.subsellerListing);
router.post('/dealer/listing', authUtils.verifyAdmin, controllerIndex.user.dealerListing);
router.post('/dealer/dashboard', authUtils.verifyDealer, controllerIndex.user.dealerDashBoardInfo);
router.post('/admin/dashboard', authUtils.verifyAdmin, controllerIndex.user.adminDashBoardInfo);
router.get('/:userId', controllerIndex.user.userDetail);
router.delete('/', authUtils.verifyAdmin, controllerIndex.user.deleteUser);

module.exports = router;