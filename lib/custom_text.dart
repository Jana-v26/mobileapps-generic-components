import 'dart:ui';

import 'package:flutter/material.dart';

enum CustomTextStyle {
  // enum variable which has all possible textTheme styles
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

/*NOTE: if style is passed as an argument,the params in it will get merged with the outer styling parameters */
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style; // if you want to define your own style,
  final CustomTextStyle? predefinedStyle; // if want to use predefined styles
  final bool? isUnderlined;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? textHeight;
  final Locale? locale;
  final Paint? backgroundColor;
  final Paint? foregroundColor;
  final GestureTapCallback? onTap;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextWidthBasis? textWidthBasis;
  final EdgeInsetsGeometry padding;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;

  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.predefinedStyle,
    this.onTap,
    this.isUnderlined,
    this.fontSize,
    this.padding = EdgeInsets.zero, // padding around your text
    this.textColor,
    this.fontWeight,
    this.fontStyle,
    this.decoration,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.textHeight,
    this.locale,
    this.backgroundColor,
    this.foregroundColor,
    this.shadows,
    this.fontFeatures,
    this.fontFamily,
    this.fontFamilyFallback,
    this.overflow,
    this.maxLines,
    this.textWidthBasis,
    this.textAlign,
    this.textAlignVertical,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = _getTextStyle(context)
        .copyWith(
          // Apply any custom modifications here
          decoration: isUnderlined ?? false
              ? TextDecoration.underline
              : TextDecoration.none,
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: textHeight,
          locale: locale,
          background: backgroundColor,
          foreground: foregroundColor,
          shadows: shadows,
          fontFeatures: fontFeatures,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          overflow: overflow ?? TextOverflow.ellipsis,
        )
        .merge(style);
    return GestureDetector(
      //if you need the text as a clickable, use the onClick callBack
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Text(
          text,
          textWidthBasis: textWidthBasis,
          textAlign: textAlign,
          textDirection: textDirection,
          maxLines: maxLines,
          // overflow: overflow,
          style: textStyle,
          // style: style ?? textStyle,
        ),
      ),
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (predefinedStyle != null) {
      return _getCustomTextStyle(context, predefinedStyle!)!;
    }
    return style ??
        const TextStyle(); // Use custom style if provided, or an empty style as a fallback
  }

  TextStyle? _getCustomTextStyle(BuildContext context, CustomTextStyle style) {
    switch (style) {
      case CustomTextStyle.displayLarge:
        return Theme.of(context).textTheme.headlineLarge;
      case CustomTextStyle.displayMedium:
        return Theme.of(context).textTheme.headlineMedium;
      case CustomTextStyle.displaySmall:
        return Theme.of(context).textTheme.headlineSmall;
      case CustomTextStyle.headlineLarge:
        return Theme.of(context).textTheme.headlineLarge;
      case CustomTextStyle.headlineMedium:
        return Theme.of(context).textTheme.headlineMedium;
      case CustomTextStyle.headlineSmall:
        return Theme.of(context).textTheme.headlineSmall;
      case CustomTextStyle.titleLarge:
        return Theme.of(context).textTheme.titleLarge;
      case CustomTextStyle.titleMedium:
        return Theme.of(context).textTheme.titleMedium;
      case CustomTextStyle.titleSmall:
        return Theme.of(context).textTheme.titleSmall;
      case CustomTextStyle.bodyLarge:
        return Theme.of(context).textTheme.bodyLarge;
      case CustomTextStyle.bodyMedium:
        return Theme.of(context).textTheme.bodyMedium;
      case CustomTextStyle.bodySmall:
        return Theme.of(context).textTheme.bodySmall;
      case CustomTextStyle.labelLarge:
        return Theme.of(context).textTheme.labelLarge;
      case CustomTextStyle.labelMedium:
        return Theme.of(context).textTheme.labelMedium;
      case CustomTextStyle.labelSmall:
        return Theme.of(context).textTheme.labelSmall;
      default:
        return Theme.of(context).textTheme.labelSmall; // Default fallback
    }
  }
}
