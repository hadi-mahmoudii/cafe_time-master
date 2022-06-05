// import 'package:cafe_time/screen/provider/systems.dart';
import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/models/systems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayingController extends GetxController {
  SystemsController _systemsController = Get.put(SystemsController());

  Playingprovider() {
    playing = List.filled(
      _systemsController.systemsList.length,
      false,
    );
  }

  List<bool> playing;

  List onSystems = <int>[].obs;
  List savedOnSystems = <int>[].obs;

  getSystemPlaying() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List<String> saved = pref.getStringList('playbool');
    List<int> on = saved.map((i) => int.parse(i)).toList();

    savedOnSystems.addAll(on);

    if (savedOnSystems.contains(0)) {
      playing[0] = true;
    }
    if (savedOnSystems.contains(1)) {
      playing[1] = true;
    }
    if (savedOnSystems.contains(2)) {
      playing[2] = true;
    }
    if (savedOnSystems.contains(3)) {
      playing[3] = true;
    }
    if (savedOnSystems.contains(4)) {
      playing[4] = true;
    }
    if (savedOnSystems.contains(5)) {
      playing[5] = true;
    }
    if (savedOnSystems.contains(6)) {
      playing[6] = true;
    }
    if (savedOnSystems.contains(7)) {
      playing[7] = true;
    }
    if (savedOnSystems.contains(8)) {
      playing[8] = true;
    }
    if (savedOnSystems.contains(9)) {
      playing[9] = true;
    }
  }

  Future reverse(int index, bool on) async {
    onSystems.add(index);
    List<String> intsystems = [];
    intsystems.add(index.toString());
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('playbool', intsystems);
    getSystemPlaying();

    print(intsystems);

    if (on == true) {
      playing[index] = true;
    } else {
      playing[index] = false;
    }
    print(playing);
  }
}
