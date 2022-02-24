import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

void main() {
  runApp(const MyApp());
  MpesaFlutterPlugin.setConsumerKey("j8feFvMTXarCytPXjjqrrAMplKgG8b6D");
  MpesaFlutterPlugin.setConsumerSecret("EiebYVmzoNnvzLsC");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'mpesa demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<dynamic> startTransaction({required double amount, required String phone}) async {
    dynamic transactionInitialisation;
//Wrap it with a try-catch
    try {
//Run it
      transactionInitialisation =
      await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: "174379",
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: amount,
          partyA: phone,
          partyB: "174379",
          callBackURL: Uri(scheme: "https", host : "us-central1-mpesa-demo-da5d1.cloudfunctions.net/paymentsCallback"),
          accountReference: "payment",
          phoneNumber: phone,
          baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
          transactionDesc: "demo",
          passKey: "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");


      HashMap result = transactionInitialisation as HashMap<String, dynamic>;
      print("RESULT: "+transactionInitialisation.toString());
    }

    catch (e) {
      //print(e.getMessage());
    }
  }
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          startTransaction(amount: 10.0, phone: "254757800184");
        },
        tooltip: 'Increment',
        child: Text("Pay"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
