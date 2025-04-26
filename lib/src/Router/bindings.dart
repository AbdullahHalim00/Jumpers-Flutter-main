import 'package:get/get.dart';
import 'package:jumper/src/Bloc/controllers/badge_counter_controller.dart';
import 'package:jumper/src/Bloc/controllers/language_controller.dart';
import 'package:jumper/src/Core/services/storage/storage_constants.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LanguageController(),
      fenix: true,
    );
    Get.lazyPut(
      () => NotificationBadgeController(stgNotificationCount),
      fenix: true,
    );
    Get.lazyPut(
      () => MessageBadgeController(/*stgMessageCount*/),
      fenix: true,
    );
    Get.lazyPut(
      () => EmployeesBadgeController(stgEmployeesCount),
      fenix: true,
    );
    // Get.put(
    //   () => NotificationBadgeController(stgNotificationCount),
    //   permanent: true,
    // );

    // TODO: implement dependencies
  }
}
