library flutter_components;

import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final BuildContext? context;
  final double? cardElevation;
  final TextAlign? textAlign;
  final GestureTapCallback? onTap;
  final bool? isLeading;
  final bool? isTrailing;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Widget? subtitleWidget;
  final Widget? titleWidget;
  final FontWeight? fontWeight;
  final Color? textColor;
  final IconData? trailingIconData;
  final MainAxisAlignment? alignment;
  final double? fontSize;
  final double? borderRadiusDouble;
  final bool isEnabled;
  final Color? disableColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? enabledColor;
  final Color? buttonColor;
  final ButtonEnum buttonEnum;

  const PrimaryButton(
      {super.key,
      required this.text,
      this.context,
      this.cardElevation,
      this.textAlign,
      this.onTap,
      this.isLeading = false,
      this.isTrailing = false,
      this.leadingWidget,
      this.trailingWidget,
      this.subtitleWidget,
      this.titleWidget,
      this.fontWeight,
      this.trailingIconData,
      this.alignment,
      this.fontSize,
      this.borderRadiusDouble,
      this.isEnabled = true,
      this.disableColor = Colors.black,
      this.buttonWidth,
      this.buttonHeight,
      this.enabledColor,
      this.buttonColor = Colors.blue,
      this.textColor,
      required this.buttonEnum});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());

        if (widget.onTap != null && widget.isEnabled) {
          widget.onTap!();
          debugPrint('onTap');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        width: widget.buttonWidth ?? size.width * 0.50,
        height: widget.buttonHeight ?? size.height * 0.05,
        decoration: widget.isEnabled
            ? widget.buttonEnum.buttonTypes
            : widget.buttonEnum.buttonTypes
                ?.copyWith(color: widget.buttonEnum.colors),
        child: Center(
          child: widget.titleWidget ??
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: widget.isEnabled
                        ? widget.textColor ?? Colors.white
                        : Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontSize: widget.fontSize ?? 19),
              ),
        ),
      ),
    );
  }
}

extension ButtonContainer on ButtonEnum {
  BoxDecoration? get buttonTypes {
    switch (this) {
      case ButtonEnum.primaryElevatedButton:
        return const BoxDecoration(
            shape: BoxShape.rectangle, color: Colors.blueAccent);
      case ButtonEnum.primaryOutlinedButton:
        return BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.black,
            border: Border.all(color: Colors.white60, width: 1));
      case ButtonEnum.primaryTextButton:
        return const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black,
        );
      case ButtonEnum.primaryOutlineElevatedButton:
        return BoxDecoration(
            border: Border.all(color: Colors.white60, width: 1),
            shape: BoxShape.rectangle,
            color: Colors.blueAccent);
      default:
    }
    return null;
  }
}

extension ButtonBackgroundColor on ButtonEnum {
  Color get colors {
    switch (this) {
      case ButtonEnum.primaryElevatedButton:
        return const Color(0xff0A2644);
      default:
        return Colors.black;
    }
  }
}


enum ButtonEnum {
  primaryElevatedButton, /// Primary blue elevated button used app wide, with enable and disable feature.
  primaryOutlinedButton, /// Primary outlined elevated button with black background color, with enable and disable feature.
  primaryTextButton, /// Primary text button without border, with enable and disable feature
  primaryOutlineElevatedButton /// Primary outlined elevated button with disabled black background color and enabled blue color.
}
