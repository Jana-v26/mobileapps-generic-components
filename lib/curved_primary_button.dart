import 'package:flutter/material.dart';

class CurvedPrimaryButton extends StatefulWidget {
  final String? text;
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
  final num? buttonWidth;
  final num? buttonHeight;
  final Color? enabledColor;
  final Color? buttonColor;
  final ButtonEnum buttonEnum;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const CurvedPrimaryButton(
      {super.key,
      this.text,
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
      this.buttonWidth = 0,
      this.buttonHeight = 0,
      this.enabledColor,
      this.buttonColor = Colors.blue,
      this.textColor,
      this.padding = const EdgeInsets.all(10),
      this.margin = const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      required this.buttonEnum,
      this.textStyle = const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 19)});

  @override
  State<CurvedPrimaryButton> createState() => _CurvedPrimaryButtonState();
}

class _CurvedPrimaryButtonState extends State<CurvedPrimaryButton> {
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
        margin: widget.margin!,
        padding: widget.padding!,
        width: widget.buttonWidth != 0
            ? size.width * widget.buttonWidth!
            : size.width * 0.30,
        // width: widget.buttonWidth ?? size.width * 0.50,
        // height: widget.buttonHeight ?? size.height * 0.05,
        height: widget.buttonHeight != 0
            ? size.height * widget.buttonHeight!
            : size.height * 0.05,
        decoration: widget.isEnabled
            ? widget.buttonEnum.buttonTypes
            : widget.buttonEnum.buttonTypes
                ?.copyWith(color: widget.buttonEnum.colors),
        child: Center(
          child: widget.titleWidget ??
              Text(
                widget.text!,
                textAlign: TextAlign.center,
                style: widget.textStyle,
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
        return BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
            shape: BoxShape.rectangle,
            color: Colors.white.withOpacity(0.15));
      // case ButtonEnum.primaryOutlinedButton:
      //   return BoxDecoration(
      //       borderRadius:const  BorderRadius.only(
      //           topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
      //       shape: BoxShape.rectangle,
      //       color: Colors.black,
      //       border: Border.all(color: Colors.white60, width: 1));
      case ButtonEnum.primaryTextButton:
        return const BoxDecoration(
            shape: BoxShape.rectangle, color: Colors.transparent);
      // case ButtonEnum.primaryOutlineElevatedButton:
      //   return BoxDecoration(
      //       border: Border.all(color: Colors.white60, width: 1),
      //       shape: BoxShape.rectangle,
      //       color: Colors.blueAccent);
      default:
    }
    return null;
  }
}

extension ButtonBackgroundColor on ButtonEnum {
  Color get colors {
    switch (this) {
      case ButtonEnum.primaryElevatedButton:
        return Colors.white.withOpacity(0.15);
      default:
        return Colors.transparent;
    }
  }
}

enum ButtonEnum {
  primaryElevatedButton,

  /// Primary blue elevated button used app wide, with enable and disable feature.
  // primaryOutlinedButton,

  /// Primary outlined elevated button with black background color, with enable and disable feature.
  primaryTextButton,

  /// Primary text button without border, with enable and disable feature
  // primaryOutlineElevatedButton

  /// Primary outlined elevated button with disabled black background color and enabled blue color.
}
