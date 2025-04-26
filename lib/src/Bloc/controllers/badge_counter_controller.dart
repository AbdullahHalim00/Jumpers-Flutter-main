import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

abstract class BadgeCounterController extends GetxController {
  final String storageKey;

  BadgeCounterController(this.storageKey);

  final GetStorage _box = GetStorage();

  /// ************************** counts *********************************
  int _count = 0;

  int get count => _count;

  /// increase count counter by +1 everyTime its called
  void increaseCounts() {
    log(_count.toString());
    _count++;
    log(_count.toString());
    update(['notification']);
    _box.write(storageKey, _count);
  }

  /// listen To changes in the count key in the local storage
  void _listenToCountCount() {
    _box.listenKey(storageKey, (value) {
      _count = value ?? 0;
      update(['notification']);
    });
  }

  /// called only in the onInit when app launches
  void _readInitialCountCount() {
    _count = _box.read(storageKey) ?? 0;
  }

  /// clean count
  void cleanCounts() {
    _box.write(storageKey, 0);
  }

  @override
  void onInit() {
    _readInitialCountCount();
    _listenToCountCount();
    // TODO: implement onInit
    super.onInit();
  }
}

class EmployeesBadgeController extends BadgeCounterController {
  EmployeesBadgeController(String storageKey) : super(storageKey);
}

class MessageBadgeController extends GetxController /*BadgeCounterController*/ {
  // MessageBadgeController(String storageKey) : super(storageKey);
  final GetStorage _box = GetStorage();

  /// ************************** counts *********************************
  int _count = 0;

  int get count => _count;

  /// increase count counter by +1 everyTime its called
  void increaseCounts() {
    log(_count.toString());
    _count++;
    log(_count.toString());
    update(['message_notification']);
    _box.write('message_notification', _count);
  }

  /// listen To changes in the count key in the local storage
  void _listenToCountCount() {
    _box.listenKey('message_notification', (value) {
      _count = value ?? 0;
      update(['message_notification']);
    });
  }

  /// called only in the onInit when app launches
  void _readInitialCountCount() {
    _count = _box.read('message_notification') ?? 0;
  }

  /// clean count
  void cleanCounts() {
    _box.write('message_notification', 1);
  }

  @override
  void onInit() {
    _readInitialCountCount();
    _listenToCountCount();
    // TODO: implement onInit
    super.onInit();
  }
  
}

class NotificationBadgeController extends BadgeCounterController {
  NotificationBadgeController(String storageKey) : super(storageKey);
}
