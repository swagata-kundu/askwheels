var router = require('express').Router();
var upload = require('../libs/multer');


var controllerIndex = require('../controller/index');

router.patch('/', controllerIndex.user.updateProfile);
router.post('/profilepicture', upload.uploadProfilePic, controllerIndex.user.uploadPic);
router.post('/block', controllerIndex.user.blockUser);
router.post('/seller/listing', controllerIndex.user.sellerListing);
router.post('/subseller', controllerIndex.user.createSubseller);
router.post('/subseller/listing', controllerIndex.user.subsellerListing);
router.get('/:userId', controllerIndex.user.userDetail);
router.delete('/', controllerIndex.user.deleteUser);

module.exports = router;