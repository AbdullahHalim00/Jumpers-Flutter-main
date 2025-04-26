import 'package:flutter/material.dart';
import 'package:jumper/src/Ui/adaptive/adaptive_picker.dart';

class TimePickerSheet extends StatelessWidget {
  final String? title;
  final DateTime initial;
  final Function(DateTime? date) onConfirm;

  const TimePickerSheet({
    Key? key,
    this.title,
    required this.onConfirm,
    required this.initial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptivePicker.cupertinoTimePicker(
      context,
      title ?? "",
      onConfirm: onConfirm,
      initial: initial,
    );
  }
}
