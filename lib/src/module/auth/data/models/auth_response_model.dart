class AuthResponseModel<UserModel, TokenModel> {
  final TokenModel token;
  final UserModel user;

  AuthResponseModel({required this.token, required this.user});
}