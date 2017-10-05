var dbHelper = require('../helper/dbHelper');
var Check = require('../libs/core/Check');
var appUtils = require('../libs/appUtils');
var responseModel = require('../assets/responseModel');
var responseMessage = require('../assets/responseMessage');
var dbNames = require('../assets/dbNames');
var pagingHelper = require('../helper/paginationHelper');
var api_errors = require('../assets/api_errors');


var mysql = require('mysql');
var async = require('async');
var lodash = require('lodash');

var auction = {};
module.exports = auction;

auction.uploadVehicle = function (req, callback) {
    var insertObject = {};

    const {
        basic_info,
        specification,
        features,
        inspection_report,
        images,
    } = req.body;

    var omitKeys = ['images', 'max_power', 'max_torque'];

    const {
        dimensions_weight,
        capacity,
        engine_taransmission,
        suspension_breaks_steering_tyres
    } = specification;

    const {
        max_power,
        max_torque
    } = engine_taransmission;

    const {
        feature,
        manufacturer_warranty
    } = features;

    let featureString = {};


    lodash.forEach(feature, (value, key) => {
        if (lodash.isArray(value)) {
            featureString[key] = value.toString();
        }
    });

    insertObject = lodash.assign({}, basic_info, dimensions_weight,
        capacity, engine_taransmission, suspension_breaks_steering_tyres,
        manufacturer_warranty, featureString);

    insertObject = lodash.omit(insertObject, omitKeys);

    insertObject.max_power_bhp = max_power.bhp;
    insertObject.max_power_rpm = max_power.rpm;

    insertObject.max_torque_nm = max_torque.nm;
    insertObject.max_torque_rpm = max_torque.rpm;

    var response = new responseModel.objectResponse();
    response.message = 'Vehicle uploaded';

    return callback(null, response);
};