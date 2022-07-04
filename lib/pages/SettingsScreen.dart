import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  var _count = 0;

  void _counter() {
      _count = _count + 1;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsScreen'),
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("ボタンを押すとカウントアップします。"),
            FloatingActionButton(
              onPressed: _counter,
              tooltip: 'Increment',
              child: Icon(Icons.qr_code),
            ),
            Text('$_count'),
          ],
        ),
      ),
    );
  }
}