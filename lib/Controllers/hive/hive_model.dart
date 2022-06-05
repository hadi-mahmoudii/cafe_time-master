import 'package:cafe_time/Controllers/hive/Boxes.dart';
import 'package:cafe_time/models/systems.dart';
import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class Playing extends HiveObject {
  @HiveField(0)
  bool isPlaying;

  @HiveField(1)
  int controller;

  @HiveField(2)
  String name;
}

