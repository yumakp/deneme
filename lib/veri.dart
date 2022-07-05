import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
  late String dosya;

  UserModel.snapshot(QueryDocumentSnapshot snapshot) {
    var data = snapshot.data() as dynamic;
    id = snapshot.id;
    dosya = data['dosya'];
  }
}
