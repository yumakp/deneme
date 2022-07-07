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
    return Scaffold(appBar: buildAppBar(), body: 
     buildBody());
  }
  AppBar buildAppBar() {
    return AppBar(
      title: Text("Hoş Geldiniz :)"),
    );
  }



  }

  Widget buildBody() {
    
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    
      
        stream: FirebaseFirestore.instance
            .collection('kullanicilar')
            .where('isim', isEqualTo: (IkinciEkran.isminiz.text))
            .snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                
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
    double maas1 = model.hafta1 * 18.88 ;
    double maas2 = model.hafta2 * 18.88 ;
    double maas3 = model.hafta3 * 18.88 ;
    double maas4 = model.hafta4 * 18.88 ;
    double toplamMaas = maas1 + maas2 + maas3 + maas4;
    
    
    
    
    
    return Center(
      child: Table(
        border: TableBorder.all(),
        columnWidths:   {
          0: FractionColumnWidth(0.5),
          1: FractionColumnWidth(0.25),
          2: FractionColumnWidth(0.25),
        },
        children: [
          buildRow  ([model.isim,'Saat','Ort. Maaş']),
          buildRow  (['1. Hafta',model.hafta1.toString(),maas1.toStringAsFixed(2)]),
          buildRow  (['2. Hafta',model.hafta2.toString(),maas2.toStringAsFixed(2)]),
          buildRow  (['3. Hafta',model.hafta3.toString(),maas3.toStringAsFixed(2)]),
          buildRow  (['4. Hafta',model.hafta4.toString(),maas4.toStringAsFixed(2)]),
          buildRow  (['Toplam',model.hafta4.toString(),toplamMaas.toStringAsFixed(2)]),
        ],
        
      )
    );
  }
TableRow buildRow(List<String> cells) => 
TableRow(children: 
cells.map((cell){
return Padding(padding: const EdgeInsets.all(12),
child: Center(child: Text(cell),));



} ).toList(),

);
