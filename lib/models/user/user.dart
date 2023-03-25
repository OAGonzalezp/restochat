import 'dart:convert';

import 'package:resto_chat/models/user/documentType.dart';
import 'package:resto_chat/models/user/eps.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.documentType,
    required this.document,
    required this.eps,
    required this.profile,
  });

  int id;
  String name;
  String document;
  String documentType;
  SuperSalud eps;
  String profile;

  User copyWith({
    required int id,
    required String name,
    required String documentType,
    required String document,
    required SuperSalud eps,
    required String profile,
  }) =>
    User(
      id: id,
      name: name,
      documentType: documentType,
      document: document,
      eps: eps,
      profile: profile,
    );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    document: json["document"],
    documentType: json["documentType"],
    eps: json["eps"],
    profile: json["profile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "documentType": documentType,
    "document": document,
    "eps": eps,
    "profile": profile,
  };
}
