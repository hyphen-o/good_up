import 'package:flutter/material.dart';

import 'PostPage.dart';

var b_word = "テスト中です。";
var ok = false;
class ShopScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.yellow[100],
          title: Text(
            'Shop',
            style: TextStyle(fontSize: 16),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return PostPage();
            }))
            },
            child: Icon(Icons.add)
        ),
      body: Center(
        child: Text(
            "ここにご褒美の情報が流れる"
        ),
      ),
        );

  }
}