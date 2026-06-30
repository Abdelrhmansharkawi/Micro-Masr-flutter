import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micromasr/app.dart';
import 'package:micromasr/core/network/dio_client.dart';
import 'package:micromasr/core/services/maps_config_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  DioClient.init();
  await MapsConfigService.init();

  runApp(const MicroMasrApp());
}
