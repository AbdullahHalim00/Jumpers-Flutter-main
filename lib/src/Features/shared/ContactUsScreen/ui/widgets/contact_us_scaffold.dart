import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Core/constants/colors/app_colors.dart';
import '../../../../../Ui/scaffold/default_scaffold.dart';

class ContactUsScaffold extends StatelessWidget {
  final Widget body;

  const ContactUsScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      padding: EdgeInsets.zero,
      scaffoldColor: AppColors.scafBCGGrey,
      appBarTitle: "contact_us".tr,
      body: body,
    );
  }
}

class MyFileScaffold extends StatelessWidget {
  final Widget body;

  const MyFileScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      padding: EdgeInsets.zero,
      scaffoldColor: AppColors.scafBCGGrey,
      appBarTitle: "my_files".tr,
      body: body,
    );
  }
}

class FavouriteScaffold extends StatelessWidget {
  final Widget body;

  const FavouriteScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      padding: EdgeInsets.zero,
      scaffoldColor: AppColors.scafBCGGrey,
      appBarTitle: "employees_fav".tr,
      body: body,
    );
  }
}
