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
    return Scaffold(appBar: buildAppBar(), body: buildBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Hoş Geldiniz :)"),
      backgroundColor: Color(0xff768692),
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
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...snapshot.data!.docs.map((e) => userCard(UserModel.snapshot(e)))
          ]);
        } else {
          print(snapshot);
          return const Center(child: CircularProgressIndicator());
        }
      }));
}

Widget userCard(UserModel model) {
  double maas1 = model.hafta1 * model.maas;
  double maas2 = model.hafta2 * model.maas;
  double maas3 = model.hafta3 * model.maas;
  double maas4 = model.hafta4 * model.maas;
  double maasprim = model.prim * model.maas;
  double toplamMaas = maas1 + maas2 + maas3 + maas4 + maasprim;
  int toplamHafta = model.hafta1.toInt() +
      model.hafta2.toInt() +
      model.hafta3.toInt() +
      model.hafta4.toInt() +
      model.prim.toInt();

  TextEditingController prims = TextEditingController();
  return Column(
    children: [
      Center(
        child: Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FractionColumnWidth(0.5),
            1: FractionColumnWidth(0.25),
            2: FractionColumnWidth(0.25),
          },
          children: [
            buildRow([model.isim, 'Saat', 'Ort. Maaş']),
            buildRow([
              '1. Hafta',
              model.hafta1.toString(),
              maas1.toStringAsFixed(2)
            ]),
            buildRow([
              '2. Hafta',
              model.hafta2.toString(),
              maas2.toStringAsFixed(2)
            ]),
            buildRow([
              '3. Hafta',
              model.hafta3.toString(),
              maas3.toStringAsFixed(2)
            ]),
            buildRow([
              '4. Hafta',
              model.hafta4.toString(),
              maas4.toStringAsFixed(2)
            ]),
            buildRow(
                ['Primler', model.prim.toString(), maasprim.toStringAsFixed(2)]),
            buildRow([
              'Toplam',
              toplamHafta.toString(),
              toplamMaas.toStringAsFixed(2)
            ]),
          ],
        ),
      ),
      SizedBox(height: 15),
      Text(
        "                   Prim Ekle\n(Bayram , 1 saat fazla mesai vs.)",
        style: TextStyle(
            fontSize: 20, decorationThickness: 2.85, color: Color.fromARGB(255, 175, 106, 3)),
      ),
      Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 37),
        child: TextField(cursorColor: Colors.orange,
            controller: prims,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                  

                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1.5),
                  borderRadius: BorderRadius.circular(15)
                ),

                )),
      ),
      ElevatedButton(
        child: Text('Prim Ekle'),
        onPressed: () {
          final docUser = FirebaseFirestore.instance
              .collection('kullanicilar')
              .doc(model.id);
          docUser.update({'prim': int.parse(prims.text)});
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.orange
      )),
    ],
  );
}

TableRow buildRow(List<String> cells) => TableRow(
      children: cells.map((cell) {
        return Padding(
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text(cell),
            ));
      }).toList(),
    );
