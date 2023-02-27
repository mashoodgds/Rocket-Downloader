import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color myTextColor = Colors.black;
  static Color myHintTestColor = Colors.black.withOpacity(0.7);
  static const Color appPrimaryColor = const Color.fromARGB(255, 63, 0, 74);
  static const Color buttonColor = Color.fromARGB(255, 17, 82, 188);
  static const Color backgroundScreenColor = Colors.white;
  static const Color storyBackGroundColor = Color.fromARGB(255, 41, 41, 41);
  static const Color primaryColor = Color(0xFFC25811);
  static const Color secondryColor = Color.fromARGB(255, 33, 33, 33);
  static const Color appTextColor = Color.fromARGB(255, 97, 97, 97);
  static const Color headingTextColor = Color.fromARGB(255, 68, 68, 68);
  static const Color chatBubbleColor = Color(0xFFE8E8EE);
  static Color inactveSliderColor = const Color(0xFFC25811).withOpacity(0.2);
  static final InputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: Colors.red, width: 1));
  static Color emptyContainerColor = const Color(0xFFEFEFEF);
  static final InputBorder focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: AppTheme.primaryColor, width: 0.8));
  static const Color textFeildColor = Color.fromARGB(255, 248, 248, 248);
  static const Color textfeildboarderColor = Color.fromARGB(255, 219, 219, 219);
  static const Color textfeildText = Color.fromARGB(255, 56, 56, 56);
  static const Color hintTextColor = Color.fromARGB(255, 112, 112, 112);

  static const headingFontsize = 0.02;
  static const Color textfeildBoarder = Color.fromARGB(255, 196, 196, 196);
}
