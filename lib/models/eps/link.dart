import 'dart:convert';

Link linkFromJson(String str) => Link.fromJson(json.decode(str));

String linkToJson(Link data) => json.encode(data.toJson());

class Link {
  Link({
    required this.descripcion,
    required this.url,
  });

  String descripcion;
  String url;

  Link copyWith({
    required String descripcion,
    required String url,
  }) =>
    Link(
      descripcion: descripcion,
      url: url,
    );

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    descripcion: json["descripcion"],
    url: json["Url"],
  );

  Map<String, dynamic> toJson() => {
    "descripcion": descripcion,
    "Url": url,
  };
}
