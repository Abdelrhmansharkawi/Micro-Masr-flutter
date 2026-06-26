import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micromasr/app.dart';
import 'package:micromasr/core/network/dio_client.dart'; // <-- import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  DioClient.init();

  runApp(const MicroMasrApp());
}
