import 'dart:async';

import 'package:cafe_time/models/SystemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class TimerController extends GetxController {
  TimerController({this.systemName});
  Timer _timer;
  String systemName;
  
  var seconds = 0.obs;
  var minutes = 0.obs;
  var hours = 0.obs;
  final box = Hive.box('systems');

   getTimer() async{
    const oneSec = const Duration(seconds: 1);
    _timer =await new Timer.periodic(oneSec, (timer) {
      SystemModel system = box.get(systemName);
      seconds.value =  system.seconds;
      minutes.value =  system.minutes;
      hours.value = system.hours;
    });
  }
}
