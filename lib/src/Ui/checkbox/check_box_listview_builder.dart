import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

/// Takes String
class CheckBoxListViewBuilder<T> extends StatefulWidget {
  final List<T> list;
  final Function(String?)? onConfirmed;
  final List<int>? selectedIds;

  const CheckBoxListViewBuilder({
    Key? key,
    required this.list,
    this.selectedIds,
    this.onConfirmed,
  }) : super(key: key);

  @override
  State<CheckBoxListViewBuilder> createState() =>
      _CheckBoxListViewBuilderState();
}

Map<String, bool> values = {};

void _fillMap(List list, List<int>? ids) {
  if (ids != null) {
    for (var element in list) {
      if (ids.contains(element.id)) {
        values.addAll({element!: true});
      } else {
        values.addAll({element!: false});
      }
    }
  } else {
    for (var element in list) {
      values.addAll({element!: false});
    }
  }
}

List tmpArray = [];

// String  get getCheckboxItems {
String get getCheckboxItems {
  tmpArray.clear();
  values.forEach((key, value) {
    if (value == true) {
      tmpArray.add(key);
    }
  });

  // Printing all selected items on Terminal screen.
  // Here you will get all your selected Checkbox items.
  print("$tmpArray");
  // Clear array after use.
  // tmpArray.clear();

  return tmpArray.join(",");
}

class _CheckBoxListViewBuilderState extends State<CheckBoxListViewBuilder> {
  @override
  void initState() {
    _fillMap(widget.list, widget.selectedIds);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    values = {};
    tmpArray.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AppPhysics.alwaysScrollablePhysics,
      children: values.keys.map((String key) {
        print(values.keys);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              CustomText(key),
              const Spacer(),
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  tristate: true,
                  shape: const CircleBorder(),
                  value: values[key],
                  activeColor: AppColors.secondary,
                  checkColor: Colors.white,
                  onChanged: (bool? value) {
                    setState(() {
                      values[key] = value!;
                      widget.onConfirmed!(getCheckboxItems);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
