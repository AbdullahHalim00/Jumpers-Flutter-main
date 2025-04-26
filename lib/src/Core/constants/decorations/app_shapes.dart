import 'package:flutter/material.dart';
// decoration

class AppShapes {
  AppShapes._();

  static const ShapeBorder bottomSheetShape = RoundedRectangleBorder(
    borderRadius: BorderRadiusDirectional.only(
      topStart: Radius.circular(20.0),
      topEnd: Radius.circular(20.0),
    ),
  );
  static const ShapeBorder dialogShape = RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(Radius.circular(10.0)));
}
