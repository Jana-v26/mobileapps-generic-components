import 'package:flutter/material.dart';
import 'package:flutter_components/colors/app_color.dart';
import 'package:flutter_components/custom_font.dart';

class DarkThemeClass {
  ThemeData darkTheme = ThemeData.dark().copyWith(
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors().sliderOrangeText,
      activeTickMarkColor: AppColors().sliderOrangeText,
      trackHeight: 4,
      inactiveTrackColor: AppColors().sliderInactiveColor,
      thumbColor: Colors.white,
      overlayColor: AppColors().orangeSelected.withOpacity(0.3),
      valueIndicatorColor: AppColors().sliderOrangeText,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.always,
      valueIndicatorTextStyle: const TextStyle(
          color: Colors.white), // Text style of the value indicator
    ),
    primaryColor: Colors.blueGrey,
    canvasColor: Colors.black,
    cardColor: Colors.grey[900],
    colorScheme: const ColorScheme.dark(),
    dialogBackgroundColor: Colors.grey[800],
    disabledColor: Colors.grey[600],
    dividerColor: Colors.grey[700],
    focusColor: Colors.blueAccent,
    highlightColor: Colors.blueAccent,
    hintColor: Colors.grey[400],
    hoverColor: Colors.blueAccent.withOpacity(0.1),
    indicatorColor: Colors.blueAccent,
    primaryColorDark: Colors.blue[900],
    primaryColorLight: Colors.blue[200],
    secondaryHeaderColor: Colors.grey[700],
    shadowColor: Colors.black,
    splashColor: Colors.blueAccent.withOpacity(0.2),
    unselectedWidgetColor: Colors.grey[600],
    // accentColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      // Background color of the app bar
      foregroundColor: Colors.white,
      // Text and icon color
      elevation: 4,
      // Elevation of the app bar
      shadowColor: Colors.grey,
      // Color of the app bar shadow
      centerTitle: true,
      // Center the title horizontally
      titleSpacing: NavigationToolbar.kMiddleSpacing,
      // Spacing around the title
      toolbarTextStyle: TextStyle(
        color: Colors.white, // Text color of title, actions, and back button
        fontSize: 20, // Font size of the title
        fontWeight: FontWeight.bold, // Font weight of the title
      ),
      titleTextStyle: TextStyle(
        color: Colors.white, // Text color of the title in the middle
        fontSize: 20, // Font size of the title in the middle
        fontWeight: FontWeight.bold, // Font weight of the title in the middle
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white, // Icon color of actions
        size: 24, // Size of the icons in actions
      ),
      iconTheme: IconThemeData(
        color: Colors.white, // Icon color for leading and back button
        size: 24, // Size of the icons in leading and back button
      ),
      toolbarHeight: kToolbarHeight, // Disable backward compatibility
    ),
    iconTheme: const IconThemeData(
      color: Colors.white, // Customize icon color for dark theme
      opacity: 1.0, // Opacity of icons
      size: 24.0, // Default size of icons
    ),

    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white, // Set the color to white
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ).apply(
      fontFamily: Font.oxaniumRegular.value,
    ),

    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        fillColor: Colors.white.withOpacity(0.1),
        filled: true,
        hintStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: const OutlineInputBorder(
            gapPadding: 19,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent, width: 2))),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFFE8AD85);
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) => Colors.blue,
      ),
      overlayColor: MaterialStateColor.resolveWith(
        (states) => Colors.blue.withOpacity(0.12),
      ),
      splashRadius: 18.0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
    ).copyWith(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFFE8AD85);
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFFE8AD85);
        }
        return null;
      }),
    ),
  );
}
