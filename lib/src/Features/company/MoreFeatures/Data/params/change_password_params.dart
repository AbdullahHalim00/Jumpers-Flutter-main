class ChangePasswordRequestParams {
  final String oldPassword;
  final String newPassword;

  ChangePasswordRequestParams(
      {required this.oldPassword, required this.newPassword});
}
