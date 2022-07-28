import 'package:flutter/material.dart';
import 'MessageScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PointScreen extends StatelessWidget {
  PointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Text("ただいま\n $point ポイント",style:TextStyle(fontSize:40.0));
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("message").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
            return Column(
          );
        },
      ),
    );
  }
}