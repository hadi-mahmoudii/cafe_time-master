import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashText extends StatelessWidget {
  SplashText(this.text, this.fontsize);
  String text;
  double fontsize;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Container(
        child: Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              text,
              style: TextStyle(
                fontFamily: "Yekan",
                fontSize: fontsize,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2.8
                  ..color = Colors.black,
              ),
            ),
            // Solid text as fill.
            Text(
              text,
              style: TextStyle(
                fontFamily: "Yekan",
                fontSize: fontsize,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    });
  }
}
