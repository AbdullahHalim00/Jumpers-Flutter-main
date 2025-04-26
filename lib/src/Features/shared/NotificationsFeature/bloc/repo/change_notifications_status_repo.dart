import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Features/shared/NotificationsFeature/bloc/services/change_notifications_status_services.dart';

class ChangeNotificationsStatusRepo {
  final ChangeNotificationsStatusServices _notificationsStatusServices =
      Get.put(ChangeNotificationsStatusServices());

  Future<DataState<int>>? changeState() async {
    // try {
    final httpResponse = await _notificationsStatusServices.change();
    if (((httpResponse.statusCode == HttpStatus.ok) ||
            (httpResponse.statusCode == HttpStatus.created) ||
            (httpResponse.statusCode == HttpStatus.accepted)) &&
        (httpResponse.data['status'] ?? false)) {
      if (httpResponse.data['data'] != null) {
        return DataSuccess<int>(
          (httpResponse.data['data']),
          message: httpResponse.data['message'],
        );
      } else {
        return DataFailed(ErrorModel(
            errorTitle: httpResponse.data['message'] ?? '',
            errorType: ErrorType.dataEmpty));
      }
    }
    return DataFailed(ErrorModel(
        errorTitle: httpResponse.data['message'] ?? '',
        errorType: ErrorType.unKnown));
    // } on NetworkDisconnectException {
    //   return DataFailed(ErrorModel(errorTitle: networkDisconnectException,errorType: ErrorType.networkConnection));
    // } on ServerSideException {
    //   return DataFailed(ErrorModel(errorTitle: serverSideException,errorType: ErrorType.serverSide));
    // } on UnKnownException {
    //   return DataFailed(ErrorModel(errorTitle: unKnownException,errorType: ErrorType.unKnown));
    // } catch (e) {
    //   return DataFailed(ErrorModel(errorTitle: '$e',errorType: ErrorType.unKnown));
    // }
  }
}
