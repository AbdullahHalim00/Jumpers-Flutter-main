import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/simple_model.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/params/fetch_work_type_params.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/service/fetch_work_type_api_.dart';

class FetchWorkTypeRepository {
  final FetchWorkTypeApiService _fetchWorkTypeApiService =
      Get.put(FetchWorkTypeApiService());

  Future<DataState<List<SimpleModel>>>? fetchWorkType(
      {required FetchWorkTypeParameters parameters}) async {
    try {
      final httpResponse =
          await _fetchWorkTypeApiService.fetchWorkType(parameters: parameters);
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        if (httpResponse.data['data'] != null) {
          List<SimpleModel> _listOfWorkType = [];
          for (var item in httpResponse.data['data']) {
            _listOfWorkType.add(SimpleModel.fromJson(item));
          }
          log("HUN" + _listOfWorkType[0].title.toString());
          return DataSuccess<List<SimpleModel>>(_listOfWorkType);
        } else {
          return DataFailed(ErrorModel(
              errorTitle: httpResponse.data['message'] ?? '',
              errorType: ErrorType.dataEmpty));
        }
      }
      return DataFailed(ErrorModel(
          errorTitle: httpResponse.data['message'] ?? '',
          errorType: ErrorType.unKnown));
    } on NetworkDisconnectException {
      return DataFailed(ErrorModel(
          errorTitle: networkDisconnectException,
          errorType: ErrorType.networkConnection));
    } on ServerSideException {
      return DataFailed(ErrorModel(
          errorTitle: serverSideException, errorType: ErrorType.serverSide));
    } on UnKnownException {
      return DataFailed(ErrorModel(
          errorTitle: unKnownException, errorType: ErrorType.unKnown));
    } catch (e) {
      return DataFailed(
          ErrorModel(errorTitle: '$e', errorType: ErrorType.unKnown));
    }
  }
}
