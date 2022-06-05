// import 'package:cafe_time/screen/home/dialogs/start/button_style.dart';
// import 'package:cafe_time/screen/home/dialogs/start/drop_down.dart';
// import 'package:cafe_time/screen/home/dialogs/textstyle.dart';
// import 'package:cafe_time/screen/provider/controller_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// Future<void> showMyDialog(
//     int index, BuildContext context,) async {
//   String systemname = index.toString();

//   return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         // final controllerpro = Provider.of<ControllerProvider>(context);
//         return Sizer(builder: (context, orientation, deviceType) {
//           return AlertDialog(
//             backgroundColor: const Color(0xff80DEEA),

//             ///title\\\
//             title: Center(child: Text('راه اندازی دستگاه $systemname')),
//             titleTextStyle: nameStyle(15.sp),

//             ///list items\\\
//             content: Container(
//                 padding: EdgeInsets.only(top: 4.h, right: 2.w),
//                 height: 30.h,
//                 width: 80.w,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       textDirection: TextDirection.rtl,
//                       children: [
//                         Text(
//                           'نوع بازی',
//                           style: nameStyle(12.sp),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         DropDown(),
//                       ],
//                     ),
//                     Row(
//                       textDirection: TextDirection.rtl,
//                       children: [
//                         Text(
//                           'تعداد دسته',
//                           style: nameStyle(12.sp),
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               controllerpro.increase();
//                             },
//                             icon: const Icon(
//                               Icons.remove_circle,
//                               color: Colors.white,
//                             )),
//                         Text(
//                           ControllerProvider().controller.toString(),
//                           style: nameStyle(12.sp),
//                         ),
//                         Text(
//                           "دسته",
//                           style: nameStyle(12.sp),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             controllerpro.decrease();
//                             print(
//                               ControllerProvider().controller.toString(),
//                             );
//                           },
//                           icon: const Icon(
//                             Icons.add_circle,
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 )),
//             actions: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   StartButton(
//                     12.sp,
//                     Colors.white,
//                     10.h,
//                     30.w,
//                     'راه بنداز',
//                     index,
                    
//                   ),
//                   NeverMind(12.sp, 10.h, 30.w)
//                 ],
//               )
//             ],
//           );
//         });
//       });
// }
