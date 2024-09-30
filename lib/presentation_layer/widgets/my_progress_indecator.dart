import 'package:famous_actors/Constants/my_colors.dart';
import 'package:flutter/material.dart';

class MyCircleProgressIndecator extends StatelessWidget {
  const MyCircleProgressIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.purple,
        backgroundColor: MyColors.myGrey,
      ),
    );
  }
}
