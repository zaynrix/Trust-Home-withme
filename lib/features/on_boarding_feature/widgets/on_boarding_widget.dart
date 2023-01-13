import 'package:flutter/material.dart';

class CustomBoardingBtn extends StatelessWidget {
  const CustomBoardingBtn(
      {Key? key,
        required this.color,
        required this.onPressed,
        required this.title,
        required this.textStyle})
      : super(key: key);

  final Color color;
  final Function() onPressed;

  // final Widget? child;
  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}