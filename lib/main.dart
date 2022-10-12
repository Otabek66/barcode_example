import 'package:barcodescaner/screens/barcode_scan_sdk.dart/desktop.dart';
import 'package:barcodescaner/screens/barcode_scan_sdk.dart/mobile.dart';
import 'package:barcodescaner/screens/barcode_scan_sdk.dart/web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  if (kIsWeb) {
    runApp(Web());
  } else if (Platform.isAndroid || Platform.isIOS) {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;

    runApp(
      MaterialApp(
        title: 'Dynamsoft Barcode Reader',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Dynamsoft Barcode Reader"),
          ),
          body: Mobile(
            camera: firstCamera, key: Key(""),
          ),
        ),
      ),
    );
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    runApp(Desktop());
  }
}