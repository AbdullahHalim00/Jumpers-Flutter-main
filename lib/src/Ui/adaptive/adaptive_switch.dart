import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';

class AdaptiveSwitch extends StatefulWidget {
  final String? toolTip;

  final bool initialValue;

  final VoidCallback? onChanged;

  // final bool value ;
  const AdaptiveSwitch({
    Key? key,
    this.toolTip,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AdaptiveSwitch> createState() => _AdaptiveSwitchState();
}

class _AdaptiveSwitchState extends State<AdaptiveSwitch> {
  late bool isSwitched;

  // void setValue (){
  //   isSwitched = widget.value;
  // }
  @override
  void initState() {
    setState(() {
      isSwitched = widget.initialValue;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: (widget.toolTip ?? "").tr,
      child: CupertinoSwitch(
        // inactiveThumbColor: AppColors.greyPrimary,
        // inactiveTrackColor: AppColors.greyPrimary.withOpacity(0.5),
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
            // isSwitched = widget.initialValue;
            widget.onChanged != null ? widget.onChanged!() : {};
          });
        },
        // activeTrackColor:  AppColors.secondaryLighter,
        activeColor: AppColors.secondary,
      ),
    );
  }
}
