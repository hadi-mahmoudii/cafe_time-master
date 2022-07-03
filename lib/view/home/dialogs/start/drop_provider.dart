import 'package:flutter/material.dart';

class DropDownProvider with ChangeNotifier {
   String value = '';
  Future<void> setDrop(dropvalue) async {
   
    value = dropvalue;
    notifyListeners();
  }
}
