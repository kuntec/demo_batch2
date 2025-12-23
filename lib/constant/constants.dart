import 'package:flutter/material.dart';

const kMarginLarge = 25.0;
const kMarginMedium = 20.0;
const kMarginSmall = 10.0;

var myInputDecoration = InputDecoration(
  hintText: "Hint Text",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(kMarginLarge),
  ),
);

var cardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 2),
      blurRadius: 6.0,
    ),
  ],
);
