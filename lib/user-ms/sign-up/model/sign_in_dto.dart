class SignInDto {
  String email;
  String password;
  String phoneNumber;
  SignInDto(
      {required this.email, required this.password, required this.phoneNumber});

  Map<String, dynamic> toJson() =>
      {'email': email, 'password': password, 'phoneNumber': phoneNumber};
}
