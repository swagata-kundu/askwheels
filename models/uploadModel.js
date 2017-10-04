var responseModel = require('../assets/responseModel');
var lodsah = require('lodash');


//define module

var uploadModel = {};
module.exports = uploadModel;

/**
 * Use for uploading multiple files 
 * @param {object} - req (express request object)
 * @param {function(Error,object)} callback - callback function.
 */

uploadModel.uploadMultiple = function (req, callback) {

    var images = [];

    lodsah.forEach(req.files, (file, index) => {
        images.push(file.path);
    });

    var response = new responseModel.arrayResponse();
    response.data = images;
    return callback(null, response);
};