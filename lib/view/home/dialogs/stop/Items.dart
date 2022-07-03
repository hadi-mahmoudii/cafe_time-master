import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../textstyle.dart';

class Items extends StatelessWidget {
  Items(this.firsttext, this.secondtext);
  String firsttext;
  String secondtext;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Padding(
        padding: EdgeInsets.only(right: 6.w),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              firsttext,
              style: nameStyle(12.5.sp),
            ),
            SizedBox(
              width: 18.w,
            ),
            Text(
              secondtext,
              style: nameStyle(13.5.sp),
            ),
          ],
        ),
      );
    });
  }
}
