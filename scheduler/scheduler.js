var CronJob = require('cron').CronJob;
var mysql = require('mysql');

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
    var sql = 'CALL ?? ()';
    var parameters = [
        dbNames.sp.dealerWinCron
    ];
    sql = mysql.format(sql, parameters);
    dbHelper.executeQuery(sql, (err) => {
        console.log('Job completed', err);
    });
}