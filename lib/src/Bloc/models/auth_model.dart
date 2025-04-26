class AuthModel {
  late int id;
  late String name;
  late String apiToken;
  String? deviceId;
  String? deviceToken;
  late int phoneVerify;

  AuthModel(
      {required this.id,
      required this.name,
      required this.apiToken,
      this.deviceId,
      this.deviceToken,
      required this.phoneVerify});

  AuthModel.fromJson(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    name = map['name'] ?? ' ';
    apiToken = map['api_token'] ?? ' ';
    phoneVerify = map['phone_verify'] ?? 0;
  }
}
