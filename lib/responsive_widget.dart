import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      required this.mediumScreen,
      required this.smallScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1366) {
          return largeScreen;
        } else if (constraints.maxWidth < 1366 &&
            constraints.maxWidth >= 1008) {
          return mediumScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}
