var router = require('express').Router();
var upload = require('../libs/multer');


var controllerIndex = require('../controller/index');

router.patch('/', controllerIndex.user.updateProfile);
router.post('/profilepicture', upload.uploadProfilePic, controllerIndex.user.uploadPic);
router.post('/block',  controllerIndex.user.blockUser);
router.post('/public',  controllerIndex.user.endUserListing);
router.get('/:userId',  controllerIndex.user.userDetail);
router.delete('/', controllerIndex.user.deleteUser);

module.exports = router;