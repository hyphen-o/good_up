import 'package:flutter/material.dart';
import 'MessageScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PointScreen extends StatelessWidget {
  PointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("money").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Card(
                child: ListTile(

                  leading: Icon(Icons.monetization_on_outlined),
                  title: Text('             ポイント：　' + document['wallet']),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Future<String> Wallet() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('money').doc('money').get();
    String wallet = snapshot['wallet'];
    print(wallet);
    return Future<String>.value(wallet);
  }
}