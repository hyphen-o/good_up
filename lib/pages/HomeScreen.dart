import 'package:flutter/material.dart';
import './home/PointScreen.dart';
import './home/MessageScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 2, // タブの数
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          backgroundColor:Colors.lightGreen,
          title: const Text('ホーム'),
          centerTitle: true,

          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'ポイント'),
              Tab(text: 'メッセージ'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PointScreen(),
            MessageScreen(),
          ],
        ),
      ),
    );
  }
}


