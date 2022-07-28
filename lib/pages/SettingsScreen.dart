import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SettingsScreen extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.qr_code),
        title: Text('QRコード表示'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            QrImage(
            data: 'Good_up アラーム停止',
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}