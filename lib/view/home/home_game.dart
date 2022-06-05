import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/Controllers/hive/Boxes.dart';
import 'package:cafe_time/Controllers/hive/hive_model.dart';
import 'package:cafe_time/models/RequestStatus.dart';
import 'package:cafe_time/view/widgets/FloatingActionAdd.dart';
import 'package:cafe_time/view/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:sizer/sizer.dart';

import '../../splash/Splash_Text.dart';
import '../widgets/pa4_widget.dart';

class Home extends StatelessWidget {
  SystemsController systemsController = Get.put(SystemsController());

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: GetX<SystemsController>(builder: (controller) {
          return controller.requestStatus == RequestStatus.loading
              ? LoadingWidget(mainFontColor: Colors.black)
              : Scaffold(
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
                  body: ValueListenableBuilder<Box<Playing>>(
                    valueListenable: Boxes.getSystems().listenable(),
                    builder: (BuildContext context, dynamic box, Widget child) {
                      final myBox = Boxes.getSystems();
                      final mySystems = myBox.get('key');
                      return GridListPs4(myBox.length);
                    },
                  ),
                  floatingActionButton: FloatingActionButton(
                    child: FloatingAddBtn(),
                  ),
                );
        }),
      );
    });
  }

  Future addSystem(String name, int controller, bool playing) {
    final System = Playing()
      ..name = name
      ..controller = controller
      ..isPlaying = playing;

    final box = Boxes.getSystems();
    box.add(System);
  }
}

Widget GridListPs4(int length) {
  return Column(
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
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: length,
          itemBuilder: (context, index) {
            return Ps4(index);
          },
        ),
      )
    ],
  );
}
