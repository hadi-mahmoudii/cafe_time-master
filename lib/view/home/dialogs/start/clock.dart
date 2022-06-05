import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatelessWidget {
  Text clock = Text(
    DateFormat(' hh:mm:ss').format(DateTime.now()),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          return Center(
            child: Text(
              DateFormat(' hh:mm:ss').format(DateTime.now()),
            ),
          );
        },
      ),
    );
  }
}


