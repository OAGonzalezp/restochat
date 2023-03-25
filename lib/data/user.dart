library data;

import 'package:resto_chat/models/story/story.dart';
import 'package:resto_chat/models/user/eps.dart';
import 'package:resto_chat/models/user/user.dart';

List<User> getUsers() {
  return [
    User(
      id: 1,
      name: 'Alessa Gabriela Ipuana Gonzalez',
      documentType: 'RC',
      document: '1118886974',
      eps: SuperSalud(
          nit: "890102044-1",
          name: "CajacopiEPS",
          farmaName: "LOGIFARMA S.A.S.",
          farmaNit: "900073223",
          ipsName: "VIVA 1A IPS S.A",
          ipsNit: "900219120-2"
      ),
      profile: 'https://images.pexels.com/photos/1855582/pexels-photo-1855582.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200',
    )
  ];
}
