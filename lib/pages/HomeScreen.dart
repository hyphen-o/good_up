import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 2, // タブの数
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.deepOrange,
          title: const Text('Home'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'ポイント'),
              Tab(text: 'メッセージ'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text('ただいま\n50\nポイント',style: TextStyle(fontSize:40.0)),
            ),
            Center(
              child: Text('メッセージ', style: TextStyle(fontSize: 30.0)),
            ),
          ],
        ),
      ),
    );
  }
}


