import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Features/shared/ChatsFeature/ui/screens/imports_chats.dart';

import '../../../../../Core/constants/colors/app_colors.dart';
import '../../../../../Ui/appbars/default_appbar.dart';
import '../../../../../Ui/scaffold/default_scaffold.dart';
import 'group_chats_screens.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: DefaultScaffold(
        scaffoldColor: AppColors.scafBCGBasic,
        appBar: AppBars.chats(
          title: "chat".tr,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Persons".tr,
              ),
              Tab(
                text: "Groups".tr,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChatsScreen(),
            GroupChatsScreen(),
          ],
        ),
      ),
    );
  }
}
