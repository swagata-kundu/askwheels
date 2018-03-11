var dbHelper = require('../helper/dbHelper');
var Check = require('../libs/core/Check');
var appUtils = require('../libs/appUtils');
var responseModel = require('../assets/responseModel');
var dbNames = require('../assets/dbNames');
var pagingHelper = require('../helper/paginationHelper');
var ApiException = require('../libs/core/ApiException');
var api_errors = require('../assets/api_errors');
var push = require('../notify/pushNotifier');

const mysql = require('mysql');
const async = require('async');
const moment = require('moment');

var bidding = {};
module.exports = bidding;
/**
 * Submit new bid dealer
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */

bidding.submitBid = (req, callback) => {
    let {
        id,
        biddingLimit,
        firstName
    } = req.auth;
    let vehicleName = '';

    async.series(
        [
            cb => {
                var rules = {
                    amount: Check.that(req.body.amount).isInteger(),
                    vehicleId: Check.that(req.body.vehicleId).isInteger()
                };
                appUtils.validateChecks(rules, cb);
            },
            cb => {
                var sql = 'CALL ?? ( ?,?)';
                var parameters = [dbNames.sp.biddingInfo, req.body.vehicleId, id];
                sql = mysql.format(sql, parameters);
                dbHelper.executeQuery(sql, (err, result) => {
                    if (err) {
                        return cb(err);
                    }
                    if (result[0].length !== 1) {
                        return cb(
                            ApiException.newNotFoundError(null).addDetails('Invalid vehicle')
                        );
                    }
                    let {
                        auction_start_date,
                        start_bid,
                        max_bid,
                        dealer_total_bid,
                        vehicle_name
                    } = result[0][0];

                    vehicleName = vehicle_name;

                    let {
                        amount
                    } = req.body;

                    let lastBidTime = moment(
                        auction_start_date,
                        'YYYY-MM-DD HH:mm:ss'
                    ).add(1, 'day');

                    if (lastBidTime.isBefore(moment())) {
                        return cb(
                            ApiException.newNotAllowedError(
                                api_errors.bidding_expired.error_code,
                                null
                            ).addDetails(api_errors.bidding_expired.description)
                        );
                    }

                    if (amount < start_bid || amount <= max_bid) {
                        return cb(
                            ApiException.newNotAllowedError(
                                api_errors.bidding_not_allowed.error_code,
                                null
                            ).addDetails('Amount must be greater than start bid and max bid')
                        );
                    }

                    let dealerBalance = biddingLimit - dealer_total_bid;

                    if (dealerBalance < amount) {
                        return cb(
                            ApiException.newNotAllowedError(
                                api_errors.bidding_not_allowed.error_code,
                                null
                            ).addDetails('Dealer bidding limit exceeds')
                        );
                    }
                    return cb();
                });
            },
            cb => {
                var sql = 'CALL ?? ( ?,?,?)';
                var parameters = [
                    dbNames.sp.addBid,
                    req.body.vehicleId,
                    id,
                    req.body.amount
                ];
                sql = mysql.format(sql, parameters);
                dbHelper.executeQuery(sql, cb);
            },
            cb => {
                var sql = 'CALL ?? ( ?,?,?)';
                var parameters = [
                    dbNames.sp.dealerNotifyBids,
                    req.body.vehicleId,
                    id,
                    req.body.amount
                ];
                sql = mysql.format(sql, parameters);
                dbHelper.executeQuery(sql, (err, result) => {
                    if (err) {
                        return cb(err);
                    }
                    let users = [];
                    result[0].forEach(r => {
                        if (r.deviceId) {
                            users.push({
                                deviceId: r.deviceId,
                                title: 'New Bid Added',
                                body: `New bid of amount ${ req.body.amount}  has been submitted on ${vehicleName}`
                            });
                        }
                    });

                    if (users.length > 0) {
                        push.sendListNotification(users);
                    }

                    return cb(null);
                });
            }
        ],
        err => {
            if (err) {
                return callback(err);
            }
            var response = new responseModel.objectResponse();
            response.message = 'Your bidding has been submitted successfully';

            return callback(null, response);
        }
    );
};
/**
 * Bid listing dealer
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */

bidding.getDelaerBids = (req, callback) => {
    async.series(
        [
            cb => {
                var rules = {
                    pageNo: Check.that(req.body.pageNo)
                        .isOptional()
                        .isInteger(),
                    pageSize: Check.that(req.body.pageSize)
                        .isOptional()
                        .isInteger()
                };
                appUtils.validateChecks(rules, cb);
            },
            cb => {
                var pageInfo = pagingHelper.makePageObject(req.body);
                var sql = 'CALL ?? ( ?,?,?)';
                var parameters = [
                    dbNames.sp.dealerBids,
                    req.auth.id,
                    pageInfo.skip,
                    pageInfo.limit
                ];
                sql = mysql.format(sql, parameters);
                dbHelper.executeQuery(sql, cb);
            }
        ],
        (err, result) => {
            if (err) {
                return callback(err);
            }
            var response = new responseModel.arrayResponse();
            var dbResult = result[1];
            if (dbResult[1].length) {
                response.data = dbResult[1];
                response.count = dbResult[0][0].totalRecords;
            }
            return callback(null, response);
        }
    );
};

/**
 * Get seller bids
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */
bidding.getSellerBids = (req, done) => {
    async.series(
        [
            cb => {
                var rules = {
                    pageNo: Check.that(req.body.pageNo)
                        .isOptional()
                        .isInteger(),
                    pageSize: Check.that(req.body.pageSize)
                        .isOptional()
                        .isInteger()
                };
                appUtils.validateChecks(rules, cb);
            },
            cb => {
                let sellerId = 0;
                let subsellerId = 0;

                if (req.auth.roleId === 1) {
                    sellerId = req.auth.id;
                }

                if (req.auth.roleId === 2) {
                    subsellerId = req.auth.id;
                }

                var pageInfo = pagingHelper.makePageObject(req.body);
                var sql = 'CALL ?? ( ?,?,?,?)';
                var parameters = [
                    dbNames.sp.sellerBids,
                    sellerId ? sellerId : 0,
                    subsellerId ? subsellerId : 0,
                    pageInfo.skip,
                    pageInfo.limit
                ];
                sql = mysql.format(sql, parameters);
                dbHelper.executeQuery(sql, cb);
            }
        ],
        (err, result) => {
            if (err) {
                return done(err);
            }
            var response = new responseModel.arrayResponse();
            var dbResult = result[1];
            if (dbResult[1].length) {
                response.data = dbResult[1];
                response.count = dbResult[0][0].totalRecords;
            }
            return done(null, response);
        }
    );
};