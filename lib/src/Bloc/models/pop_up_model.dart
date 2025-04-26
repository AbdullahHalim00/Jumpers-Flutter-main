import 'package:flutter/material.dart';

class PopUpModel {
  final String label;

  final Color? color;

  final IconData? icon;

  final String? imageUrl;

  final VoidCallback? onSelected;

  final bool hasBorder;

  const PopUpModel({
    required this.label,
    this.color,
    this.icon,
    this.imageUrl,
    this.onSelected,
    this.hasBorder = false,
  });
}
