import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  Color? color;

  LoadingWidget({this.color});

  @override
  Widget build(BuildContext context) {
    // return SpinKitFadingCircle(
    //   itemBuilder: (BuildContext context, int index) {
    //     return DecoratedBox(
    //       decoration: BoxDecoration(
    //         color: Constants.MAIN_COLOR,
    //         borderRadius: BorderRadius.all(Radius.circular(20)),
    //       ),
    //     );
    //   },
    //   size: ScreenHelper.screenWidth(context, 40),
    // );
    return const CircularProgressIndicator();
  }
}
