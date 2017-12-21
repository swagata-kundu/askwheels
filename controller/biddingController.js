var biddingModel = require('../models/biddingModel');

/**
 * Upload behicle for auction
 * @request_type- POST
 * @url- /secure/bid
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.submitBid = function(req, res, next) {
    biddingModel.submitBid(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};

/**
 * Get dealer bids
 * @request_type- POST
 * @url- /secure/bid/dealer
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.dealerBid = function(req, res, next) {
    biddingModel.getDelaerBids(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};

/**
 * Get seller bids
 * @request_type- POST
 * @url- /secure/bid/seller
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.sellerBid = function(req, res, next) {
    biddingModel.getSellerBids(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};
