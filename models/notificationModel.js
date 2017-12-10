var dbHelper = require('../helper/dbHelper');
var Check = require('../libs/core/Check');
var appUtils = require('../libs/appUtils');
var responseModel = require('../assets/responseModel');
var dbNames = require('../assets/dbNames');
var pagingHelper = require('../helper/paginationHelper');


const mysql = require('mysql');
const async = require('async');

let notification = {};
module.exports = notification;

/**
 * Get dealer notification
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */
notification.getDealerNotifications = (req, done) => {
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
                    dbNames.sp.dealerNotification,
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



/**
 * Get seller notification
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */
notification.getSellerNotifications = (req, done) => {
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
                    dbNames.sp.sellerNotification,
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