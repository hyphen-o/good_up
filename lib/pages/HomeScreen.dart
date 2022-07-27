import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // Appbar
        appBar: AppBar(
          backgroundColor:Colors.deepOrange,
          title: Row(children: [
            Text("ホーム"),
          ]),
        ),
        body: Center(
          child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    // 枠線
                    border: Border.all(color: Colors.black12, width: 20),
                    // 角丸
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(100),
                  child: Column(
                  children: <Widget>[
                    Text("ただいま",style: TextStyle(fontSize: 50),textAlign: TextAlign.left),
                    Text('50',style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold)),
                    Text("ポイント",style: TextStyle(fontSize: 50),textAlign: TextAlign.right),
                  ],
                  ),
                ),
              ],
          ),

       ),
    );
  }
}