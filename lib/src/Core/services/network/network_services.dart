import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jumper/src/Core/utils/storage_util.dart';
import 'package:jumper/src/Core/utils/utils.dart';

import 'api_names.dart';
import 'network_exceptions.dart';

const kConnectTimeout = 30 * 1000;

const kReceiveTimeout = 30 * 1000;

const String _testToken =
// "\$2y\$10\$1TnjcZKpkHbowflj/9tORuTzfid43/Tm.Dwls5m82erL8NxhOHiPm";
    "\$2y\$10\$ZvdC7bSb2yoOvKLozXs6YOu37UEmWeFLm51LYdVW50Ebqmh9n3CBC";

///change _apiToken later :

class NetworkService with ApiNames {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: kConnectTimeout,
      receiveTimeout: kReceiveTimeout,
    ),
  );

  final GetStorage _box = GetStorage();
  final DataBase _dataBase = Get.find<DataBase>();

  // final Options? _basicOptions =BaseOptions(
  //   receiveTimeout: 20 * 1000,
  //   sendTimeout: 20 * 1000,
  //
  // );

  Future<Response> get({
    required String url,
    Map<String, String>? headers,
    bool auth = false,
    int requestTimeOut = kReceiveTimeout,
  }) async {
    Response? response;
    printDM("log _testToken in netWork >>>>>>>>>:-> $_testToken");
    printDM(
        "log apiToken in netWork >>>>>>>>>:-> ${_dataBase.restoreUserModel().apiToken}");
    try {
      _dio.options.baseUrl = ApiNames.baseUrl;

      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return null;
      };

      response = await _dio.get(
        url,
        queryParameters: headers,
        options: Options(
          receiveTimeout: requestTimeOut,
          sendTimeout: requestTimeOut,
          headers: headers ??
              {
                'Accept-Language': Utils.cachedLocale,
                // 'Accept-Language': 'ar',
                if (auth)
                  'Authorization':
                      'Bearer ${_dataBase.restoreUserModel().apiToken}'
                // if (auth) 'Authorization': 'Bearer $_testToken'
                // if (auth) 'Authorization': 'Bearer $_testToken'
              },
        ),
      );
    } on DioError catch (e) {
      if (e.message.toString().contains('SocketException')) {
        Utils.showToast(
            title: "check_ur_connection".tr, state: UtilState.Warning);
        throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
      } else if (e.response != null) {
        if (e.response.toString().contains('SocketException')) {
          Utils.showDefaultSnackBar(
              title: "SocketException , Please check your internet connection");
          throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
        }
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        Utils.showToast(
          title: "تأكد من سرعة اتصالك بمزود خدمة الانترنت",
          state: UtilState.Warning,
        );
      }
      if (e.response != null) {
        response = e.response;
      }
    } on SocketException {
      throw SocketException;
    } catch (e) {
      throw SocketException;
    }
    return _handleResponse(response!);
  }

  Future<Response> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool auth = false,
    List<File>? fileList,
    String imagesKey = '',
    List<String>? imagesKeys,
    int requestTimeOut = kConnectTimeout,
  }) async {
    Response? response;
    printDM("log _testToken in netWork >>>>>>>>>:-> $_testToken");
    printDM(
        "log apiToken in netWork >>>>>>>>>:-> ${_dataBase.restoreUserModel().apiToken}");
    _dio.options.baseUrl = ApiNames.baseUrl;
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
    FormData formData = FormData.fromMap(
      body ?? {},
    );
    /* handle upload images */
    if (fileList != null) {
      for (File item in fileList) {
        formData.files.add(
          MapEntry(
            imagesKey,
            await MultipartFile.fromFile(
              item.path,
              filename: '',
              contentType: MediaType("image", "jpg"),
              headers: {
                'type': ['image/jpg']
              },
            ),
          ),
        );
      }
    }
    try {
      response = await _dio.post(
        url,
        data: formData,
        options: Options(
            receiveTimeout: requestTimeOut,
            sendTimeout: requestTimeOut,
            headers: headers ??
                {
                  'Accept-Language': Utils.cachedLocale,
                  // 'Accept-Language': 'ar',
                  if (auth)
                    'Authorization':
                        'Bearer ${_dataBase.restoreUserModel().apiToken}'
                  // if (auth) 'Authorization': 'Bearer $_testToken'
                },
            contentType: 'application/json multipart/form-data'
            // requestEncoder: encoding,
            ),
      );
      printDM("body in network DoiSuccess is $body , is Auth $auth}");
    } on DioError catch (e) {
      printDM("body in network DioError is $body , is Auth $auth}");
      printDM('error 123 $e');
      if (e.message.toString().contains('SocketException')) {
        Utils.showToast(
            title: "check_ur_connection".tr, state: UtilState.Warning);
        throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
      } else if (e.response != null) {
        if (e.response.toString().contains('SocketException')) {
          Utils.showDefaultSnackBar(
              title: "SocketException , Please check your internet connection");
          throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
        }
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        Utils.showToast(
            title: "تأكد من سرعة اتصالك بمزود خدمة الانترنت",
            state: UtilState.Warning);
      }
      if (e.response != null) {
        response = e.response;
      }
    }
    return _handleResponse(response!);
  }

  Future<Response> postFiles({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool auth = false,
    List<File>? fileList,
    String imagesKey = '',
    List<String>? imagesKeys,
  }) async {
    Response? response;
    printDM("log _testToken in netWork >>>>>>>>>:-> $_testToken");
    printDM(
        "log apiToken in netWork >>>>>>>>>:-> ${_dataBase.restoreUserModel().apiToken}");
    _dio.options.baseUrl = ApiNames.baseUrl;

    // FormData formFilesData = FormData.fromMap({});
    /* handle upload images */
    // body!.forEach((key, value) async {
    //   if ((value) is File) {
    //     body.remove(key);
    //     //create multipart using filepath, string or bytes
    //     MapEntry<String, MultipartFile> pic = MapEntry(
    //       key,
    //       MultipartFile.fromFileSync(value.path,
    //           filename: value.path.split("/").last),
    //     );
    //     //add multipart to request
    //     formFilesData.files.add(pic);
    //   } else if ((value) is List<File>) {
    //     body.remove(key);
    //     List<MapEntry<String, MultipartFile>> files = [];
    //     value.forEach((element) async {
    //       MapEntry<String, MultipartFile> pic = MapEntry(
    //           key,
    //           MultipartFile.fromFileSync(
    //             element.path,
    //             filename: element.path.split("/").last,
    //           ));
    //       files.add(pic);
    //     });
    //     formFilesData.files.addAll(files);
    //   }
    //   else if ((value) is List<List<File>>) {
    //     body.remove(key);
    //     // List<MapEntry<String, MultipartFile>> files = [];
    //     value.forEach((element) async {
    //       List<MapEntry<String, MultipartFile>> files = [];
    //       element.forEach((item) {
    //         MapEntry<String, MultipartFile> pic = MapEntry(
    //             key,
    //             MultipartFile.fromFileSync(
    //               item.path,
    //               filename: item.path.split("/").last,
    //             ));
    //         files.add(pic);
    //       });
    //       formFilesData.files.addAll(files);
    //     });
    //   }
    // });
    FormData formData = FormData.fromMap(body ?? {});
    // if(formFilesData.files.isNotEmpty){
    //   formData.files.addAll(formFilesData.files);
    // }
    // if(fileList!=null){
    //   for (File item in fileList){
    //     formData.files.add(MapEntry("$imagesKey", await MultipartFile.fromFile(item.path, filename: '',contentType:MediaType("image", "jpg"),headers: {'type': ['image/jpg']})),);
    //   }
    // }
    try {
      response = await _dio.post(
        url,
        data: formData,
        options: Options(
            headers: headers ??
                {
                  'Accept-Language': Utils.cachedLocale,

                  // 'Accept-Language': 'ar',
                  if (auth)
                    'Authorization':
                        'Bearer ${_dataBase.restoreUserModel().apiToken}'
                  // if (auth) 'Authorization': 'Bearer $_testToken'
                },
            contentType: 'application/json multipart/form-data'

            // requestEncoder: encoding,
            ),
      );
      printDM("body in network DoiSuccess is $body , is Auth $auth}");
    } on DioError catch (e) {
      printDM("body in network DioError is $body , is Auth $auth}");
      printDM('error 123 $e');
      if (e.message.toString().contains('SocketException')) {
        Utils.showToast(
            title: "check_ur_connection".tr, state: UtilState.Warning);
        throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
      } else if (e.response != null) {
        if (e.response.toString().contains('SocketException')) {
          Utils.showDefaultSnackBar(
              title: "SocketException , Please check your internet connection");
          throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
        }
      } else if (e.error == DioErrorType.connectTimeout ||
          e.error == DioErrorType.receiveTimeout) {
        Utils.showToast(
            title: "تأكد من سرعة اتصالك بمزود خدمة الانترنت",
            state: UtilState.Warning);
      }
      if (e.response != null) {
        response = e.response;
      }
    }
    return _handleResponse(response!);
  }

  Response _handleResponse(Response response) {
    final int statusCode = response.statusCode ?? 500;
    if (statusCode == 500) {
      throw ServerSideException('server side exception');
    } else if (statusCode == 401) {
      throw UnAuthorizedException('server side exception');
    }

    if (statusCode >= 200 && statusCode < 300) {
      printDM("correct request: $response");
    } else {
      printDM("incorrect request: $response");
    }
    return response;
  }
}
