import 'package:flutter/material.dart';
//import 'dart:ui' as ui;
import 'clock.dart';
import 'time_in_hour_and_minute.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex:1,
            child: Text(

              'Fazilka, INDIA | IST',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
flex:3,
            child: TimeInHourAndMinute()),
          SizedBox(
            height: 10,
          ),
          Expanded(flex:10,child: Clock()),
        ],
      ),
    );
  }
}
