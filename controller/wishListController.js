var wishListModel = require('../models/wishListModel');


/**
 * Add vehicle to dealers wishlist
 * @request_type- PUT
 * @url- /secure/auction/wishlist
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.addDealerWishList = function (req, res, next) {
    wishListModel.addDealerWishList(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};


/**
 * Show dealer wishlist
 * @request_type- GET
 * @url- /secure/auction/wishlist
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.dealerWishList = function (req, res, next) {
    wishListModel.dealerWishList(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};


/**
 * Show dealer wins
 * @request_type- GET
 * @url- /secure/auction/dealer/wins
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.dealerWins = function (req, res, next) {
    wishListModel.dealerWins(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};

/**
 * Show seller closed deals
 * @request_type- POST
 * @url- /secure/auction/seller/closed
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.sellerClosedDeals = function (req, res, next) {
    wishListModel.sellerClosedDeals(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};