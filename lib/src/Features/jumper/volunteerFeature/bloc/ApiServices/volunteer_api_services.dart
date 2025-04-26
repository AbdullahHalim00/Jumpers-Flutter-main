// class TermsApiServices with ApiNames {
//   final NetworkService _networkService = NetworkService();
//
//   Future<Response> fetchTerms() async {
//
//     Response response;
//     try {
//       response = await _networkService.get(
//         url: uRLTerms,
//       );
//     } on NetworkDisconnectException {
//       throw NetworkDisconnectException('no_internet_connection'.tr);
//     } on UnKnownException {
//       throw UnKnownException('there_is_unKnown_exception'.tr);
//     } catch (e) {
//       throw UnKnownException(e.toString());
//     }
//     return response;
//   }
// }
