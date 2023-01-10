import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: RadialPersentWidget(
          percent: 0.72,
          fillColor: Colors.blue,
          lineColor: Colors.red,
          freeColor: Colors.yellow,
          lineWidth: 5,
          childW: Text(
            '72%',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RadialPersentWidget extends StatelessWidget {
  final Widget childW;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadialPersentWidget(
      {Key? key,
      required this.childW,
      required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            fillColor: fillColor,
            lineColor: lineColor,
            freeColor: freeColor,
            lineWidth: lineWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(.0),
          child: Center(child: childW),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;

  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth
  });

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calcArcsRect(size);

    drawBackground(canvas, size);

    drawFreeArc(canvas, arcRect);

    drawFilledArc(canvas, arcRect);

  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final feelPaint = Paint();
    feelPaint.color = lineColor;
    feelPaint.style = PaintingStyle.stroke;
    feelPaint.strokeWidth = lineWidth;
    feelPaint.strokeCap = StrokeCap.butt;
    canvas.drawArc(arcRect,
        -pi / 2, pi * 2 * percent, false, feelPaint);
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final freePaint = Paint();
    freePaint.color = freeColor;
    freePaint.style = PaintingStyle.stroke;
    freePaint.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1 - percent),
      false,
      freePaint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = fillColor;
    backgroundPaint.style = PaintingStyle.fill;
    // paint.style = PaintingStyle.stroke;
    // paint.strokeWidth = 5;
    // canvas.drawCircle(Offset(size.width/2, size.height/2), 30, backgroundPaint);
    // canvas.drawRect(Offset.zero & Size(30, 30), backgroundPaint);
    // canvas.drawLine(Offset.zero, Offset(30, 70), backgroundPaint)
    canvas.drawOval(Offset.zero & size, backgroundPaint);
  }

  Rect calcArcsRect(Size size) {
    final lineMargin = 3;
    final offset = lineWidth/2 + lineMargin;
    final arcRect = Offset(offset, offset) & Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
