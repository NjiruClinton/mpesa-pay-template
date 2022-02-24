const functions = require("firebase-functions");

exports.receiveCallback = functions.https.onRequest(async (req, res) => {

    const original = req.body.Body;
    console.log("RECEIVE RESPONCE: ", original)

    res.json({result: `Done`});
  });
