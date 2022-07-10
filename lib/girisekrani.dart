

import 'package:flutter/material.dart';
import 'package:projectus/saatgosterici.dart';

class IkinciEkran extends StatefulWidget {
 static final TextEditingController  isminiz = TextEditingController();
  @override
  State<IkinciEkran> createState() => _IkinciEkranState();
}

class _IkinciEkranState extends State<IkinciEkran> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(' Kaç Saat Çalıştım?'),
      backgroundColor: Color(0xff768692),
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
              
              cursorColor: Colors.orange,
              
              controller:IkinciEkran.isminiz,
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
            backgroundColor: MaterialStateProperty.all(Colors.orange)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => sayfa));
        },
        
        child: Text("Bu Ay Kaç Saat Çalıştım ?"));
  }
}
