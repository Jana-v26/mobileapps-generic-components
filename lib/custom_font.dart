class Font {
  static const Font oxaniumLight = Font('Oxanium-Light');
  static const Font oxaniumMedium = Font('Oxanium-Medium');
  static const Font oxaniumRegular = Font('Oxanium-Regular');
  static const Font oxaniumSemiBold = Font('Oxanium-SemiBold');
  static const Font oxaniumMediumItalic = Font('Oxanium-ExtraLight');
  static const Font oxaniumExtraBold = Font('Oxanium-ExtraBold');
  static const Font oxaniumBold = Font('Oxanium-Bold');

  final String _fontName;

  String get value => _fontName;

  // ignore: sort_constructors_first
  const Font(this._fontName);
}
