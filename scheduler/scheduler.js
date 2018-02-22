var CronJob = require('cron').CronJob;
var mysql = require('mysql');
var async = require('async');

var dbHelper = require('../helper/dbHelper');
var dbNames = require('../assets/dbNames');

var bidWinJob = new CronJob(
    '0 */5 * * * *',
    function () {
        job();
    },
    function () {},
    true /* Start the job right now */
);


function job() {
    console.log(`starting job ${new Date()}`);
    async.waterfall([
        cb => {
            var sql = 'CALL ?? ()';
            var parameters = [dbNames.sp.dealerWinCron];
            sql = mysql.format(sql, parameters);
            dbHelper.executeQuery(sql, cb);
        },
        (result, cb) => {
            let insertObject = [];
            result[0].forEach(r => {
                const {
                    amount,
                    vehicleId,
                    sellerId,
                    subsellerId,
                    upperSeller
                } = r;
                const comission = calculateComission(amount);
                insertObject.push([vehicleId, 0, comission.askwheel]);
                if (subsellerId && upperSeller) {
                    insertObject.push([vehicleId, subsellerId, comission.subseller]);
                    insertObject.push([vehicleId, upperSeller, comission.seller]);
                }
                if (sellerId) {
                    insertObject.push([vehicleId, sellerId, comission.subseller + comission.seller]);
                }
            });
            if (!insertObject.length) {
                return cb(null);
            }
            var stringQuery = 'INSERT INTO db_payment (vehicleId,userId,comission) VALUES ?';
            stringQuery = mysql.format(stringQuery, [insertObject]);
            dbHelper.executeQuery(stringQuery, cb);
        }
    ], err => {
        console.log('job completed', err);
    });
}

function calculateComission(amount) {

    if (amount <= 100000) {
        return {
            seller: 3500,
            subseller: 1500,
            askwheel: 6000
        };
    }
    if (amount > 100000 && amount <= 300000) {
        return {
            seller: 5000,
            subseller: 2500,
            askwheel: 7500
        };
    }
    if (amount > 300000 && amount <= 600000) {
        return {
            seller: 7000,
            subseller: 4000,
            askwheel: 10000
        };
    }
    if (amount > 600000 && amount <= 1000000) {
        return {
            seller: 10000,
            subseller: 5000,
            askwheel: 20000
        };
    }
    if (amount > 1000000 && amount <= 2000000) {
        return {
            seller: 15000,
            subseller: 8000,
            askwheel: 27000
        };
    }
    return {
        seller: 20000,
        subseller: 10000,
        askwheel: 40000
    };
}