import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'PostPage.dart';

var b_word = "テスト中です。";
var ok = false;
class ShopScreen extends StatelessWidget {
  get firebase => null;

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
            child: Icon(Icons.add_shopping_cart)
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
                  leading: Icon(Icons.shopping_cart),
                  title: Text(message['content']),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(child: Icon(Icons.monetization_on_outlined)), //引数「child」で表示するアイコンを指定
                        TextSpan(text: message['money'])
                      ],
                    ),
                  ),
                  onTap: () {
                    print('Tap');
                    print(message['money']);

                    CollectionReference money = FirebaseFirestore.instance.collection('money');

                    Map<String, dynamic> moneys =
                    document.data()! as Map<String, dynamic>;
                    print(moneys['wallet']);
                    money.doc('money').update({
                      'wallet': (int.parse(message['money'])).toString(),
                    });
                    CollectionReference messages = FirebaseFirestore.instance.collection('message');
                    messages.add({
                      "notice": message['content']
                    });
                    var result = showDialog<int>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('購入通知'),
                          content: Text(message['content'] + 'を購入しました'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK!'),
                              onPressed: () => Navigator.of(context).pop(1),
                            ),
                          ],
                        );
                      },
                    );
                    
                  },
                ),
              );

            }).toList(),
          );
        },
      ),
        );

  }
}