var biddingModel = require('../models/biddingModel');


/**
 * Upload behicle for auction
 * @request_type- POST
 * @url- /secure/bid
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.submitBid = function (req, res, next) {
    biddingModel.submitBid(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};