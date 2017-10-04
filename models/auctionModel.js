var lodash = require('lodash');

var auction = {};
module.exports = auction;

auction.uploadVehicle = function (req, callback) {
    var insertObject = {};

    const {
        basic_info,
        specification,
        features,
        inspection_report
    } = req.body;

    const {
        dimensions_weight,
        capacity,
        engine_taransmission,
        suspension_breaks_steering_tyres
    } = specification;

    insertObject = lodash.assign({}, basic_info, dimensions_weight,
        capacity, engine_taransmission, suspension_breaks_steering_tyres);
    return callback(null, insertObject);
};