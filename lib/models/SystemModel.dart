import 'package:hive/hive.dart';
part 'SystemModel.g.dart';

@HiveType(typeId: 0)
class SystemModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double price;
  @HiveField(2)
  int controller;
  @HiveField(3)
  DateTime time;
  @HiveField(4)
  bool isPlaying;
  @HiveField(5)
  int seconds =0;
  @HiveField(6)
  int minutes= 0;
  @HiveField(7)
  int hours = 0;

  SystemModel({
    this.name,
    this.price,
    this.controller,
    this.time,
    this.isPlaying = false,
  });
}
