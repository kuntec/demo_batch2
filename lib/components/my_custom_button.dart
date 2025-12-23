import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  String title;
  dynamic backgroundColor;
  dynamic textColor;
  dynamic onClick;
  double width;

  MyCustomButton(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.textColor,
      required this.onClick,
      this.width = 120});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}
