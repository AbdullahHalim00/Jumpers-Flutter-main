import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jumper/src/Bloc/controllers/badge_counter_controller.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/shared/NotificationsFeature/bloc/model/notificationsModel.dart';
import 'package:jumper/src/Features/shared/NotificationsFeature/bloc/repo/notifications_repo.dart';

class NotificationsController extends GetxController {
  DataState<List<NotificationsModel>> _dataState =
      const DataInitial<List<NotificationsModel>>();

  DataState<List<NotificationsModel>> get dataState => _dataState;

  /// called whenever i enter the screen
  GetStorage _box = GetStorage();
  NotificationBadgeController countNumbersController = Get.find();

  void clearCounter() {
    //    _box.write(stgNotificationCount, 0);
    //   update();
    //   //
    countNumbersController.cleanCounts();
    //   // update();
  }

  ///-------------------------- Fetch Data -------------------------------------

  final NotificationsRepo _notificationsRepo = Get.put(NotificationsRepo());

  List<NotificationsModel> _notifications = [];

  List<NotificationsModel> get notifications => _notifications;

  Future<void> fetchNotifications() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      clearCounter();
      _dataState = const DataLoading();
      update();
      _dataState = await (_notificationsRepo.fetchNotifications())!;
      // log("MMM"+_dataState.data!.length.toString());
      _notifications = _dataState.data ?? [];
      update();
    });
  }

  @override
  void onInit() {
    fetchNotifications();
    // TODO: implement onInit
    super.onInit();
  }
}
