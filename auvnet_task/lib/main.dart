import 'package:auvnet_task/app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await CacheHelper.init();
  // await DioHelper.init();

  runApp(const App());
}