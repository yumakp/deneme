import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
   late String isim;
   late int hafta1;
   late int hafta2;
   late int hafta3;
   late int hafta4;
   late int prim;
   late double maas;
  
   

  UserModel.snapshot(QueryDocumentSnapshot snapshot) {
    var data = snapshot.data() as dynamic;
    id = snapshot.id;
    isim = data['isim'];
    hafta1 = data['hafta1'];
    hafta2 = data['hafta2'];
    hafta3 = data['hafta3'];
    hafta4 = data['hafta4'];
    prim =    data['prim'];
    maas = double.parse(data ['maas'].toString());

  }
}
