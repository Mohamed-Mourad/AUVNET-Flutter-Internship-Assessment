import 'package:auvnet_task/app/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:auvnet_task/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await CacheHelper.init();
  // await DioHelper.init();

  await Hive.initFlutter();
  await di.init();

  runApp(const App());
}