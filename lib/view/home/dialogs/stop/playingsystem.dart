import 'package:cafe_time/Controllers/timer_Controller.dart';
import 'package:cafe_time/models/SystemModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../widgets/loading_widget.dart';

class SystemInformation extends StatelessWidget {
  SystemInformation({this.systemName});
  dynamic systemName;
  @override
  Widget build(BuildContext context) {
    TimerController _timerController =
        Get.put(TimerController(systemName: systemName));

    return FutureBuilder(
      future: _timerController.getTimer(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return GetX<TimerController>(builder: (controller) {
              return Column(
                children: [
                  TextButton(
                      child: Text('Delete'),
                      onPressed: () {
                       
                       controller.box.delete(systemName);
                        Get.back();
                      }),
                  Text(controller.seconds.toString())
                ],
              );
            });
          }
        } else {
          return LoadingWidget(
            mainFontColor: Colors.black,
          );
        }
      },
    );
  }
}
