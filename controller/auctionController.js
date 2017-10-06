var auctionModel = require('../models/auctionModel');

/**
 * Upload behicle for auction
 * @request_type- POST
 * @url- /secure/auction/vehicle
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


/**
 * Upload behicle for auction
 * @request_type- GET
 * @url- /secure/auction/features
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.listFeatures = function (req, res, next) {
    auctionModel.listFeatures(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};