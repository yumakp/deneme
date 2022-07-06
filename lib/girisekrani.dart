

import 'package:flutter/material.dart';
import 'package:projectus/saatgosterici.dart';

class IkinciEkran extends StatefulWidget {
  @override
  State<IkinciEkran> createState() => _IkinciEkranState();
}

class _IkinciEkranState extends State<IkinciEkran> {
  TextEditingController isminiz = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(' baslıkiste'),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
         

          // ignore: avoid_unnecessary_containers
          SizedBox(height: 15),
          Text(
            "İsminizi Giriniz",
            style: TextStyle(fontSize: 20, decorationThickness: 2.85),
          ),

          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 37),
            child: TextField(
              controller:isminiz,
                decoration: InputDecoration(border: OutlineInputBorder())),
          ),
          SizedBox(
            height: 31,
          ),

          
          Center(
              child: sayfayaGitmeButonu(
            AnaEkran(),
          )),
        ],
      ),
    );
  }

  Widget sayfayaGitmeButonu(Widget sayfa) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => sayfa));
        },
        child: Text("Bu Ay Kaç Saat Çalıştım ?"));
  }
}
