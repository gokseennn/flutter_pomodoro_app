import 'package:flutter/material.dart';

class User {
  final int id;
  final String email;
  final String phoneNumber;
  final String token;

  User({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      token: json['token'],
    );
  }
}
