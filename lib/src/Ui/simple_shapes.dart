import 'package:flutter/material.dart';

class SimpleArrowWidget extends StatelessWidget {
  const SimpleArrowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios,
      size: 15.0,
    );
  }
}
