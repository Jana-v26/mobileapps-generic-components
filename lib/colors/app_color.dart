import 'package:flutter/material.dart';
import 'package:flutter_components/colors/base_color.dart';

class AppColors implements BaseColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() => _instance;

  AppColors._internal();

  @override
  Color get colorAccent => Colors.red.shade400;

  @override
  Color get lightSliderActive => const Color(0xff576064);

  @override
  Color get orangeSelected => const Color(0xffE8AD85);

  @override
  Color get sliderInactiveColor => const Color(0xffC0C8CC);

  @override
  Color get sliderOrangeText => const Color(0xffFFA63E);

  @override
  Color get orangeBackground => const Color(0xFFA63E1A).withOpacity(0.25);

  @override
  Color get colorPrimary => Colors.black;

  @override
  Color get colorPrimaryText => Colors.white;

  @override
  Color get colorSecondaryText => const Color(0x99E6E6E6);

  @override
  Color get colorAppbarTitle => Colors.white60;

  @override
  Color get colorEditText => const Color(0x99E8AD85);

  @override
  Color get colorLink => const Color(0xff7c06ec);

  @override
  Color get colorBG => const Color(0xffefefef);

  @override
  Color get buttonBackground => Colors.grey;

  @override
  Color get silver => Colors.grey.shade400;

  @override
  Color get buttonEnabledColor => Colors.blue;

  @override
  Color get buttonDisabledColor => const Color(0xff1A60A9);

  @override
  Color get green => Colors.green;

  @override
  Color get buttonPrimary => Colors.blueAccent;

  @override
  Color get lightBlackBackground => Colors.white12;

  @override
  Color get ecoGreenPrimaryText => const Color(0xff204337);

  @override
  Color get ecoGreenSecondaryText => const Color(0xff336653);

  @override
  Color get ecoBluePrimaryText => const Color(0xff225487);

  @override
  Color get ecoBlueSecondaryText => const Color(0xff436c96);

  @override
  Color get ecoPurplePrimaryText => const Color(0xff4d336e);

  @override
  Color get ecoPurpleSecondaryText => const Color(0xff564a6b);

  @override
  Color get white24 => Colors.white24;

  @override
  Color get white70 => Colors.white70;

  Color get lightBlack => const Color(0xff111111);
}
