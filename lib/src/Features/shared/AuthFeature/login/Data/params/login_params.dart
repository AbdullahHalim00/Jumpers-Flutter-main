class LoginRequestParams {
  final String phone;
  final String password;
  final String? deviceToken;
  final String? deviceId;

  LoginRequestParams({
    required this.phone,
    required this.password,
    this.deviceToken,
    this.deviceId,
  });
}
