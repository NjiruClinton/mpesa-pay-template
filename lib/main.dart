import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'dart:async';

void main() {
  MpesaFlutterPlugin.setConsumerKey("consumerkey");
  MpesaFlutterPlugin.setConsumerSecret("consumersecret");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Future<void> lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: "174379",
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: 1.0,
          partyA:  "2547...9",
          partyB: "174379",
          callBackURL: Uri(scheme: "https",
              host: "mpesa-requestbin.herokuapp.com",
              path: "/1jdrrwlm1"),
          //This url has been generated from http://mpesa-requestbin.herokuapp.com/?ref=hackernoon.com for test purposes
          accountReference: "Clinton Njiru tests",
          phoneNumber:  "2547...9",
          baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
          transactionDesc: "purchase",
          passKey:"//from simulate test credentials in customer to business api");
      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      return transactionInitialisation;
    }
    catch (e) {
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xFF481E4D)),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Mpesa Payment Demo'),
              centerTitle: true,),
            body: Center(
                child: ElevatedButton(
                    onPressed: () {
                      lipaNaMpesa();
                    },

                    child: Text("Lipa na Mpesa",
                      style: TextStyle(color: Colors.white),)
                )
            )
        )
    );
  }
}
