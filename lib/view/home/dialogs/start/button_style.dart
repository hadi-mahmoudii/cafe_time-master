import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartButton extends StatelessWidget {
  StartButton(this.fontsize, this.buttoncolor, this.height, this.width,
      this.text, this.index, this.controller);

  double fontsize;
  double width;
  double height;
  Color buttoncolor;
  String text;
  int index;
  int controller;

  SystemsController systemsController = Get.put(SystemsController());
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(buttoncolor),
        fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),
      ),
      onPressed: () async {
       await systemsController.OnSystem(index, controller);
        Get.back();
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: "Yekan", fontSize: fontsize, color: Colors.black),
      ),
    );
  }

  // Future<void> setup() async {
  //   await tz.initializeTimeZone();

  //   var detroit = tz.getLocation('Asia/Tehran');

  //   var now = tz.TZDateTime.now(detroit);
  //   print(now);
  // }
}

class NeverMind extends StatelessWidget {
  NeverMind(
    this.fontsize,
    this.height,
    this.width,
  );
  double fontsize;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.grey),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'بی خیال',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: "Yekan", fontSize: fontsize, color: Colors.black),
      ),
    );
  }
}
