import 'dart:async';

import 'package:flutter/services.dart';

class FlutterNordicDfu {

  static const String NAMESPACE = 'com.timeyaa.flutter_nordic_dfu';

  static const MethodChannel _channel =
  const MethodChannel('$NAMESPACE/method');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> startDfu(String address, String filePath,
      {String name, bool fileInAsset = false}) async {
    return await _channel.invokeMethod('startDfu', <String, dynamic>{
      'address': address,
      'filePath': filePath,
      'name': name,
      'fileInAsset': fileInAsset
    });
  }
}
