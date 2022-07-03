
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../splash/Splash_Text.dart';

class Foods extends StatelessWidget {
  const Foods({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xff80DEEA),
            title: SplashText('hhhh', 20)
            
            ),
            body: Center(child: Text('hhhhh')),
      ),

    );
  }
}
