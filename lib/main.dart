// 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'dart:async';

import 'package:cafe_time/Controllers/system_name_provider.dart';
import 'package:cafe_time/models/SystemModel.dart';
import 'package:cafe_time/view/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'splash/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_isolate/flutter_isolate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final applicationDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(applicationDocumentDir.path);
  Hive.registerAdapter(SystemModelAdapter());
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  runApp(MyApp());
}

void onStart() {
  WidgetsFlutterBinding.ensureInitialized();
  final service = FlutterBackgroundService();
  final audioplayer = AudioPlayer();
  Timer timer;
  SystemModel system;

  void startTimer() {
    if (system.isPlaying) {
      const oneSec = const Duration(seconds: 1);
      timer = new Timer.periodic(oneSec, (Timer timer) {
        if (system.seconds < 0) {
          timer.cancel();
        } else {
          system.seconds = system.seconds + 1;
          if (system.seconds > 59) {
            system.minutes += 1;
            system.seconds = 0;
            if (system.minutes > 59) {
              system.hours += 1;
              system.minutes = 0;
            }
          }
        }
      });
    }
  }

  service.onDataReceived.listen((systemName) async {
    print(systemName);
    final box = await Hive.box('systems');
    final curentName = systemName['name'] as String;
    system = await box.get(curentName) as SystemModel;
    startTimer();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    FlutterBackgroundService.initialize(onStart);
  }

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
      home: FutureBuilder(
        future: Hive.openBox('systems'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return MyHomePage();
            }
          } else {
            return LoadingWidget(
              mainFontColor: Colors.black,
            );
          }
        },
      ),
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
