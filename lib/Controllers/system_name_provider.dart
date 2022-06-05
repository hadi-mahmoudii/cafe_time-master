import 'package:flutter/material.dart';

class SystemName with ChangeNotifier {
  var systemname = '';
  
  Future<dynamic> setNameSystem(var name) async {
    systemname = name;

    
    
  }notifyListeners();
}
