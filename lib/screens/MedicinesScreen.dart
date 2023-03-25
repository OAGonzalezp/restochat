import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:resto_chat/models/eps/link.dart';
import 'package:resto_chat/models/eps/medicine.dart';
import 'package:resto_chat/models/user/user.dart';
import 'package:resto_chat/screens/MedicineDetailScreen.dart';
import 'package:resto_chat/themes.dart';
import 'package:resto_chat/widgets/MedicineItem.dart';

class MedicinesScreen extends StatefulWidget {
  final User user;
  const MedicinesScreen({super.key, required this.user});

  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState ();
}

class _MedicinesScreenState extends State<MedicinesScreen> {
  final String url = "https://appcita.viva1a.com.co:8051/API/ObtenerHistoricoOrdenamientos?identificacion=1118886974&codigousuario=9078799&Eps=CAJACOPI%202";
  late Future<List<Medicine>> medicines;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kDarkBGColor,
      body: FutureBuilder<List<Medicine>>(
        future: medicines,
        builder: (context, snap) {
          return body(context, snap);
        }
      ),
      floatingActionButton: fab(context),
    );
  }

  Widget body(context, snap) {
    if (snap.hasData) {
      return ListView.builder(
          itemCount: snap.data!.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                MedicineItem(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicinesDetailScreen(medicine: snap.data![i])));
                    },
                    widget: Icon(getIcon(snap.data![i].tipo == null ? '' : snap.data![i].tipo)),
                    initial: '',
                    title: snap.data![i].tipo == null ? '' : snap.data![i].tipo,
                    sender: '',
                    message: snap.data![i].remisor == null ? '' : snap.data![i].remisor,
                    time: snap.data![i].fechaCreacion == null ? '' : DateFormat.yMMMd().format(DateTime.parse(snap.data![i].fechaCreacion)),
                    mute: false,
                    unread: 2,
                    color: kBlue2Color
                ),
              ],
            );
          });
    }
    if (snap.hasError) {
      return const Center(
        child: Text("Ha habido un problema"),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }

  Widget fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        this.loadMedicines();
      },
      backgroundColor: kBlue3Color,
      child: const Icon(Icons.refresh),
    );
  }

  @override
  void initState() {
    super.initState();
    loadMedicines();
  }

  void loadMedicines() {
    medicines = getMedicines();
  }

  IconData getIcon(String type) {
    switch(type) {
      case 'SERVICIOS':
      case 'SERVICIO': return Icons.health_and_safety_outlined;
      case 'CONSULTAS':
      case 'CONSULTA': return Icons.medical_information_outlined;
      case 'LABORATORIO': return Icons.medical_services_outlined;
      case 'IMAGENOLOGIA': return Icons.image_aspect_ratio_outlined;
      case 'Medicamento': return Icons.medication_liquid_outlined;
      default: return Icons.health_and_safety_outlined;
    }
  }

  Future<List<Medicine>> getMedicines() async {

    var response = await http.get(Uri.parse(url));
    final lista = List.from(jsonDecode(response.body));

    List<Medicine> medicines = [];

    for (var medicine in lista) {

      if (medicine["LinksMedicamento"] != null) {
        List<Link> links = [];
        for (var link in medicine["LinksMedicamento"]) {
          links.add(Link.fromJson(link));
        }
        medicine["LinksMedicamento"] = links;
      }
      final Medicine product = Medicine.fromJson(medicine);

      medicines.add(product);
    }
    return medicines;
  }
}
