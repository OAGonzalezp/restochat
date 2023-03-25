library data;

import 'package:resto_chat/models/user/documentType.dart';

List<DocumentType> getDocumentTypes() {
  return [
    DocumentType(code: "CC", name: "Cédula de Ciudadania"),
    DocumentType(code: "CE", name: "Cédula de Extranjería"),
    DocumentType(code: "RC", name: "Registro Civil"),
  ];
}
