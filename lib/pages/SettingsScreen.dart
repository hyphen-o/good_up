import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SettingsScreen extends StatelessWidget {

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
            QrImage(
            data: 'https://www.kamo-it.org/blog/36/',
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}