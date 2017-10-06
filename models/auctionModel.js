var dbHelper = require('../helper/dbHelper');
var Check = require('../libs/core/Check');
var appUtils = require('../libs/appUtils');
var responseModel = require('../assets/responseModel');
var responseMessage = require('../assets/responseMessage');
var dbNames = require('../assets/dbNames');
var pagingHelper = require('../helper/paginationHelper');
var api_errors = require('../assets/api_errors');
var ApiException = require('../libs/core/ApiException');

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

    async.waterfall([
        cb => {
            insertVehicle(req, cb);
        },
        (insertInfo, cb) => {
            var vehicleId = insertInfo.insertId;
            let {basic_info} = req.body;
            insertVehicleImages(vehicleId, basic_info.images, cb);
        }
    ], (err, result) => {
        if (err) {
            return callback(err);
        }

        var response = new responseModel.objectResponse();
        response.message = 'Vehicle uploaded';

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

        features.push({feature_type: "Breaking Traction", feature_type_id: "feature_break", options: result[0]});

        features.push({feature_type: "Comfort Conveneince", feature_type_id: "feature_comfort", options: result[1]});

        features.push({feature_type: "Exterior", feature_type_id: "feature_doors", options: result[2]});

        features.push({feature_type: "Entertainment", feature_type_id: "feature_entertainment", options: result[3]});

        features.push({feature_type: "Exterior", feature_type_id: "feature_exterior", options: result[4]});

        features.push({feature_type: "Instrumentation", feature_type_id: "feature_instrument", options: result[5]});

        features.push({feature_type: "Lightning", feature_type_id: "feature_light", options: result[6]});

        features.push({feature_type: "Safety", feature_type_id: "feature_safety", options: result[7]});

        features.push({feature_type: "Seat", feature_type_id: "feature_seat", options: result[8]});

        features.push({feature_type: "Lock Security", feature_type_id: "feature_lock", options: result[9]});

        features.push({feature_type: "Storage", feature_type_id: "feature_storage", options: result[10]});

        var response = new responseModel.arrayResponse();
        response.data = features;
        response.count = features.length;
        
        return callback(null, response);

    });

};

/**
 * Insert vehicle information in database
 * @param {object} - req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */
var insertVehicle = function (req, callback) {
    var insertObject = {};

    const {basic_info, specification, features, inspection_report, images} = req.body;

    var omitKeys = ['images', 'max_power', 'max_torque'];

    try {

        const {dimensions_weight, capacity, engine_taransmission, suspension_breaks_steering_tyres} = specification;

        const {max_power, max_torque} = engine_taransmission;

        const {feature, manufacturer_warranty} = features;

        let featureString = {};

        lodash.forEach(feature, (value, key) => {
            if (lodash.isArray(value)) {
                featureString[key] = value.toString();
            }
        });

        insertObject = lodash.assign({}, basic_info, dimensions_weight, capacity, engine_taransmission, suspension_breaks_steering_tyres, manufacturer_warranty, featureString);

        insertObject = lodash.omit(insertObject, omitKeys);

        insertObject.max_power_bhp = max_power.bhp;
        insertObject.max_power_rpm = max_power.rpm;

        insertObject.max_torque_nm = max_torque.nm;
        insertObject.max_torque_rpm = max_torque.rpm;

        insertObject.evaluation_date = new Date(basic_info.evaluation_date);

        insertObject.inspection_report = JSON.stringify(inspection_report);

        if (req.auth.roleId === 1) {
            insertObject.sellerId = req.auth.id;
        }

        if (req.auth.roleId === 2) {
            insertObject.subsellerId = req.auth.id;
        }

    } catch (error) {
        return callback(ApiException.newBadRequestError(error.message));
    }

    var stringQuery = 'INSERT INTO db_vehicle SET ?';
    stringQuery = mysql.format(stringQuery, insertObject);
    dbHelper.executeQuery(stringQuery, callback);

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