var dbHelper = require('../helper/dbHelper');
var Check = require('../libs/core/Check');
var appUtils = require('../libs/appUtils');
var responseModel = require('../assets/responseModel');
var responseMessage = require('../assets/responseMessage');
var dbNames = require('../assets/dbNames');
var pagingHelper = require('../helper/paginationHelper');
var ApiException = require('../libs/core/ApiException');
var push = require('../notify/pushNotifier');

var mysql = require('mysql');
var async = require('async');
var lodash = require('lodash');

var auction = {};
module.exports = auction;

/**
 * Upload vehicle
 * @param {object} - req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */
auction.uploadVehicle = function (req, callback) {
    async.waterfall(
        [
            cb => {
                insertVehicle(req, true, cb);
            },
            (insertInfo, cb) => {
                var vehicleId = insertInfo.insertId;
                let {
                    basic_info
                } = req.body;
                insertVehicleImages(vehicleId, basic_info.images, err => {
                    if (err) {
                        return cb(err);
                    }
                    return cb(null, vehicleId);
                });
            },
            (vehicleId, cb) => {
                let notificationObject = {
                    vehicleId,
                    vehicle_status: 1
                };
                let stringQuery = 'INSERT INTO db_seller_notification SET ?';
                stringQuery = mysql.format(stringQuery, notificationObject);
                dbHelper.executeQuery(stringQuery, cb);
            }
        ],
        err => {
            if (err) {
                return callback(err);
            }

            var response = new responseModel.objectResponse();
            response.message = 'Vehicle uploaded';

            return callback(null, response);
        }
    );
};

/**
 * Update vehicle
 * @param {object} - req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */
auction.updateVehicle = (req, callback) => {
    const {
        vehicleId
    } = req.params;
    async.series([
        cb => {
            insertVehicle(req, false, cb);
        },
        cb => {
            deleteExistingImage(vehicleId, cb);
        },
        cb => {
            let {
                basic_info
            } = req.body;
            insertVehicleImages(vehicleId, basic_info.images, cb);
        }
    ], err => {
        if (err) {
            return callback(err);
        }
        var response = new responseModel.objectResponse();
        response.message = 'Vehicle updated';
        return callback(null, response);
    });
};

/**
 * List features for vehicle oploads
 * @param {object} - req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */
auction.listFeatures = function (req, callback) {
    var sql = 'CALL ?? ()';
    var parameters = [dbNames.sp.featureList];
    sql = mysql.format(sql, parameters);
    dbHelper.executeQuery(sql, function (err, result) {
        if (err) {
            return callback(err);
        }

        var features = [];

        features.push({
            feature_type: 'Breaking Traction',
            feature_type_id: 'feature_break',
            options: result[0]
        });

        features.push({
            feature_type: 'Comfort Conveneince',
            feature_type_id: 'feature_comfort',
            options: result[1]
        });

        features.push({
            feature_type: 'Exterior',
            feature_type_id: 'feature_doors',
            options: result[2]
        });

        features.push({
            feature_type: 'Entertainment',
            feature_type_id: 'feature_entertainment',
            options: result[3]
        });

        features.push({
            feature_type: 'Exterior',
            feature_type_id: 'feature_exterior',
            options: result[4]
        });

        features.push({
            feature_type: 'Instrumentation',
            feature_type_id: 'feature_instrument',
            options: result[5]
        });

        features.push({
            feature_type: 'Lightning',
            feature_type_id: 'feature_light',
            options: result[6]
        });

        features.push({
            feature_type: 'Safety',
            feature_type_id: 'feature_safety',
            options: result[7]
        });

        features.push({
            feature_type: 'Seat',
            feature_type_id: 'feature_seat',
            options: result[8]
        });

        features.push({
            feature_type: 'Lock Security',
            feature_type_id: 'feature_lock',
            options: result[9]
        });

        features.push({
            feature_type: 'Storage',
            feature_type_id: 'feature_storage',
            options: result[10]
        });

        var response = new responseModel.arrayResponse();
        response.data = features;
        response.count = features.length;

        return callback(null, response);
    });
};

/**
 * Vehicle listing for admin
 * @param {object} req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */

auction.vehicleListAdmin = function (req, callback) {
    var rules = {
        searchText: Check.that(req.body.searchText)
            .isOptional()
            .isLengthInRange(0, 20),
        pageNo: Check.that(req.body.pageNo)
            .isOptional()
            .isInteger(),
        pageSize: Check.that(req.body.pageSize)
            .isOptional()
            .isInteger(),
        sortBy: Check.that(req.body.sortBy)
            .isOptional()
            .isNotEmptyOrBlank(),
        sortOrder: Check.that(req.body.sortOrder)
            .isOptional()
            .isNotEmptyOrBlank()
    };
    appUtils.validateChecks(rules, function (err) {
        if (err) {
            return callback(err);
        }
        var pageInfo = pagingHelper.makePageObject(req.body);
        var sql = 'CALL ?? ( ?,?,?,?,?,?)';
        var parameters = [
            dbNames.sp.vehicleListAdmin,
            req.body.sellerId ? req.body.sellerId : 0,
            req.body.subSellerId ? req.body.subSellerId : 0,
            pageInfo.skip,
            pageInfo.limit,
            req.body.sortBy ? req.body.sortBy : '',
            req.body.sortOrder ? req.body.sortOrder : ''
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
 * For change vehicle flags
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */
auction.changeVehicleStatus = function (req, callback) {
    var rules = {
        vehicleId: Check.that(req.body.vehicleId).isInteger(),
        status: Check.that(req.body.status).isInteger()
    };
    appUtils.validateChecks(rules, function (err) {
        if (err) {
            return callback(err);
        }
        changeVehicleStatusFlag(req.body, callback);
    });
};

/**
 * For Auction listing seller and subseller
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */

auction.auctionListSeller = function (req, callback) {
    var sellerId = 0;
    var subsellerId = 0;

    if (req.auth.roleId === 1) {
        sellerId = req.auth.id;
    }

    if (req.auth.roleId === 2) {
        subsellerId = req.auth.id;
    }

    async.series(
        [
            cb => {
                var rules = {
                    auctionType: Check.that(req.body.auctionType)
                        .isOptional()
                        .isInteger(),
                    minPrice: Check.that(req.body.minPrice)
                        .isOptional()
                        .isInteger(),
                    maxPrice: Check.that(req.body.maxPrice)
                        .isOptional()
                        .isInteger(),
                    owner_type: Check.that(req.body.owner_type)
                        .isOptional()
                        .isInteger(),
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
                var sql = 'CALL ?? ( ?,?,?,?,?,?,?,?,?,?,?,?)';
                var parameters = [
                    dbNames.sp.auctionListSeller,
                    sellerId,
                    subsellerId,
                    req.body.auctionType ? req.body.auctionType : 0,
                    req.body.sub_sellers ? req.body.sub_sellers : '',
                    req.body.minPrice ? req.body.minPrice : 0,
                    req.body.maxPrice ? req.body.maxPrice : 0,
                    req.body.fuel_type ? req.body.fuel_type : '',
                    req.body.owner_type ? req.body.owner_type : -1,
                    req.body.transmission_type ? req.body.transmission_type : '',
                    req.body.sortBy ? req.body.sortBy : '',
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
 * For Auction listing dealer
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */

auction.auctionListDealer = function (req, callback) {
    async.series(
        [
            cb => {
                var rules = {
                    auctionType: Check.that(req.body.auctionType)
                        .isOptional()
                        .isInteger(),
                    minPrice: Check.that(req.body.minPrice)
                        .isOptional()
                        .isInteger(),
                    maxPrice: Check.that(req.body.maxPrice)
                        .isOptional()
                        .isInteger(),
                    owner_type: Check.that(req.body.owner_type)
                        .isOptional()
                        .isInteger(),
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
                var sql = 'CALL ?? ( ?,?,?,?,?,?,?,?,?,?)';
                var parameters = [
                    dbNames.sp.auctionListDealer,
                    req.auth.id,
                    req.body.auctionType ? req.body.auctionType : 0,
                    req.body.minPrice ? req.body.minPrice : 0,
                    req.body.maxPrice ? req.body.maxPrice : 0,
                    req.body.fuel_type ? req.body.fuel_type : '',
                    req.body.owner_type ? req.body.owner_type : -1,
                    req.body.transmission_type ? req.body.transmission_type : '',
                    req.body.sortBy ? req.body.sortBy : '',
                    pageInfo.skip,
                    pageInfo.limit,
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
 * Auction Detail
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */

auction.auctionDetail = function (req, callback) {
    async.series(
        [
            cb => {
                var rules = {
                    vehicleId: Check.that(req.params.vehicleId).isMYSQLId()
                };
                appUtils.validateChecks(rules, cb);
            },
            cb => {
                var sql = 'CALL ?? ( ?,?)';
                var parameters = [
                    dbNames.sp.auctionDetail,
                    parseInt(req.params.vehicleId),
                    req.auth.id
                ];
                sql = mysql.format(sql, parameters);
                dbHelper.executeQuery(sql, cb);
            }
        ],
        (err, result) => {
            if (err) {
                return callback(err);
            }
            var response = new responseModel.objectResponse();
            var dbResult = result[1];
            if (dbResult[0].length) {
                response.data = dbResult[0][0];
                response.data.inspection_report = JSON.parse(
                    dbResult[0][0].inspection_report ?
                        dbResult[0][0].inspection_report :
                        ''
                );
                const images = dbResult[1].map(image => image.url);
                response.data.images = images;
                response.data.bids = dbResult[2];
            }
            return callback(null, response);
        }
    );
};

/**
 * Get seller payments
 * @param {object} req -express object,
 * @param {function(Error,object)} callback - callback function.
 */

auction.getSellerPayment = function (req, callback) {
    var sellerId = 0;
    var subsellerId = 0;
    var isAdmin = false;

    if (req.auth.roleId === 1) {
        sellerId = req.auth.id;
    }

    if (req.auth.roleId === 2) {
        subsellerId = req.auth.id;
    }
    if (req.auth.roleId === 4) {
        isAdmin = true;
    }

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
                const {
                    startDate,
                    endDate,
                    subSellers
                } = req.body;

                var pageInfo = pagingHelper.makePageObject(req.body);
                var sql = 'CALL ?? ( ?,?,?,?,?,?,?,?)';
                var parameters = [
                    dbNames.sp.sellerPayments,
                    sellerId,
                    subsellerId,
                    isAdmin,
                    subSellers && subSellers.length ? subSellers.toString() : '',
                    startDate ? startDate : null,
                    endDate ? endDate : null,
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
 * Insert vehicle information in database
 * @param {object} - req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */
var insertVehicle = function (req, isInsert, callback) {
    var insertObject = {};

    const {
        vehicleId
    } = req.params;

    const {
        basic_info,
        inspection_report
    } = req.body;

    var omitKeys = ['images'];

    try {
        let {
            insurance_policy
        } = basic_info;
        insurance_policy.insurance_validation = insurance_policy.insurance_validation ? insurance_policy.insurance_validation : null;
        let basic_info_1 = lodash.omit(basic_info, ['insurance_policy']);
        insertObject = lodash.assign({}, basic_info_1, insurance_policy);

        insertObject = lodash.omit(insertObject, omitKeys);

        insertObject.evaluation_date = new Date(basic_info.evaluation_date);

        insertObject.inspection_report = JSON.stringify(inspection_report);

        if (isInsert) {
            if (req.auth.roleId === 1) {
                insertObject.sellerId = req.auth.id;
            }

            if (req.auth.roleId === 2) {
                insertObject.subsellerId = req.auth.id;
            }
        } else {
            insertObject.vehicle_status = 1;
        }

    } catch (error) {
        return callback(ApiException.newBadRequestError(error.message));
    }
    insertObject.reg_date = insertObject.reg_date ? insertObject.reg_date : null;
    if (isInsert) {
        let stringQuery = 'INSERT INTO db_vehicle SET ?';
        stringQuery = mysql.format(stringQuery, insertObject);
        dbHelper.executeQuery(stringQuery, callback);
    } else {
        let stringQuery = 'UPDATE ?? SET ? WHERE id = ?';
        stringQuery = mysql.format(stringQuery, ['db_vehicle', insertObject, vehicleId]);
        dbHelper.executeQuery(stringQuery, callback);
    }
};

/**
 * Used for inserting images for vehicle .
 * @param {int}  -vehicleId(int).
 * @param {char}  -urls(char).
 * @param {function(Error,object)} callback - callback function.
 */
var insertVehicleImages = function (vehicleId, urls, callback) {
    if (!urls || urls.length == 0) {
        return callback(null);
    }
    var insertObject = [];
    for (var index in urls) {
        insertObject.push([vehicleId, urls[index]]);
    }

    var stringQuery = 'INSERT INTO db_vehicle_images (vehicleId,url) VALUES ?';
    stringQuery = mysql.format(stringQuery, [insertObject]);
    dbHelper.executeQuery(stringQuery, callback);
};

var changeVehicleStatusFlag = function (vehicleobject, callback) {
    let {
        vehicleId,
        status,
        reason
    } = vehicleobject;
    var insertObject = {};
    var statusName = '';




    insertObject.vehicle_status = status;
    if (status == 2) {
        insertObject.admin_live_date = new Date();
        statusName = 'marked live';
    }
    if (status == 3) {
        insertObject.reject_reason = reason;
        statusName = 'rejected because ' + reason;
    }
    async.series(
        [
            cb => {
                let stringQuery = 'UPDATE ?? SET ? WHERE ??=?;';
                let inserts = ['db_vehicle', insertObject, 'id', vehicleId];
                stringQuery = mysql.format(stringQuery, inserts);
                dbHelper
                    .executeQueryPromise(stringQuery)
                    .then(() => cb(), error => cb(error));
            },
            cb => {
                let notificationObject = {
                    vehicleId,
                    vehicle_status: status
                };
                let stringQuery = 'INSERT INTO db_seller_notification SET ?';
                stringQuery = mysql.format(stringQuery, notificationObject);
                dbHelper.executeQuery(stringQuery, cb);
            },
            cb => {
                var sql = 'CALL ?? ( ?)';
                var parameters = [
                    dbNames.sp.sellerInfoForVehicle,
                    vehicleId
                ];
                sql = mysql.format(sql, parameters);
                dbHelper.executeQuery(sql, (err, result) => {
                    if (err) {
                        return cb(err);
                    }
                    let users = [];

                    result[0].forEach(r => {
                        if (r.deviceId) {
                            console.log(r);
                            users.push({
                                deviceId: r.deviceId,
                                title: 'Auction Changed',
                                body: `Vehicle ${r.vehicle_name} has been ${statusName} by Askwheels.`
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
            response.message = responseMessage.SUCCESS;
            return callback(null, response);
        }
    );
};

/**
 * Delete existing vehicle images
 */
var deleteExistingImage = (vehicleId, callback) => {
    let stringQuery = 'UPDATE ?? SET ? WHERE ??=?;';
    let inserts = ['db_vehicle_images', {
        isDeleted: true
    }, 'vehicleId', vehicleId];
    stringQuery = mysql.format(stringQuery, inserts);
    dbHelper.executeQuery(stringQuery, callback);
};