import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class CustomListView extends StatelessWidget {
  final List<Widget> children;
  final Axis scrollDirection;
  final bool reverse;

  //= false
  final ScrollController? controller;
  final bool? primary;
  final bool shrinkWrap;

  // = false
  final EdgeInsetsGeometry? padding;
  final bool addAutomaticKeepAlives;

  // = true
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final double? itemExtent;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final ScrollPhysics? physics;
  final bool isBouncingScrollPhysics;

  const CustomListView({
    Key? key,
    this.children = const <Widget>[],
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.shrinkWrap = false,
    this.padding,
    this.physics,
    this.cacheExtent,
    this.clipBehavior = Clip.hardEdge,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.dragStartBehavior = DragStartBehavior.start,
    this.isBouncingScrollPhysics = false,
    this.restorationId,
    this.addAutomaticKeepAlives = true,
    this.itemExtent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: key,
      physics: physics ??
          AlwaysScrollableScrollPhysics(
            parent:
                isBouncingScrollPhysics ? const BouncingScrollPhysics() : null,
          ),
      controller: controller,
      padding: padding,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      clipBehavior: clipBehavior,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      cacheExtent: cacheExtent,
      reverse: reverse,
      primary: primary,
      itemExtent: itemExtent,
      restorationId: restorationId,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      children: children,
    );
  }
}
