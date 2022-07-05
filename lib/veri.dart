import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  late String dosya;



 UserModel.fromJson(
QueryDocumentSnapshot snapshot

 ){
var data = snapshot.data( ) as dynamic;


dosya = data[''];



}

}