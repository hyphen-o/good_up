import 'package:flutter/material.dart';
import 'MessageScreen.dart';

class PointScreen extends StatelessWidget {
  PointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("ただいま\n $point ポイント",style:TextStyle(fontSize:40.0));
  }
}