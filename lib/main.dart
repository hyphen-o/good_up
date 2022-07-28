import 'package:flutter/material.dart';
import 'dart:async';
import 'package:good_monning/pages/FlutterOverboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/HomeScreen.dart';
import './pages/ShopScreen.dart';
import './pages/AlarmScreen.dart';
import './pages/SettingsScreen.dart';
import './pages/SettingsScreen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Good Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool child = false;
  // ページインデックス保存用
  int _screen = 0;
  // 表示する Widget の一覧
  static List<Widget> _pageList = [
    HomeScreen(),
    AlarmScreen(),
    ShopScreen(),
  ];
  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home,color:Colors.lightGreen
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.access_alarm,color:Colors.lightGreen),
        label: 'Alarm',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart,color:Colors.lightGreen),
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.qr_code,color:Colors.lightGreen),
        label: 'QR',
      ),
    ];
  }
  void _showTutorial(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();

    if (pref.getBool('isAlreadyFirstLaunch') != true) {
      pref.setBool('isAlreadyFirstLaunch', true);
      _showSimpleDialog();
    }
  }
  void _setUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  Future _showSimpleDialog() async{
    String result = "";
    result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('あなたはどっち？'),
          children: <Widget>[
            SimpleDialogOption(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange.shade200,
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
                title: Text('子'),
              ),
              onPressed: () {
                Navigator.pop(context);
                child = true;
                _pageList.add(SettingsScreen2());
              },
            ),
            SimpleDialogOption(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade400,
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
                title: Text('親'),
              ),
              onPressed: () {
                Navigator.pop(context);
                _pageList.add(SettingsScreen());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showTutorial(context));

    return Scaffold(
      // ページビュー
      body: _pageList[_screen],
      // ページ下部のナビゲーションメニュー
      bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),
    );
  }
}