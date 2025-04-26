//
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/status/http_status.dart';
// import 'package:jumper/src/Core/resources/data_state.dart';
// import 'package:jumper/src/Core/services/network/network_exceptions.dart';
// import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/bloc/Services/volunteer_api_services.dart';
// import 'package:jumper/src/Features/shared/TermsAndConditionsFeature/bloc/model/terms_privacy_model.dart';
//
// class TermsRepo {
//   final TermsApiServices _termsApiServices = Get.put(TermsApiServices());
//
//   Future<DataState<TermsPrivacyModel>>? fetchTerms() async {
//     try {
//       final httpResponse = await _termsApiServices.fetchTerms();
//       if (((httpResponse.statusCode == HttpStatus.ok) || (httpResponse.statusCode == HttpStatus.created) || (httpResponse.statusCode == HttpStatus.accepted))  && (httpResponse.data['status']??false)) {
//         if(httpResponse.data['data']!=null){
//           TermsPrivacyModel termsPrivacyModel = TermsPrivacyModel.fromJson(httpResponse.data['data']);
//           return DataSuccess<TermsPrivacyModel>(termsPrivacyModel);
//         }else{
//           return DataFailed(httpResponse.data['message']??'');
//         }
//       }
//       return DataFailed(httpResponse.data['message']??'');
//     } on NetworkDisconnectException {
//       return  DataFailed("internet_connection_error".tr,connectionError: true);
//     } on UnKnownException {
//       return  DataFailed('there_is_unKnown_exception'.tr);
//     } catch (e) {
//       throw UnKnownException(e.toString());
//     }
//   }
// }
