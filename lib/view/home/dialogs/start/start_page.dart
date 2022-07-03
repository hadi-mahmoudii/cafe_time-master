import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/models/SystemModel.dart';
import 'package:cafe_time/view/home/dialogs/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'button_style.dart';
import 'drop_down.dart';

class StartPage extends StatefulWidget {
  StartPage(this.system);
  final SystemModel system;
  SystemsController _systemsController = Get.put(SystemsController());

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return GetX<SystemsController>(builder: (controller) {
      return Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Color(0xff80DEEA),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'نوع بازی',
                    style: nameStyle(30.sp),
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  DropDown(),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'تعداد دسته',
                    style: nameStyle(30.sp),
                  ),
                  SizedBox(width: 1.h),
                  IconButton(
                      iconSize: 12.h,
                      onPressed: () {
                        controller.controllers > 0
                            ? controller.controllers--
                            : null;
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                      )),
                  Text(controller.controllers.toString()),
                  Text(
                    "دسته",
                    style: nameStyle(30.sp),
                  ),
                  IconButton(
                    iconSize: 12.h,
                    onPressed: () {
                      controller.controllers < 4
                          ? controller.controllers++
                          : null;
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: 15.h,
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StartButton(),
                    SizedBox(width: 20.w),
                    NeverMind(30.sp, 12.h, 55.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget StartButton() {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        fixedSize: MaterialStateProperty.all<Size>(Size(55.w, 12.h)),
      ),
      onPressed: () {
        widget._systemsController.TurnOnSystem(widget.system);
        Get.back();
      },
      child: Text(
        'راه بنداز',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: "Yekan", fontSize: 30.sp, color: Colors.black),
      ),
    );
  }
}
