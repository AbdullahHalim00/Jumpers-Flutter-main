import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetailsController extends GetxController
    with GetTickerProviderStateMixin {
  TickerProviderStateMixin? tickerProviderStateMixin;

  TabController? _tabController;

  TabController? get tabController => _tabController;

  @override
  void onInit() {
    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
