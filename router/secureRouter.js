var router = require('express').Router();


var userRouter = require('./userRouter');
var auctionRouter = require('./auctionRouter');
var authUtil = require('../libs/authUtils');
var upload = require('../libs/multer');
var controllerIndex = require('../controller/index');

router.use(authUtil.verifySessionId);
router.use('/user', userRouter);
router.use('/auction', auctionRouter);
router.post('/upload/multiple', upload.uploadMany, controllerIndex.upload.uploadMultiple);


module.exports = router;