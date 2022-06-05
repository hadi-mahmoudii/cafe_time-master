import 'package:cafe_time/Controllers/hive/hive_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_generator/hive_generator.dart';

class Boxes {
  static Box<Playing> getSystems() => Hive.box<Playing>('playing');
}
