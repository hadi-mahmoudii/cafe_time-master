import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/Controllers/timer_Controller.dart';
import 'package:cafe_time/models/SystemModel.dart';
import 'package:cafe_time/view/home/dialogs/start/start_page.dart';
import 'package:cafe_time/view/home/dialogs/stop/playingsystem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Ps4 extends GetView {
  final String _stoppic = "assets/images/playing/stop.png";
  final String _playpic = "assets/images/playing/play.gif";
  DateTime dateTime = DateTime.now();
  Ps4(this.index, this.system);
  final int index;
  final SystemModel system;

  SystemsController systemsController = Get.put(SystemsController());

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetX<SystemsController>(builder: (controller) {
        return InkWell(
          onTap: () async {
            controller.systemsList[index].isPlaying
                ? Get.to(() => SystemInformation(
                      systemName: system.name,
                    ))
                : Get.defaultDialog(
                    title: 'راه اندازی دستگاه', content: StartPage(system));
          },
          child: Container(
              height: 40.h,
              width: 35.w,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                image: DecorationImage(
                    image: AssetImage(controller.systemsList[index].isPlaying
                        ? _playpic
                        : _stoppic),
                    fit: BoxFit.cover),
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      system.name,
                      style: TextStyle(
                        fontFamily: 'Yekan',
                        fontSize: 35.sp,
                      ),
                    ),
                  ),
                ],
              )),
        );
      });
    });
  }
}
