import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobDetailsController extends GetxController
    with GetTickerProviderStateMixin {
  TickerProviderStateMixin? tickerProviderStateMixin;

  TabController? _tabController;
  ScrollController? scrollController;

  TabController? get tabController => _tabController;

  @override
  void onInit() {
    _tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
    // TODO: implement onInit
    super.onInit();
  }

  ///  ---------------- delete job ----------------

  @override
  void dispose() {
    _tabController?.dispose();

    // TODO: implement dispose
    super.dispose();
  }
}
