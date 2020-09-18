import 'dart:math';

import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  MyPainter(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    print(centerX);
    Offset center = Offset(centerX, centerY);

    //Minute calculation
    double minX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    //minute line
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Theme.of(context).accentColor
        ..strokeWidth = 11,
    );

    //Hour Calculation
    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    print(dateTime.hour);
    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    //hour line
    Paint hourLinePainter = Paint()
      ..color = Theme.of(context).colorScheme.secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      hourLinePainter,
    );

    //Seconds Calculation
    //2*r + r*0.4*cos(180/180*3.14) 0 - r*0.4
    //
    //  int x = 30;
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    print(dateTime.second);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    //seconds line
    Paint secondLinePainter = Paint()..color = Theme.of(context).primaryColor;
    canvas.drawLine(
      center,
      Offset(secondX, secondY),
      secondLinePainter,
    );

    //center dots
    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;
    canvas.drawCircle(
      center,
      24,
      dotPainter,
    );
    canvas.drawCircle(
      center,
      22.5,
      Paint()..color = Theme.of(context).backgroundColor,
    );
    canvas.drawCircle(
      center,
      10,
      Paint()..color = Theme.of(context).primaryIconTheme.color,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //
    return false;
  }
}
