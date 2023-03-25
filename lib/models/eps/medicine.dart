import 'dart:convert';

import 'package:resto_chat/models/eps/link.dart';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
  Medicine({
    required this.remisor,
    required this.prestador,
    required this.fechaCreacion,
    required this.identificador,
    required this.tipo,
    required this.estado,
    required this.url,
    required this.linksMedicamento
  });

  String? remisor;
  String? prestador;
  String? fechaCreacion;
  String? identificador;
  String? tipo;
  String? estado;
  String? url;
  List<Link>? linksMedicamento;

  Medicine copyWith({
    required String? remisor,
    required String? prestador,
    required String? fechaCreacion,
    required String? identificador,
    required String? tipo,
    required String? estado,
    required String? url,
    required List<Link>? linksMedicamento,
  }) =>
    Medicine(
      remisor: remisor,
      prestador: prestador,
      fechaCreacion: fechaCreacion,
      identificador: identificador,
      tipo: tipo,
      estado: estado,
      url: url,
      linksMedicamento: linksMedicamento,
    );

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    remisor: json["remisor"],
    prestador: json["prestador"],
    fechaCreacion: json["FechaCreacion"],
    identificador: json["identificador"],
    tipo: json["tipo"],
    estado: json["Estado"],
    url: json["Url"],
    linksMedicamento: json["LinksMedicamento"],
  );

  Map<String, dynamic> toJson() => {
    "remisor": remisor,
    "prestador": prestador,
    "FechaCreacion": fechaCreacion,
    "identificador": identificador,
    "tipo": tipo,
    "Estado": estado,
    "Url": url,
    "LinksMedicamento": linksMedicamento,
  };
}
