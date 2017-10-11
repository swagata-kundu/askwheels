var router = require('express').Router();


var controllerIndex = require('../controller/index');

router.patch('/', controllerIndex.user.updateProfile);
router.post('/block', controllerIndex.user.blockUser);
router.post('/seller/listing', controllerIndex.user.sellerListing);
router.post('/seller/dashboard', controllerIndex.user.sellerDashBoardInfo);
router.post('/subseller', controllerIndex.user.createSubseller);
router.post('/subseller/listing', controllerIndex.user.subsellerListing);
router.get('/:userId', controllerIndex.user.userDetail);
router.delete('/', controllerIndex.user.deleteUser);

module.exports = router;