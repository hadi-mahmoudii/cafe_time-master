import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/models/SystemModel.dart';
import 'package:cafe_time/view/widgets/input_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FloatingAddBtn extends StatelessWidget {
  SystemsController systemsController = Get.put(SystemsController());
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData();
    final _media = MediaQuery.of(context);
    final _deviceHeight = _media.size.height;
    final deviceBlockHeight = _deviceHeight / 100;

    return Form(
      key: _formKey,
      child: InkWell(
          child: Icon(Icons.add),
          onTap: () {
            Get.bottomSheet(
              Container(
                height: 35 * deviceBlockHeight,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: themeData.backgroundColor, width: 5),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: SafeArea(
                    maintainBottomViewPadding: true,
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
                          controller: nameCtrl,
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'یک نام برای دستگاه بنویسید';
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
                          controller: priceCtrl,
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
                                if (nameCtrl.text.isNotEmpty &&
                                    priceCtrl.text.isNotEmpty) {
                                  final newSystem = SystemModel(
                                      name: nameCtrl.text.toString(),
                                      price: double.parse(priceCtrl.text));
                                  systemsController.addSystem(newSystem);
                                }

                                Get.back();
                              },
                              child: Text('اضافه کن')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
