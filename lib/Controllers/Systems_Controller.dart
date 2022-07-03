import 'dart:async';
import 'package:cafe_time/models/SystemModel.dart';
import 'package:cafe_time/models/TimeKind.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class SystemsController extends GetxController {
  var box = Hive.box('systems');
  var timeKind = TimeKind.free.obs;
  var controllers = 2.obs;
  var timeNow = DateTime.now().obs;
  var formattedTime = DateFormat.Hms().format(DateTime.now()).obs;
  var systemsList = <SystemModel>[].obs;
  Timer timer;

  @override
  void onInit() {
    Hive.openBox('systems');
    systemsList.value = box.values.toList().cast<SystemModel>();
    systemsList.forEach((element) {
      print(element.seconds);
    });
    super.onInit();
  }

  void addSystem(SystemModel system) async {
    await box.put(system.name.toString(), system);
    systemsList.value = await box.values.toList().cast<SystemModel>();
  }

  void TurnOnSystem(SystemModel system) async {
    final newSystem = await SystemModel()
      ..name = system.name
      ..isPlaying = true
      ..controller = controllers.value;
    // ..time = timer as DateTime;

    box.put(system.name, newSystem);
    await FlutterBackgroundService().sendData({'name': system.name});
    systemsList.value = await box.values.toList().cast<SystemModel>();
    controllers.value = 2;
  }

  changeTimeKine(String value) {
    if (value == 'آزاد') {
      timeKind.value = TimeKind.free;
    } else {
      timeKind.value = TimeKind.set;
    }
  }

  void startTimer(String systemName) {}
}
