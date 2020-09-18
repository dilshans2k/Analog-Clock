import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../size_config.dart';
import 'clock_painter.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: AspectRatio(
            //aspectRatio: 3/2, //3 parts of width and 2 parts of height
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-4, -4),
                    color: kShadowColor.withOpacity(0.09),
                    blurRadius: 37,
                  ),
                  BoxShadow(
                    offset: Offset(4, 4),
                    color: kShadowColor.withOpacity(0.07),
                    blurRadius: 35,
                    spreadRadius: 0.0,
                  ),
                ],
                // gradient: LinearGradient(colors: [
                //   Colors.white10,
                //   Colors.white24,
                //   Colors.white54,
                //   Colors.white70,
                // ], stops: [
                //   0.1,
                //   0.3,
                //   0.8,
                //   0.9
                // ]),
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  size: Size(300, 300),
                  painter: MyPainter(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            "assets/icons/Moon.svg",
            height: 24,
            width: 24,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
