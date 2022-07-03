
import 'package:cafe_time/view/home/home_game.dart';
import 'package:flutter/material.dart';


class bottomAppBar extends StatelessWidget {
  int _selectindex = 2;
  var screen;
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screen ?? Home(),
      
    
        //bottom app bar
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            // indexprovide.setscreen(index);
          },
          currentIndex: _selectindex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.green,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time_filled_rounded,
                size: 30,
              ),
              label : 'مدیریت'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.access_alarms_rounded,
                size: 30,
              ),
              label : 'حوراکی ها',
                   
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              
              label: 
                    'کافه',
                  
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time_filled_rounded,
                size: 30,
              ),
              label: 
                    'کافه',
                  
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time_filled_rounded,
                size: 30,
              ),
              label: 
                    'کافه',
                   
            ),
          ],
        ),
      ),
    );
  }
}
