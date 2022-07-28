import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int point = 50;

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("message").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.new_releases),
                  title: Text(document['notice'] + 'が購入されました！'),
                  onTap: () {
                    var result = showDialog<int>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('購入通知'),
                          content: Text('支払いが確認できました'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK!'),
                              onPressed: () => Navigator.of(context).pop(1),
                            ),

                          ],
                        );
                      },
                    );
                  }
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}