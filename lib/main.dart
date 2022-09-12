import 'package:excelconn/sheetsservice.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';


void main()async {  WidgetsFlutterBinding. ensureInitialized ();
await UserSheetsApi.init ();

  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}