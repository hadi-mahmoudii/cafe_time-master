import 'package:cafe_time/Controllers/Systems_Controller.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  State<DropDown> createState() => _DropDownState();
}

String value = 'آزاد';

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
     
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: Colors.transparent,
      ),
      child: DropdownButton<String>(
        value: value,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(height: 2, color: Colors.white),
        onChanged: (String newValue) {
          setState(() {
            SystemsController().changeTimeKine(newValue);
            value = newValue;
          });
        },
        items: <String>[
          'آزاد',
          'تایم',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
