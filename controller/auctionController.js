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
 * Vehicle list admin
 * @request_type- POST
 * @url- /secure/auction/vehicle/admin/list
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.vehicleListAdmin = function (req, res, next) {
    auctionModel.vehicleListAdmin(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};


/**
 * Vehicle list Seller
 * @request_type- POST
 * @url- /secure/auction/vehicle/list
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.vehicleListSeller = function (req, res, next) {
    auctionModel.vehicleListSeller(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};

/**
 * Change Vehicle Status
 * @request_type- PUT
 * @url- /secure/auction/vehicle/admin/status
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.changeVehicleStatus = function (req, res, next) {
    auctionModel.changeVehicleStatus(req, (err, result) => {
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