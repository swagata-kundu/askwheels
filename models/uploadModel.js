var responseModel = require('../assets/responseModel');



//define module

var uploadModel = {};
module.exports = uploadModel;

/**
 * Use for uploading multiple files 
 * @param {object} - req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */

uploadModel.uploadMultiple = function (req, callback) {
    var response = new responseModel.arrayResponse();
    return callback(null, response);
};