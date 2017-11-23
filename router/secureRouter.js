var router = require('express').Router();


var userRouter = require('./userRouter');
var auctionRouter = require('./auctionRouter');
var biddingRouter=require('./biddingRouter');
var authUtil = require('../libs/authUtils');
var upload = require('../libs/multer');
var controllerIndex = require('../controller/index');

router.use(authUtil.verifySessionId);
router.use('/user', userRouter);
router.use('/auction', auctionRouter);
router.use('/bid',biddingRouter);
router.post('/upload', upload.uploadMany, controllerIndex.upload.uploadMultiple);


module.exports = router;