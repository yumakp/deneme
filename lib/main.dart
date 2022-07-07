import 'package:firebase_core/firebase_core.dart';import 'package:flutter/material.dart';
import 'package:projectus/saatgosterici.dart';
import 'package:projectus/girisekrani.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } on Exception catch (e) {
    print(e);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: IkinciEkran(),debugShowCheckedModeBanner: false,);
  }
}
