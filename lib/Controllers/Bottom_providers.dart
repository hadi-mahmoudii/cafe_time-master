import 'package:cafe_time/view/foods/foods.dart';
import 'package:cafe_time/view/home/home_game.dart';
import 'package:cafe_time/view/mangment/mangment.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomProvider extends GetxController {
  var selectpageindex = 4.obs;
  static var screen;
  Future<void> setscreen(int index) async {
    selectpageindex.value = index;
    print(selectpageindex);
    switch (selectpageindex.value) {
      case 0:
        {
          screen = MangmentPage();
        }
        break;
      case 1:
        {
          screen = Foods();
        }
        break;

      case 2:
        {
          screen = Home();
        }
        break;
      case 3:
        {
          screen = Home();
        }break
        ;
        
    }
    
  }

  int get selectpage {
    return selectpageindex.value;
  }

  get Screenn {
    return screen;
  }
}
