import 'package:famous_actors/Constants/my_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  colorScheme: const ColorScheme.light(
    // ignore: deprecated_member_use
    background: MyColors.myWhite,
    primary: MyColors.myGrey,
    secondary: MyColors.myYellow,
    tertiary: MyColors.myWhite,
  ),
);
