import 'package:flutter/material.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/utils/extensions.dart';

class ConditionalBuilder extends StatelessWidget {
  final bool condition;
  final Widget onBuild;
  final Widget? onFeedBack;

  const ConditionalBuilder({
    Key? key,
    required this.condition,
    required this.onBuild,
    this.onFeedBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widgetIs;
    if (onFeedBack == null) {
      if (condition == true) {
        widgetIs = onBuild;
      }
    } else {
      if (condition == true) {
        widgetIs = onBuild;
      } else {
        widgetIs = onFeedBack;
      }
    }
    return widgetIs;
  }

  factory ConditionalBuilder.dataReady(
      {required DataState state, required Widget child}) {
    return ConditionalBuilder(
      condition: state is DataSuccess,
      onBuild: child,
      onFeedBack: 0.0.ESH(),
    );
  }
}
