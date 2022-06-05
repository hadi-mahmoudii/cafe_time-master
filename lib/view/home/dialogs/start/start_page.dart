import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/view/home/dialogs/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'button_style.dart';
import 'drop_down.dart';

class StartPage extends StatelessWidget {
  StartPage(this.index);
  int index;
  SystemsController controllerCtrl = Get.put(SystemsController());
  @override
  Widget build(BuildContext context) {
    return GetX<SystemsController>(builder: (controller) {
      return Container(
        // / 2.8
        // / 1.25
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width ,
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
                        controller.decrease();
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                      )),
                  Text(controller.controllers.value.toString()),
                  Text(
                    "دسته",
                    style: nameStyle(30.sp),
                  ),
                  IconButton(
                    iconSize: 12.h,
                    onPressed: () {
                      controller.increase();
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
                    new StartButton(
                    
                      30.sp,
                      Colors.white,
                      12.h,
                      55.w,
                      'راه بنداز',
                      index,
                      controller.controllers.value,
                    ),
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
}
