import 'package:flutter/material.dart';

int point = 50;

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('メッセージ',style:TextStyle(fontSize:40.0));
  }
}