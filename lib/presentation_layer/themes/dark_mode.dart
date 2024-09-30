import 'package:famous_actors/Constants/my_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    // ignore: deprecated_member_use
    background: MyColors.myGrey,
    primary: MyColors.myYellow,
    secondary: MyColors.myWhite,
    tertiary: MyColors.myGrey,
  ),
);
