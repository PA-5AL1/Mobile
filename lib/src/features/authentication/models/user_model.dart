import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String email;
  final String password;
  final String role;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    this.role = 'user',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: '',
      role: json['role'],
    );
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["email"],
      password: '',
      role: data["role"],
    );
  }

  toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
