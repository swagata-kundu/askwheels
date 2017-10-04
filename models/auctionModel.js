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

    insertObject = lodash.assign({}, basic_info, dimensions_weight,
        capacity, engine_taransmission, suspension_breaks_steering_tyres);

    insertObject = lodash.omit(insertObject, omitKeys);

    insertObject.max_power_bhp = max_power.bhp;
    insertObject.max_power_rpm = max_power.rpm;

    insertObject.max_torque_nm = max_torque.nm;
    insertObject.max_torque_rpm = max_torque.rpm;
    
    return callback(null, insertObject);
};