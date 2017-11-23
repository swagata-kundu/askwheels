var dbHelper = require('../helper/dbHelper');
var Check = require('../libs/core/Check');
var appUtils = require('../libs/appUtils');
var responseModel = require('../assets/responseModel');
var responseMessage = require('../assets/responseMessage');
var dbNames = require('../assets/dbNames');
var pagingHelper = require('../helper/paginationHelper');

var mysql = require('mysql');
var async = require('async');

var wishList = {};
module.exports = wishList;

/**
 * Add auction to dealer wishlist
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */

wishList.addDealerWishList = function (req, callback) {

    async.series([
        cb => {
            var rules = {
                dealerId: Check
                    .that(req.auth.id)
                    .isInteger(),
                vehicleId: Check
                    .that(req.body.vehicleId)
                    .isInteger()
            };
            appUtils.validateChecks(rules, cb);
        },
        cb => {
            var sql = 'CALL ?? ( ?,?)';
            var parameters = [
                dbNames.sp.addDealerWishList,
                req.auth.id,
                req.body.vehicleId
            ];
            sql = mysql.format(sql, parameters);
            dbHelper.executeQuery(sql, cb);
        }
    ], (err, result) => {
        if (err) {
            return callback(err);
        }
        var response = new responseModel.objectResponse();
        response.message = responseMessage.SUCCESS;
        return callback(null, response);
    });
};



/**
 * Show wish list for dealer
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */

wishList.dealerWishList = function (req, callback) {

    async.series([
        cb => {
            var pageInfo = pagingHelper.makePageObject(req.body);
            var sql = 'CALL ?? ( ?)';
            var parameters = [
                dbNames.sp.dealerWishList,
                req.auth.id
            ];
            sql = mysql.format(sql, parameters);
            dbHelper.executeQuery(sql, cb);
        }
    ], (err, result) => {
        if (err) {
            return callback(err);
        }
        var response = new responseModel.arrayResponse();
        var dbResult = result[0];
        if (dbResult[0].length) {
            response.data = dbResult[0];
            response.count = dbResult[0].length;
        }
        return callback(null, response);
    });
};