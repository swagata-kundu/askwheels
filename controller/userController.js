var userModel = require('../models/userModel');
var userModel_admin = require('../models/userModel-admin');

/**
 * Update profile controller
 * @request_type- PATCH
 * @url- /secure/user/
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.updateProfile = function (req, res, next) {
    userModel
        .editProfile(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Block user from login
 * @request_type- POST
 * @url- /secure/user/block
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.blockUser = function (req, res, next) {
    userModel
        .blockUser(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * User Detail
 * @request_type- GET
 * @url- /secure/user/:userId
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.userDetail = function (req, res, next) {
    userModel_admin
        .userDetail(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Delete user for admin
 * @request_type- DELETE
 * @url- /secure/user
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.deleteUser = function (req, res, next) {
    userModel_admin
        .deleteUser(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Subseller listing for seller
 * @request_type- POST
 * @url- /secure/user/subseller/listing
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.subsellerListing = function (req, res, next) {
    userModel_admin
        .subsellerListing(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Subseller listing for seller
 * @request_type- POST
 * @url- /secure/user/seller/listing
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.sellerListing = function (req, res, next) {
    userModel_admin
        .sellerListing(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Dealer listing for admin
 * @request_type- POST
 * @url- /secure/user/dealer/listing
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.dealerListing = function (req, res, next) {
    userModel_admin
        .dealerListing(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Change dealer status
 * @request_type- PUT
 * @url- /secure/user/dealer/status
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.changeDealerStatus = function (req, res, next) {
    userModel_admin
        .changeDealerStatus(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Create sub seller for seller
 * @request_type- POST
 * @url- /secure/user/subseller
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.createSubseller = function (req, res, next) {
    userModel_admin
        .addSubseller(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Seller/Sub-Seller dashboard data
 * @request_type- POST
 * @url- /secure/user/seler/dashboard
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.sellerDashBoardInfo = function (req, res, next) {
    userModel_admin
        .sellerDashBoardInfo(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Dealer dashboard data
 * @request_type- POST
 * @url- /secure/user/dealer/dashboard
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.dealerDashBoardInfo = function (req, res, next) {
    userModel_admin
        .dealerDashBoardInfo(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};

/**
 * Admin dashboard data
 * @request_type- POST
 * @url- /secure/user/admin/dashboard
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.adminDashBoardInfo = function (req, res, next) {
    userModel_admin
        .adminDashBoardInfo(req, function (err, result) {
            if (err) {
                return next(err);
            } else {
                res.json(result);
            }
        });
};