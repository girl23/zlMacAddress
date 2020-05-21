import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:zlmacaddress/zlmacaddress.dart';
import 'testPage.dart';
import 'testPage2.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body:HomePage(),

      ),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Zlmacaddress.platformVersion;
//      Zlmacaddress s= new  Zlmacaddress();
//      s.sendMessage({"method":"test","ontent":"flutter 中的数据","code":100});
//      s.receiveMessage();
//    await Zlmacaddress.sendMessage({"method":"test2","ontent":"flutter 中的数据","code":100}).then((val){
//      int code = val["code"];
//      String message=val["message"];
//      print('#####${message}');
//    });
//    Zlmacaddress.receiveMessage();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Center(
      child:Column(
        children: <Widget>[
          Text('Running on: $_platformVersion\n'),
          FlatButton(
            child: Text('Tap'),
            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenusDemo()));
//              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>BasicMessageChannelPage('jjj') ));

            } ,

          )
        ],
      ),
//          Text('Running on: $_platformVersion\n'),
    );
  }
}
