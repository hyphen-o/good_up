import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: const Text(
            'Settings',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(child: Icon(Icons.home)));
  }
}