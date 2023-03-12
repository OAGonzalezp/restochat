import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resto_chat/themes.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  int value = 0;
  bool darkMode = true;

  void increment() {
    value++;
  }

  void changeTheme() {
    darkMode = !darkMode;
  }

  Color getBGColor() {
    return darkMode ? kDarkBGColor : kLightBGColor;
  }

  Color getChatTitleColor() {
    return darkMode ? kDarkChatTitleColor : kLightChatTitleColor;
  }

  Color getChatReadColor() {
    return darkMode ? kDarkChatReadColor : kLightChatReadColor;
  }

  Color getChatUnReadColor() {
    return darkMode ? kDarkChatUnReadColor : kLightChatUnReadColor;
  }

  Color getToolBarColor() {
    return darkMode ? kDarkToolBarColor : kLightToolBarColor;
  }

  Color getProfileColor() {
    return darkMode ? kDarkProfileColor : kLightProfileColor;
  }

  Color getProfile2Color() {
    return darkMode ? kDarkProfile2Color : kLightProfile2Color;
  }

  Color getActive2Color() {
    return darkMode ? kDarkActiveColor : kLightActiveColor;
  }
}