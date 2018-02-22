const admin = require('firebase-admin');

const serviceAccount = require('../assets/google-services.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: 'https://askwheels-f9606.firebaseio.com/'
});

const sendMessage = ({
    title,
    body,
    deviceId
}) => {

    const message = {
        data: {
            title,
            body,
        },
        token: deviceId
    };

    admin.messaging().send(message).then(r => {
        console.log(r);
    }).catch(err => {
        console.log(err);
    });
};

const sendListNotification = (list) => {
    list.forEach(l => {
        sendMessage(l);
    });

};

module.exports = {
    sendListNotification
}