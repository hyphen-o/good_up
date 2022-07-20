import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("posts").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
          return Center(
          child: Text('取得できませんでした'),
          );
          }
          //取得中の返り値を指定
          if (!snapshot.hasData) {
            return Center(
              child: Text("Loading"),
            );
          };
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> message =
              document.data()! as Map<String, dynamic>;
              return Card(
                child: ListTile(
                  title: Text(message['content']),
                  subtitle: Text("サブタイトル"),
                ),
              );
            }).toList(),
          );

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                child: Text('Button'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 50),
                ),
              ),
            ),
          );
        },
      ),
        );

  }
}