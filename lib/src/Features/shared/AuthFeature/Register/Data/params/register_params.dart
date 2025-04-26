class RegisterRequestParams {
  final String phone;
  final String password;
  final String email;
  final String name;
  final int accType;
  final String? deviceToken;
  final String? deviceId;

  RegisterRequestParams({
    required this.phone,
    required this.password,
    required this.name,
    required this.email,
    required this.accType,
    this.deviceToken,
    this.deviceId,
  });
}
