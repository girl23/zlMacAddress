import 'dart:async';

import 'package:flutter/services.dart';
//BasicMessageChannel
//用于传递字符串和半结构化的消息，收到消息后可以回复消息，持续进行通信。
//MethodChannel
//用于方法调用，是一次性通信。如Flutter调用原生相机相册等；
//EventCHannel
//用于数据流的通信，也是持续性通信，但收到消息后不能回复消息。通常用户原生想Flutter传递手机电量变化、网络连接变化等；
class Zlmacaddress {
  //创建 “ MethodChannel”这个名字要与原生创建时的传入值保持一致
  static const MethodChannel _channel =
      const MethodChannel('zlmacaddress');

  static Future<String> get platformVersion async {
    /*
 * invokeMethod<T>(String method, [dynamic arguments])
 * method：要调用的方法名
 * arguments：传参（可不传）
 */
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

//  static const messageChannel = const BasicMessageChannel('flutter_and_native_100', StandardMessageCodec());
//  //发送消息
// static Future<Map> sendMessage(Map json) async {
//
//    Map reply = await messageChannel.send(json);
//
//    //解析 原生发给 Flutter 的参数
//    int code = reply["code"];
//    String message=reply["message"];
////    setState(() {
////      recive="code:$code message:$message";
////    });
//   print('++++++++${message}');
//    return reply;
//  }
//  //接收消息监听
//  static  void receiveMessage() {
//    messageChannel.setMessageHandler((result) async {
//
//      //解析 原生发给 Flutter 的参数
//      int code = result["code"];
//      String message=result["message"];
//      print('++++++++${result["message"]}');
////      setState(() {
////        recive="receiveMessage: code:$code message:$message";
////      });
//      return 'Flutter 已收到消息';
//    });
//  }
}
