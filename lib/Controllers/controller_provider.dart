import 'package:flutter/material.dart';

class ControllerProvider with ChangeNotifier {
  int controller = 2;
  void reset() {
    controller = 2;
    notifyListeners();
  }

  increase() {
    if (controller < 4) {
      controller++;
    }

    notifyListeners();
  }

  decrease() {
    if (controller > 1) {
      controller--;
    }

    notifyListeners();
  }
}

