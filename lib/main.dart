// 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/Controllers/hive/hive_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash/splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PlayingAdapter());
  Hive.openBox<Playing>('playing');

  SystemsController().getSystemsList();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xff80DEEA),
        primarySwatch: Colors.blue,
        fontFamily: "Yekan",
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}
