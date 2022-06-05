import 'package:cafe_time/models/RequestStatus.dart';
import 'package:cafe_time/models/TimeKind.dart';
import 'package:cafe_time/models/error_result.dart';
import 'package:cafe_time/models/systems.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SystemsController extends GetxController {
  @override
  void onInit() async {
    await getSystemsList();
    saveSystemsList();
    super.onInit();
  }

  var requestStatus = RequestStatus.loading.obs;

  var timeKind = TimeKind.free.obs;
  var controllers = 2.obs;
  var timeNow = DateTime.now().obs;

  var formattedTime = DateFormat.Hms().format(DateTime.now()).obs;
  final addFormKey = GlobalKey<FormState>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController timeCtrl = TextEditingController();
  TextEditingController startTimeCtrl = TextEditingController();
  var systemsList = <System>[
    System(name: 'دستگاه ۱', defaultPrice: 100),
    System(name: 'دستگاه ۲', defaultPrice: 100),
  ].obs;

  addSystem(dynamic name, int price) {
    if (!addFormKey.currentState.validate()) return;
    if (nameCtrl.text.isNotEmpty && priceCtrl.text.isNotEmpty) {
      systemsList.add(System(name: name, defaultPrice: price));
      saveSystemsList();
      nameCtrl.text = '';
      priceCtrl.text = '';
      Get.back();
    }
  }

  OnSystem(int index, int controller) async {
    // await getSystemsList();
    systemsList[index].playing.value = true;
    systemsList[index].controller = controllers.value;
    systemsList[index].timeKind = timeKind.value;
    systemsList[index].startTime = formattedTime.value;

    await saveSystemsList();

    controllers.value = 2;
  }

  changeTimeKine(String value) {
    if (value == 'آزاد') {
      timeKind.value = TimeKind.free;
    } else {
      timeKind.value = TimeKind.set;
    }
  }

  decrease() {
    if (controllers == 1) return;
    controllers--;
  }

  increase() {
    if (controllers == 4) return;
    controllers++;
  }

  saveSystemsList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String encodedData = System.encode(systemsList);
    await prefs.setString('musics_key', encodedData);
  }

  getSystemsList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String systemsString = await prefs.getString('musics_key');

    final Either<ErrorResult, List<System>> result =
        await ServerRequest<System>().fetchDatas(systemsString);

    result.fold(
        (error) => {print('error'), ErrorResult.fromException('e')},
        (result) => {
              //  print(result),

              systemsList.value = result as List<System>,
              requestStatus.value = RequestStatus.stable,
              systemsList.forEach((element) {
                print(element.playing);
              })
            });
  }
}
