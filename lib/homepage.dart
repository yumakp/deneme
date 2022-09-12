import 'package:excelconn/sheetsservice.dart';
import 'package:excelconn/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  String? cell;
  @override
  void initState() {
    super.initState();
    getdata();
getUsers();
  }
  @override
  Widget build(BuildContext context) {
    UserSheetsApi.getData();
    return Scaffold(
      body: Center(
       child: Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FractionColumnWidth(0.5),
            1: FractionColumnWidth(0.25),
            2: FractionColumnWidth(0.25),
          },
          children: [
            buildRow(["s", 'Saat', 'Ort. Maaş']),
            buildRow([
             'Primler',"s" , "s"
            ]),
            buildRow([
             'Primler',"s" , "s"
            ]),
            buildRow([
             'Primler',"s" , "s"
            ]),
            buildRow([
              'Primler',"s" , "s"
            ]),
            buildRow(
                ['Primler',"s" , "s"]),
            buildRow([
            'Primler',  "s", 
              
            ]),
          ],
        ),
      ));
  }

  void getdata() async{
    cell= await UserSheetsApi.getData();
    setState(() 
    {
      
    });
  }
  Future getUsers() async{
    final  user = await UserSheetsApi.getUsers(2);
    print (user!.toJson());
    user.mapide) => 
    setState(() {
      
    });
    
  }
  TableRow buildRow(List<String> getUsers) => TableRow(
    
      children: getUsers.map((cell) {
        return Padding(
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text(cell),
            ));
      }).toList(),
    );
    
}