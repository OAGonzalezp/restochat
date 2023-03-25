import 'package:flutter/material.dart';
import 'package:resto_chat/data/documentType.dart';
import 'package:resto_chat/data/superSalud.dart';
import 'package:resto_chat/models/user/documentType.dart';
import 'package:resto_chat/models/user/eps.dart';
import 'package:resto_chat/utils/Singleton.dart';
import 'package:resto_chat/widgets/InputField.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  List<DocumentType> documentTypes = getDocumentTypes();
  List<SuperSalud> superSalud = getEPSs();
  DocumentType selectDocumentType = DocumentType(code: '', name: '');
  SuperSalud selectEps = SuperSalud(nit: '', name: '', ipsName: '', ipsNit: '', farmaName: '', farmaNit: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Singleton().getBGColor(),
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Singleton().getProfileColor(),
      elevation: 2,
      title: const Text('Nuevo Afiliado'),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_reaction_outlined)
        )
      ],
    );
  }

  Container body() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
            children: [
              InputField(
                  title: 'Nombre del paciente',
                  hint: ''
              ),
              InputField(
                title: 'Tipo de documento',
                hint: selectDocumentType.code,
                child: DropdownButton(
                  onChanged: (DocumentType? newVal) {
                    setState(() {
                      this.selectDocumentType = newVal!;
                    });
                  },
                  items: documentTypes
                      .map<DropdownMenuItem<DocumentType>>(
                        (e) => DropdownMenuItem<DocumentType>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                      .toList(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 32,
                    color: Colors.grey,
                  ),
                  elevation: 3,
                  underline: Container(height: 0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              InputField(
                  title: 'Numero de documento',
                  hint: ''
              ),
              InputField(
                title: 'EPS',
                hint: '',
                child: DropdownButton(
                  onChanged: (SuperSalud? newVal) {
                    setState(() {
                      //_selectedRemind = int.parse(newVal!);
                    });
                  },
                  items: superSalud
                      .map<DropdownMenuItem<SuperSalud>>(
                        (e) => DropdownMenuItem<SuperSalud>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                      .toList(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 32,
                    color: Colors.grey,
                  ),
                  elevation: 3,
                  underline: Container(height: 0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ]
        )
      )
    );
  }
}