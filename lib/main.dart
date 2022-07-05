import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'veri.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
  
}

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
   title: Text('All Doc'),
  ),
  body: Container(
    child: StreamBuilder
    (
      stream: mystream,
      builder: (context, snapshot) {
        if (snapshot.hasData){
         print(snapshot.data);

         return ListView(
         
         );

        }
        return Container();
      }




    ),
  )
  
  
  
  );
Widget userCard(UserModel model){

  return ListTile(
    title: Text(model.dosya)
  );
}

Stream mystream = FirebaseFirestore.instance.collection('kullanicilar').snapshots();

}