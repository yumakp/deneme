import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectus/veri.dart';
import 'package:projectus/girisekrani.dart';

class AnaEkran extends StatefulWidget {
  AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: 
     buildBody());
  }
 



  }

  Widget buildBody() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    
      
        stream: FirebaseFirestore.instance
            .collection('kullanicilar')
            .where('isim', isEqualTo: 'isminiz',)
            .snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              ...snapshot.data!.docs.map((e) => userCard(UserModel.snapshot(e))
              
              )
            ]
            );
          } else {
            print(snapshot);
            return const Center(child: CircularProgressIndicator());
          }
        }));
        
        
  }
  

  Widget userCard(UserModel model) {
    return Column(
      children: [
        
        Center(
          
          child: ListTile(
            title: Text(model.isim),
            subtitle: Text(model.id),
          ),
        ),
      ],
    );
  }

