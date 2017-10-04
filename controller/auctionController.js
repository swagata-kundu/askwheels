var auctionModel = require('../models/auctionModel');

/**
 * Update profile controller
 * @request_type- PATCH
 * @url- /secure/user/
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.uploadVehicle = function (req, res, next) {
    auctionModel.uploadVehicle(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};