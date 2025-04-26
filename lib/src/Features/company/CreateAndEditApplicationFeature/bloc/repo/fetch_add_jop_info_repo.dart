import 'dart:io';

import 'package:get/get.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/model/add_jop_info_model.dart';
import 'package:jumper/src/Features/company/CreateAndEditApplicationFeature/bloc/service/fetch_add_jop_info_api_.dart';

class FetchAddJobInfoRepository {
  final FetchAddJobInfoApiService _fetchAddJobInfoApiService =
      Get.put(FetchAddJobInfoApiService());

  Future<DataState<AddJopInfoModel>>? fetchAddJobInfo() async {
    try {
      final httpResponse = await _fetchAddJobInfoApiService.fetchAddJobInfo();
      if (((httpResponse.statusCode == HttpStatus.ok) ||
              (httpResponse.statusCode == HttpStatus.created) ||
              (httpResponse.statusCode == HttpStatus.accepted)) &&
          (httpResponse.data['status'] ?? false)) {
        AddJopInfoModel addJopInfoModel =
            AddJopInfoModel.fromJson(httpResponse.data);
        return DataSuccess<AddJopInfoModel>(addJopInfoModel);
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
