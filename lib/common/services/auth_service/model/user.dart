class User {
  final int id;
  final String email;
  final String phoneNumber;
  final String token;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.token,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      token: json['token'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'token': token,
      'password': password,
    };
  }
}
