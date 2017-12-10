var notificationModel = require('../models/notificationModel');



/**
 * Get dealer notifications
 * @request_type- POST
 * @url- /secure/notification/dealer
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.dealerNotification = function (req, res, next) {
    notificationModel.getDealerNotifications(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};


/**
 * Get seller notification
 * @request_type- POST
 * @url- /secure/notification/seller
 * @param {Object} req - express request.
 * @param {Object} res - express response.
 * @param {function} next - next middleware callback.
 */

exports.sellerNotification = function (req, res, next) {
    notificationModel.getSellerNotifications(req, (err, result) => {
        if (err) {
            return next(err);
        } else {
            res.json(result);
        }
    });
};