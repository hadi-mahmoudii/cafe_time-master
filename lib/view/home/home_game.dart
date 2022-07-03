import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/models/SystemModel.dart';
import 'package:cafe_time/view/widgets/FloatingActionAdd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';
import '../../splash/Splash_Text.dart';
import '../widgets/Ps4_widget.dart';

class Home extends StatelessWidget {
  SystemsController systemsController = Get.put(SystemsController());

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: GetX<SystemsController>(builder: (controller) {
          
          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                backgroundColor: Color(0xff80DEEA),
                title: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 20),
                      child: SplashText('کافه', 15.sp),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SplashText('تایم', 15.sp),
                    ),

                    ///time icon\\\
                    SizedBox(
                      height: 5.h,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset("assets/images/splash/3.png"),
                      ),
                    ),
                  ],
                )),
            body: controller.systemsList.isEmpty
                ? Center(
                    child: Text(
                      'هیچ دستگاهی وجود ندارد',
                    ),
                  )
                : Column(
                    children: [
                      Center(
                          child: Container(
                        height: 20,
                        width: 100,
                        margin: EdgeInsets.only(left: 10, right: 20),
                        padding: EdgeInsets.only(left: 30, right: 30),
                        color: Colors.transparent,
                      )),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 20),
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                          ),
                          itemCount: controller.systemsList.length,
                          itemBuilder: (context, index) {
                            return Ps4(index , controller.systemsList[index]);
                          },
                        ),
                      )
                    ],
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: FloatingAddBtn(),
            ),
          );
        }),
      );
    });
  }
}
