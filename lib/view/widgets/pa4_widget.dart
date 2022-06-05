import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/view/home/dialogs/start/start_page.dart';
import 'package:cafe_time/view/home/dialogs/stop/playingsystem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Ps4 extends GetView {
  Ps4(this.index);

  final String _stoppic = "assets/images/playing/stop.png";
  final String _playpic = "assets/images/playing/play.gif";
  DateTime dateTime = DateTime.now();

  @override
  int index;
  SystemsController systemsController = Get.put(SystemsController());

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetX<SystemsController>(builder: (controller) {
        return InkWell(
          onTap: () async {
            controller.systemsList[index].playing.value
                ? Get.to(() => SystemInformation()) 
                : Get.defaultDialog(
                    title: 'راه اندازی دستگاه', content: StartPage(index));
          },
          child: Container(
              height: 40.h,
              width: 35.w,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                image: DecorationImage(
                    image: AssetImage(
                        controller.systemsList[index].playing.value
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
                      controller.systemsList[index].name,
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
