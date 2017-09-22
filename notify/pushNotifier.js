var config = require('config');
var Push = require('../libs/Push');
var path = require('path');

// define module
var pushNotifier = {};
module.exports = pushNotifier;

// setup push instance
var push = new Push();
var gcmConf = config.get('push.gcm');


push.initGcm(gcmConf.gcm_key);


// set formatter for gcm push
push.setGcmMessageFormatter(function (msg, data) {
    var gcm_data = {};
    gcm_data.message = data.payload;
    gcm_data.message.aps = {};
    gcm_data.message.aps.alert = data.message;
    msg.addData(gcm_data);

});

/**
 * Send a push notification to given push devices. The type of notification is to be conveyed by code,
 * and should be used to specify a corresponding message.
 * The data for the message is in the given payload.
 * @param {array} gcm device - an array of gcm devices.
 * @param {array} apn device - an array of apn devices.
 * @param {object} payload - notification data.
 */

pushNotifier.sendPush = function (gcm_devices, payload, callback) {
    var data = {
        payload: payload,
        message: payload.message
    };
    if (gcm_devices.length) {
        push.sendGcm(gcm_devices, data);
    }
    return callback();

};