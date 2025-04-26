// import 'package:http_parser/http_parser.dart';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:jumper/src/Core/services/network/api_names.dart';
//
//
// class NetworkService with ApiNames {
//
//   Dio dio = injector.get<Dio>();
//
//   // String apiTokenStatic ='\$2y\$10\$AQYT9UyOm484lK7pQ0Kw2.SjsEIXFz3TbucSFa6mN0ayho.pKCuwq';
//   Future<Response> get({@required String? url, Map<String,
//       String>? headers, bool auth = false}) async {
//     String apiTokenStatic = await fetchApiToken();
//     print('api_token : ${apiTokenStatic}');
//     Response? response;
//     //TODO fetch api token here and save it in apiToken
//     try {
//       dio.options.baseUrl = ApiKey.apiBaseUrl;
//       response = await dio.get(url!, options: Options(
//           headers: headers ?? {
//             // 'Accept-Language' : 'en',
//             if(auth && apiTokenStatic != null && apiTokenStatic.isNotEmpty)
//             // 'Authorization': 'Bearer ' + apiToken
//               'Authorization': 'Bearer ' + apiTokenStatic
//           }
//       ));
//     } on DioError catch (e) {
//       if (e.toString().contains('SocketException')) {
//         throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
//       }
//       if (e.response != null) {
//         if (e.response.toString().contains('SocketException')) {
//           throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
//         }
//       }
//       if (e.response != null) {
//         response = e.response;
//       }
//     }
//     return handleResponse(response!);
//   }
//
//   Future<Response> post(
//       {@required String? url,
//         Map<String, String>? headers,
//         Map<String, dynamic>? body,
//         bool auth = false,
//         List<File>? fileList,
//         String imagesKey = '',
//       }) async {
//     String apiTokenStatic = await fetchApiToken();
//     Response? response;
//     dio.options.baseUrl = ApiKey.apiBaseUrl;
//     FormData formData = FormData.fromMap(body ?? {},);
//     /* handle upload images */
//     if (file List!=null) {
//       for (File item in fileList) {
//         formData.files.add(
//           MapEntry("${imagesKey}", await MultipartFile.fromFile(
//               item.path, filename: '',
//               contentType: MediaType("image", "jpg"),
//               headers: {'type': ['image/jpg']})),
//         );
//       }
//     }
//     try {
//       response = await dio.post(
//         url!,
//         data: formData,
//         // data: isImage?formData:jsonEncode(body),
//         options: Options(
//             headers: headers ?? {
//               // 'Accept-Language' : 'en',
//               if(auth && apiTokenStatic != null && apiTokenStatic.isNotEmpty)
//               // 'Authorization': 'Bearer ' + apiToken
//                 'Authorization': 'Bearer ' + apiTokenStatic
//             },
//             contentType: 'application/json multipart/form-data'
//           // contentType: 'application/json'
//           // requestEncoder: encoding,
//         ),
//       );
//     } on DioError catch (e) {
//       if (e.toString().contains('SocketException')) {
//         throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
//       }
//       if (e.response != null) {
//         if (e.response.toString().contains('SocketException')) {
//           throw NetworkDisconnectException('لا يوجد اتصال بالانترنت');
//         }
//       }
//       if (e.response != null) {
//         response = e.response;
//       }
//     }
//     return handleResponse(response!);
//   }
//
//
//   Response handleResponse(Response response) {
//     final int statusCode = response.statusCode ?? 500;
//     // if(statusCode==HttpStatus.unauthorized){
//     //   throw ServerSideException('server side exception');
//     // }
//     print('----- $response ------');
//     if (statusCode == 500) {
//       throw ServerSideException('server side exception');
//     }
//
//     if (statusCode >= 200 && statusCode < 300) {
//       log("correct request: " + response.toString());
//       return response;
//     } else {
//       log("incorrect request: " + response.toString());
//       return response;
//     }
//   }
// }