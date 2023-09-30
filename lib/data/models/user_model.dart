import 'package:flutter/src/widgets/editable_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String address;
  final String phone;
  final String email;
  final String password;
  UserModel({
    required this.password,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phone,
    required this.email,
  });
  toJson() {
    return {
      "First Name": firstName,
      "Last Name": lastName,
      "Address": address,
      "Phone Number": phone,
      "Email": email,
      "Password": password,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "First Name": firstName,
      "Last Name": lastName,
      "Address": address,
      "Phone Number": phone,
      "Email": email,
      "Password": password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> data, String documentId) {
    return UserModel(
      id: documentId,
      password: data["Password"],
      firstName: data["First Name"],
      lastName: data["Last Name"],
      address: data["Address"],
      phone: data["Phone Number"],
      email: data["Email"],
    );
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
      id: document.id,
      password: data["Password"],
      firstName: data["First Name"],
      lastName: data["Last Name"],
      address: data["Address"],
      phone: data["Phone Number"],
      email: data["Email"],
    );
  }
}
