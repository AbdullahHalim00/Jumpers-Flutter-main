import 'package:dio/dio.dart';
import 'package:jumper/src/Core/constants/handle_error_constant.dart';
import 'package:jumper/src/Core/services/network/api_names.dart';
import 'package:jumper/src/Core/services/network/network_exceptions.dart';
import 'package:jumper/src/Core/services/network/network_services.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class ReturnEmployeeApiService with ApiNames {
  final NetworkService _networkService = NetworkService();

  Future<Response> returnEmployee({
    required int jobID,
    required int employeeID,
  }) async {
    Response response;

    try {
      response =
          await _networkService.post(url: uRLReturnEmployee, auth: true, body: {
        "job_id": jobID,
        "employee_id": employeeID,
      });
    } on NetworkDisconnectException {
      throw NetworkDisconnectException(networkDisconnectException);
    } on ServerSideException {
      throw ServerSideException(serverSideException);
    } on UnKnownException {
      throw UnKnownException(unKnownException);
    } catch (e) {
      throw UnKnownException(e.toString());
    }
    printDM("CompanyStatics2 ${response.data.toString()}  ");

    return response;
  }
}
