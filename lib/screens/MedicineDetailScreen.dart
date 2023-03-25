import 'package:flutter/material.dart';
import 'package:resto_chat/models/eps/medicine.dart';
import 'package:resto_chat/pages/PDFViewerPage.dart';
import 'package:resto_chat/utils/Singleton.dart';
import 'package:resto_chat/utils/StringExtension.dart';

class MedicinesDetailScreen extends StatelessWidget {
  final Medicine medicine;
  final String url = "https://appcita.viva1a.com.co:8051/API/ObtenerHistoricoOrdenamientos?identificacion=1118886974&codigousuario=9078799&Eps=CAJACOPI%202";

  const MedicinesDetailScreen({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Singleton().getBGColor(),
      appBar: appBar(),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.how_to_reg),
            title: Text('Remisor'),
            subtitle: Text(medicine.remisor == null ? 'Sin remisor' : medicine.remisor!),
          ),
          ListTile(
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.house_outlined),
            title: Text('Prestador'),
            subtitle: Text(medicine.prestador!),
          ),
          ListTile(
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.access_alarm_outlined),
            title: Text(medicine.estado!),
            subtitle: Text(medicine.fechaCreacion!),
          ),
          const Divider(thickness: 1),
          medicine.linksMedicamento == null ? singleDocumentButton(context) : monthlyDocumentButton(context),
        ],
      ),
    );
  }

  Widget singleDocumentButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () async {
            openDocument(context, medicine.url, medicine.tipo, "1118886974");
          },
          icon: Icon(
            Icons.file_copy_outlined,
            color: Singleton().getChatTitleColor(),
          ),
          label: Text('Ver documento'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20), backgroundColor: Singleton().getActive2Color(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
        )
    );
  }


  Widget monthlyDocumentButton(BuildContext context) {
    return Column(
      children: medicine.linksMedicamento!.map((e) => Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () async {
              openDocument(context, e.url, e.descripcion, "1118886974");
            },
            icon: Icon(
              Icons.file_copy_outlined,
              color: Singleton().getChatTitleColor(),
            ),
            label: Text('Ver documento ( ' + e.descripcion + ')'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20), backgroundColor: Singleton().getActive2Color(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          )
      )).toList(),
    );
  }


  Widget item(String title, String subTitle) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title.capitalize(),
                style: TextStyle(
                    fontFamily: 'Lato',
                    color: Singleton().getChatTitleColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                subTitle.capitalize(),
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Singleton().getChatTitleColor(),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Singleton().getProfileColor(),
      elevation: 2,
      title: Text((medicine.tipo! + ' | ' + medicine.identificador!).capitalize()),
    );
  }

  void openDocument(context, url, header, password) async {

/*
    final Uint8List bytes = await InternetFile.get(
      Uri.decodeFull(url),
      force: true,
      progress: (receivedLength, contentLength) {
        final percentage = receivedLength / contentLength * 100;
        print(
            'download progress: $receivedLength of $contentLength ($percentage%)');
      },
    );
*/

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PDFViewerPage(url: url, header: header, password: password,)),
    );
  }
}
