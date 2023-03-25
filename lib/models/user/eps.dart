import 'dart:convert';

SuperSalud superSaludFromJson(String str) => SuperSalud.fromJson(json.decode(str));

String superSaludToJson(SuperSalud data) => json.encode(data.toJson());

class SuperSalud {
  SuperSalud({
    required this.nit,
    required this.name,
    required this.ipsName,
    required this.ipsNit,
    required this.farmaName,
    required this.farmaNit,
  });

  String nit;
  String name;
  String ipsName;
  String ipsNit;
  String farmaName;
  String farmaNit;

  SuperSalud copyWith({
    required String nit,
    required String name,
    required String ipsName,
    required String ipsNit,
    required String farmaName,
    required String farmaNit,
  }) =>
    SuperSalud(
      nit: nit,
      name: name,
      ipsName: ipsName,
      ipsNit: ipsNit,
      farmaName: farmaName,
      farmaNit: farmaNit,
    );

  factory SuperSalud.fromJson(Map<String, dynamic> json) => SuperSalud(
    nit: json["nit"],
    name: json["name"],
    ipsName: json["ipsName"],
    ipsNit: json["ipsNit"],
    farmaName: json["farmaName"],
    farmaNit: json["farmaNit"],
  );

  Map<String, dynamic> toJson() => {
    "nit": nit,
    "name": name,
    "ipsName": ipsName,
    "ipsNit": ipsNit,
    "farmaName": farmaName,
    "farmaNit": farmaNit,
  };
}
