import 'dart:convert';

DocumentType documentTypeFromJson(String str) => DocumentType.fromJson(json.decode(str));

String documentTypeToJson(DocumentType data) => json.encode(data.toJson());

class DocumentType {
  DocumentType({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  DocumentType copyWith({
    required String code,
    required String name,
  }) =>
    DocumentType(
      code: code,
      name: name,
    );

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}
