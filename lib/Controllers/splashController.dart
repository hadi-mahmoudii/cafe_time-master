import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:cafe_time/view/home/bottom_appbar.dart';
import 'package:cafe_time/view/home/home_game.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    
    await _navigatehome();

    super.onInit();
  }

  var textvisible = false.obs;

  _navigatehome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      print('navigate to home');
      Get.to(() => bottomAppBar());
    });
  }
}
