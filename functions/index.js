const functions = require("firebase-functions");

exports.receiveCallback = functions.https.onRequest(async (req, res) => {

    const original = req.body.Body;
    console.log("RECEIVE RESPONSE: ", original)

    res.json({result: `Done`});
  });
