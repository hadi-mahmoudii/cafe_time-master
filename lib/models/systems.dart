// import 'dart:convert';

// import 'package:cafe_time/Controllers/Systems_Controller.dart';
// import 'package:cafe_time/models/TimeKind.dart';
// import 'package:cafe_time/view/home/dialogs/start/drop_down.dart';
// import 'package:either_dart/either.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'error_result.dart';

// class System extends GetxController {
//   String name;
//   int defaultPrice;
//   var playing = false.obs;
//   String startTime;
//   String endTime;
//   DateTime setTime;
//   TimeKind timeKind;
//   int controller;

//   System({
//     this.name,
//     this.defaultPrice,
//     controller = 2,
//     playing,
//     startTime,
//     endTime,
//     setTime,
//     timeKind,
//   });

//   factory System.fromJson(Map<String, dynamic> jsonData) {
//     return System(
//         name: jsonData['name'].toString(),
//         defaultPrice: jsonData['defaultPrice'],
//         controller: jsonData['controller'] as int,
//         playing: (jsonData['playing'].toString()) == 'true' ? true : false,
//         startTime: jsonData['startTime'] as String,
//         endTime: jsonData['endTime'] as String,
//         setTime: jsonData['settime'] as String,
//         timeKind: jsonData['timeKind'] as String);
//   }

//   static Map<String, dynamic> toMap(System system) => {
//         'name': system.name,
//         'defaultPrice': system.defaultPrice,
//         'playing': system.playing.value ,
//         'controller' : system.controller != null ? system.controller : 2,
//         'startTime': system.startTime,
//         'timeKind': system.timeKind.toString(),
//         'setTime': system.setTime,
//         'endTime': system.endTime,
//       };

//   static String encode(List<System> systems) {
//     return jsonEncode(systems
//         .map<Map<String, dynamic>>((system) => System.toMap(system))
//         .toList());
//   }

//   // static Future<Either<Text, List>> decode(String musics) async {
//   //   List result = <System>[];

//   //   try {
//   //     Iterable values = await json.decode(musics);
//   //     var resultFrom = List<System>.from(
//   //         values.map<System>((value) => System.fromJson(value))).toList();
//   //     result.add(resultFrom);

//   //     return Right(result as List<System>);
//   //   } catch (e) {
//   //     return Left(Text(e));
//   //   }
//   // }

//   // Future<Either<Text, List<System>>> fetchDatas(String systemString,
//   //     {List<dynamic> datas}) async {
//   //   try {
//   //     final response = await json.decode(systemString);

//   //     return Right(parseDatas(response.body));
//   //   } catch (e) {
//   //     return Left(ErrorResult.fromException(e));
//   //   }
//   // }
// }

// class ServerRequest<T> {
//   Future<Either<ErrorResult, List<System>>> fetchDatas(
//       String systemsString) async {
//     List<System> result = [];

//     try {
//       final Iterable values = await json.decode(systemsString);

//       values.forEach((element)  {
//          result.add(System.fromJson(element));
//       });

     
//       return Right(result);
//     } catch (e) {
//       return Left(ErrorResult.fromException(e));
//     }
//   }
// }


//  // final resultFrom = await List<System>.from(
//       //     values.map<System>((value) => System.fromJson(value))).toList();

//       // resultFrom.forEach(
//       //   (element) => result.add(element),
//       // );
//       // print(result);