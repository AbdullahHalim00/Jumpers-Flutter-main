import 'package:flutter/material.dart';

class ColoredTabBar extends Container implements PreferredSizeWidget {
  final TabBar tabBar;

  final Color? color;

  ColoredTabBar({
    Key? key,
    this.color,
    required this.tabBar,
  }) : super(key: key);

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: tabBar,
      );
}
