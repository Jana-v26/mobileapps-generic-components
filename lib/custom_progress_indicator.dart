import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  final String? loadingText;
  final TextStyle? textStyle;

  const CustomCircularProgressIndicator({
    super.key,
    this.loadingText,
    this.textStyle,
  });

  @override
  State<CustomCircularProgressIndicator> createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    // controller.addListener(() => setState(() {}));
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotationTransition(
            turns: Tween(begin: 1.0, end: 3.0).animate(controller),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.08,
              child: CustomPaint(
                painter: GradientCircularProgressPainter(
                  radius: 30,
                  strokeWidth: 6,
                  gradientColors: [
                    Colors.blue,
                    Colors.blue,
                    Colors.purple,
                    Colors.purple,
                    Colors.purple,
                    // Colors.black,
                  ],
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            widget.loadingText ?? "Please wait...",
            style: widget.textStyle ??
                const TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  GradientCircularProgressPainter(
      {required this.radius,
      required this.gradientColors,
      this.strokeWidth = 6});

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeJoin = StrokeJoin.round;

    paint.shader =
        SweepGradient(colors: gradientColors, startAngle: 0.0, endAngle: 6.0)
            .createShader(rect);
    canvas.drawArc(rect, 0.0, 5.5, false, paint);
    // canvas.drawPath(path, paint)
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
