import 'package:flutter/material.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Ui/animation/animated_wrapper.dart';
import 'package:jumper/src/Ui/listview/custom_listview.dart';
import 'package:jumper/src/Ui/loading/loading_box.dart';
import 'package:jumper/src/Ui/scaffold/default_scaffold.dart';

class AdvancedOptionsFeature extends StatelessWidget {
  const AdvancedOptionsFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: "advanced_options",
      body: DataStatusBuilder(
        status: DataSuccess([]),
        onDoneBuild: AnimatedWrapper(
          index: 4,
          child: CustomListView(
            children: [],
          ),
        ),
        onLoadingBuild: const LoadingBox(),
      ),
    );
  }
}
