import 'dart:ui';

import 'package:flutter/material.dart';

class CurvedContainer extends StatefulWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final double? topRightCurve;
  final double? bottomLeftCurve;
  final num? width;
  final num? height;
  final double? elevation;
  final GestureTapCallback? onTap;
  final Alignment? alignment;
  final Color? backGroundColor;

  const CurvedContainer.image(
      {super.key,
      this.padding,
      this.child,
      this.topRightCurve,
      this.bottomLeftCurve,
      this.margin,
      this.width,
      this.height,
      this.elevation,
      this.backGroundColor,
      this.onTap,
      this.alignment = Alignment.topLeft});

  const CurvedContainer(
      {super.key,
      this.padding,
      this.child,
      this.topRightCurve,
      this.bottomLeftCurve,
      this.margin,
      this.width = 0,
      this.height = 0,
      this.elevation,
      this.backGroundColor,
      this.onTap,
      this.alignment = Alignment.topLeft});

  @override
  State<CurvedContainer> createState() => _CurvedContainerState();
}

class _CurvedContainerState extends State<CurvedContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        child: Align(
          alignment: widget.alignment!,
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: widget.width != 0
                  ? MediaQuery.of(context).size.width * widget.width!
                  : MediaQuery.of(context).size.width,
              height: widget.height != 0
                  ? MediaQuery.of(context).size.height * widget.height!
                  : MediaQuery.of(context).size.height * 0.1,
              margin: widget.margin ?? const EdgeInsets.all(5),
              padding: widget.padding ?? const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(widget.topRightCurve ?? 15),
                      bottomLeft:
                          Radius.circular(widget.bottomLeftCurve ?? 15)),
                  color:
                      widget.backGroundColor ?? Colors.white.withOpacity(0.15)),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
