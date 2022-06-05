import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/view/widgets/input_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingAddBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData();
    final _media = MediaQuery.of(context);
    final _deviceHeight = _media.size.height;
    final deviceBlockHeight = _deviceHeight / 100;

    SystemsController systemsController = Get.put(SystemsController());
    return Form(
      key: systemsController.addFormKey,
      child: InkWell(
          child: Icon(Icons.add),
          onTap: () {
           
            Get.bottomSheet(Container(
              height: 35 * deviceBlockHeight,
              decoration: BoxDecoration(
                border: Border.all(color: themeData.backgroundColor, width: 5),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'اضافه کردن دستگاه',
                      style: TextStyle(fontFamily: 'Yekan'),
                    ),
                  ),
                  InputBox(
                    color: Colors.black,
                    icon: Icons.gamepad_outlined,
                    label: 'نام دستگاه',
                    controller: systemsController.nameCtrl,
                    validator: (String value) {
                      if (value.isEmpty) return 'یک نام برای دستگاه بنویسید';
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputBox(
                    color: Colors.black,
                    icon: Icons.gamepad_outlined,
                    label: 'هزینه ی پایه ',
                    controller: systemsController.priceCtrl,
                    validator: (String name) {
                      if (name.isEmpty)
                        return 'هزینه ی پایه ای برای دستگاه بنویسید';
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          systemsController.addSystem(
                            systemsController.nameCtrl.text,
                            int.tryParse(systemsController.priceCtrl.text),
                          );
                        },
                        child: Text('اضافه کن')),
                  )
                ],
              ),
            ));
          }),
    );
  }
}
