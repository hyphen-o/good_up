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

      body: Align(

        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(
            top: 50,
          ),
          width:200,
          height: 200,
          child: Text(

            '',
            textAlign: TextAlign.center
              ,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.white,
            ),

          ),
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(10, 10),
                color: Theme.of(context).scaffoldBackgroundColor,
                blurRadius: 20,
              ),
              BoxShadow(
                offset: Offset(-10, -10),
                color: Theme.of(context).scaffoldBackgroundColor,
                blurRadius: 20,
              ),
            ],
          ),
        ),
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