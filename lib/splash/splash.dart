

import 'package:cafe_time/Controllers/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../view/home/bottom_appbar.dart';
import 'Splash_Text.dart';





class Splash extends StatelessWidget {
  @override
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: Scaffold(
            body: Container(
              color: Colors.white,
              child: Column(
                textDirection: TextDirection.rtl,
                children: [
                  ////app Icon
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.h),
                      width: 90.w,
                      height: MediaQuery.of(context).size.height / 2.1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/images/splash/2.png"),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),

                  ///title\\\
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: SplashText("کافه", 40.0.sp),
                  ),

                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 45.w),
                        child:  SplashText("تایم", 40.0.sp),

                        
                      ),
                      SizedBox(width: 2.w),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset("assets/images/splash/3.png"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
