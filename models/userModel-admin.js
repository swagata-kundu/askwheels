var ApiException = require('../libs/core/ApiException');
var dbHelper = require('../helper/dbHelper');
var Check = require('../libs/core/Check');
var appUtils = require('../libs/appUtils');
var responseModel = require('../assets/responseModel');
var responseMessage = require('../assets/responseMessage');
var dbNames = require('../assets/dbNames');
var pagingHelper = require('../helper/paginationHelper');
var api_errors = require('../assets/api_errors');
var userModel = require('./userModel');

var mysql = require('mysql');
var async = require('async');
var lodash = require('lodash');

var userModel_Admin = {};
module.exports = userModel_Admin;

/**
 * Subseler listing for admin/seller
 * @param {object} req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */

userModel_Admin.subsellerListing = function (req, callback) {
    var rules = {
        searchText: Check
            .that(req.body.searchText)
            .isOptional()
            .isLengthInRange(0, 20),
        pageNo: Check
            .that(req.body.pageNo)
            .isOptional()
            .isInteger(),
        pageSize: Check
            .that(req.body.pageSize)
            .isOptional()
            .isInteger(),
        sortBy: Check
            .that(req.body.sortBy)
            .isOptional()
            .isNotEmptyOrBlank(),
        sortOrder: Check
            .that(req.body.sortOrder)
            .isOptional()
            .isNotEmptyOrBlank()
    };
    appUtils.validateChecks(rules, function (err) {
        if (err) {
            return callback(err);
        }
        var userId = req.auth.id;
        if (req.auth.roleId === 4 && req.body.sellerId) {
            userId = req.body.sellerId;
        }
        var pageInfo = pagingHelper.makePageObject(req.body);
        var sql = 'CALL ?? ( ?,?,?,?,?,?)';
        var parameters = [
            dbNames.sp.subsellerList, userId, req.body.searchText ?
            req
            .body
            .searchText
            .trim() :
            '',
            pageInfo.skip,
            pageInfo.limit,
            req.body.sortBy ?
            req.body.sortBy :
            '',
            req.body.sortOrder ?
            req.body.sortOrder :
            ''
        ];
        sql = mysql.format(sql, parameters);
        dbHelper.executeQuery(sql, function (err, result) {
            if (err) {
                return callback(err);
            }
            var response = new responseModel.arrayResponse();
            if (result[1].length) {
                response.data = result[1];
                response.count = result[0][0].totalRecords;
            }
            return callback(null, response);
        });
    });
};


/**
 * Seller listing for admin
 * @param {object} req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */

userModel_Admin.sellerListing = function (req, callback) {
    var rules = {
        searchText: Check
            .that(req.body.searchText)
            .isOptional()
            .isLengthInRange(0, 20),
        pageNo: Check
            .that(req.body.pageNo)
            .isOptional()
            .isInteger(),
        pageSize: Check
            .that(req.body.pageSize)
            .isOptional()
            .isInteger(),
        sortBy: Check
            .that(req.body.sortBy)
            .isOptional()
            .isNotEmptyOrBlank(),
        sortOrder: Check
            .that(req.body.sortOrder)
            .isOptional()
            .isNotEmptyOrBlank()
    };
    appUtils.validateChecks(rules, function (err) {
        if (err) {
            return callback(err);
        }
        var pageInfo = pagingHelper.makePageObject(req.body);
        var sql = 'CALL ?? ( ?,?,?,?,?)';
        var parameters = [
            dbNames.sp.sellerList, req.body.searchText ?
            req
            .body
            .searchText
            .trim() :
            '',
            pageInfo.skip,
            pageInfo.limit,
            req.body.sortBy ?
            req.body.sortBy :
            '',
            req.body.sortOrder ?
            req.body.sortOrder :
            ''
        ];
        sql = mysql.format(sql, parameters);
        dbHelper.executeQuery(sql, function (err, result) {
            if (err) {
                return callback(err);
            }
            var response = new responseModel.arrayResponse();
            if (result[1].length) {
                response.data = result[1];
                response.count = result[0][0].totalRecords;
            }
            return callback(null, response);
        });
    });
};


/**
 * Dealer listing for admin
 * @param {object} req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */

userModel_Admin.dealerListing = function (req, callback) {
    var rules = {
        searchText: Check
            .that(req.body.searchText)
            .isOptional()
            .isLengthInRange(0, 20),
        pageNo: Check
            .that(req.body.pageNo)
            .isOptional()
            .isInteger(),
        pageSize: Check
            .that(req.body.pageSize)
            .isOptional()
            .isInteger(),
        sortBy: Check
            .that(req.body.sortBy)
            .isOptional()
            .isNotEmptyOrBlank(),
        sortOrder: Check
            .that(req.body.sortOrder)
            .isOptional()
            .isNotEmptyOrBlank()
    };
    appUtils.validateChecks(rules, function (err) {
        if (err) {
            return callback(err);
        }
        var pageInfo = pagingHelper.makePageObject(req.body);
        var sql = 'CALL ?? ( ?,?,?,?,?)';
        var parameters = [
            dbNames.sp.dealerList, req.body.searchText ?
            req
            .body
            .searchText
            .trim() :
            '',
            pageInfo.skip,
            pageInfo.limit,
            req.body.sortBy ?
            req.body.sortBy :
            '',
            req.body.sortOrder ?
            req.body.sortOrder :
            ''
        ];
        sql = mysql.format(sql, parameters);
        dbHelper.executeQuery(sql, function (err, result) {
            if (err) {
                return callback(err);
            }
            var response = new responseModel.arrayResponse();
            if (result[1].length) {
                response.data = result[1];
                response.count = result[0][0].totalRecords;
            }
            return callback(null, response);
        });
    });
};

/**
 * Junior admin listing for admin
 * @param {object} req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */

userModel_Admin.userDetail = function (req, callback) {
    var rules = {
        userId: Check
            .that(req.params.userId)
            .isMYSQLId()
    };
    appUtils.validateChecks(rules, function (err) {
        if (err) {
            return callback(err);
        }
        var sql = 'CALL ?? ( ?)';
        var parameters = [dbNames.sp.userDetail, req.params.userId];
        sql = mysql.format(sql, parameters);
        dbHelper.executeQuery(sql, function (err, result) {
            if (err) {
                return callback(err);
            }
            if (result[0].length) {
                var response = new responseModel.objectResponse();
                response.data = result[0][0];
                return callback(err, response);
            }
            return callback(ApiException.newNotFoundError(null).addDetails(responseMessage.USER_NOT_FOUND));
        });
    });
};

/**
 * Junior admin listing for admin
 * @param {object} req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */

userModel_Admin.updateUserProfile = function (req, callback) {
    async
    .series([
        function (cb) {
            validateUserObject(req, cb);
        },
        function (cb) {
            if (req.body.email) {
                checkDuplicateRegistratrtion(req.body.email, function (err, status) {
                    if (err) {
                        return cb(err);
                    }
                    if (status) {
                        return cb(ApiException.newNotAllowedError(api_errors.already_registered.error_code, null).addDetails(api_errors.already_registered.description));
                    }
                    return cb(null);
                });
            } else {
                return cb(null);
            }
        },
        function (cb) {
            updateProfileData(req.body, req.body.userId, cb);
        }
    ], function (err, result) {
        return callback(err, err ?
            null :
            result[2]);
    });
};

/**
 * Delete user
 * @param {object} req -express request object
 * @param {function(Error,object)} callback - callback function.
 */
userModel_Admin.deleteUser = function (req, callback) {
    var rules = {
        userId: Check
            .that(req.body.userId)
            .isInteger()
    };
    appUtils.validateChecks(rules, function (err) {
        if (err) {
            return callback(err);
        }
        var stringQuery = 'CALL ?? ( ?)';
        var parameters = [dbNames.sp.deleteUser, req.body.userId];
        stringQuery = mysql.format(stringQuery, parameters);
        dbHelper.executeQuery(stringQuery, function (err, result) {
            if (err) {
                return callback(err);
            }
            if (result[0][0].affectedRow > 0) {
                var response = new responseModel.objectResponse();
                response.message = responseMessage.USER_DELETED;
                return callback(null, response);
            }
            return callback(ApiException.newNotFoundError(null).addDetails(responseMessage.USER_NOT_FOUND));
        });
    });
};

/**
 * Add subseller
 * @param {object} req -express request object
 * @param {function(Error,object)} callback - callback function.
 */
userModel_Admin.addSubseller = function (req, callback) {
    req.body.isInternalCall = true;
    req.body.roleId = 2;
    userModel.createPublicUser(req, (err, data) => {
        if (err) {
            return callback(err);
        }
        var response = new responseModel.objectResponse();
        response.message = responseMessage.REGISTRATION_SUCCESSFULL;
        return callback(null, response);
    });
};

/**
 * Seller dashboard info
 * @param {object} req -express request object
 * @param {function(Error,object)} callback - callback function.
 */
userModel_Admin.sellerDashBoardInfo = function (req, callback) {

    var sellerId = 0;
    var subsellerId = 0;

    if (req.auth.roleId === 1) {
        sellerId = req.auth.id;
    }

    if (req.auth.roleId === 2) {
        subsellerId = req.auth.id;
    }
    var sql = 'CALL ?? ( ?,?)';
    var parameters = [
        dbNames.sp.sellerDashBoardInfo, sellerId,
        subsellerId
    ];
    sql = mysql.format(sql, parameters);
    dbHelper.executeQuery(sql, function (err, result) {
        if (err) {
            return callback(err);
        }
        var payload = {
            liveAuctions: result[0],
            upcomingAuctions: result[1],
            pendingAuctions: result[2]
        };
        var response = new responseModel.objectResponse();
        response.data = payload;

        return callback(null, response);

    });
};

/**
 * Dealer dashboard info
 * @param {object} req -express request object
 * @param {function(Error,object)} callback - callback function.
 */
userModel_Admin.dealerDashBoardInfo = function (req, callback) {

    var sql = 'CALL ?? ()';
    var parameters = [
        dbNames.sp.dealerDashBoardInfo
    ];
    sql = mysql.format(sql, parameters);
    dbHelper.executeQuery(sql, function (err, result) {
        if (err) {
            return callback(err);
        }
        var payload = {
            liveAuctions: result[0],
            upcomingAuctions: result[1],
        };
        var response = new responseModel.objectResponse();
        response.data = payload;

        return callback(null, response);

    });
};


/**
 * Admin dashboard info
 * @param {object} req -express request object
 * @param {function(Error,object)} callback - callback function.
 */
userModel_Admin.adminDashBoardInfo = function (req, callback) {

    var sql = 'CALL ?? ()';
    var parameters = [
        dbNames.sp.adminDashBoardInfo
    ];
    sql = mysql.format(sql, parameters);
    dbHelper.executeQuery(sql, function (err, result) {
        if (err) {
            return callback(err);
        }
        var payload = {
            pendingAuctions: result[0][0].pendingAuctions,
            pendingSellers: result[1][0].pendingSellers,
            pendingDealers: result[2][0].pendingDealers,

        };
        var response = new responseModel.objectResponse();
        response.data = payload;

        return callback(null, response);

    });
};

var validateUserObject = function (req, callback) {
    var rules = {
        userId: Check
            .that(req.body.userId)
            .isInteger(),
        firstName: Check
            .that(req.body.firstName)
            .isNotEmptyOrBlank()
            .isLengthInRange(1, 50),
        lastName: Check
            .that(req.body.lastName)
            .isNotEmptyOrBlank()
            .isLengthInRange(1, 50),
        contactNo: Check
            .that(req.body.contactNo)
            .isOptional()
            .isNotEmptyOrBlank()
            .isLengthInRange(10, 20),
        roleId: Check
            .that(req.body.roleId)
            .isInteger()
            .isNumberInRange(1, 4)
    };
    appUtils.validateChecks(rules, callback);
};

/**
 * Use for updating other user's profile.
 * @param data{object} -
 * @param userId(int)-
 * @param {function(Error,object)} callback - callback function.
 */
var updateProfileData = function (data, userId, callback) {
    var insertObject = {};
    insertObject['firstName'] = lodash.capitalize(data.firstName.trim());
    insertObject['lastName'] = lodash.capitalize(data.lastName.trim());
    insertObject['phone'] = data.contactNo ?
        data.contactNo :
        '';
    if (data.imgUrl) {
        insertObject['imgUrl'] = data.imgUrl;
    }
    if (data.email) {
        insertObject['email'] = data.email;
    }
    var stringQuery = 'UPDATE ?? SET ? WHERE ??=? AND ??=?';
    var inserts = [
        'db_users',
        insertObject,
        'id',
        userId,
        'isDeleted',
        false
    ];
    stringQuery = mysql.format(stringQuery, inserts);
    dbHelper
        .executeQueryPromise(stringQuery)
        .then(function (result) {
            if (result.affectedRows == 1) {
                var response = new responseModel.objectResponse();
                response.message = responseMessage.PROFILE_UPDATED;

                return callback(null, response);
            }
            return callback(ApiException.newNotFoundError(null).addDetails(responseMessage.USER_NOT_FOUND));
        }, function (error) {
            return callback(error);
        });
};

/**
 * Check existance of email id in db_users table
 * @param {string} emailId
 * @param {function(Error,object)} callback - callback function
 */
var checkDuplicateRegistratrtion = function (emailId, callback) {
    var sql = 'CALL ?? ( ?);';
    var object = [dbNames.sp.checkDuplicateRegistration, emailId];
    sql = mysql.format(sql, object);
    dbHelper.executeQuery(sql, function (err, result) {
        if (err) {
            return callback(err);
        }
        if (result[0][0].count > 0) {
            return callback(null, true);
        }
        return callback(null, false);
    });
};