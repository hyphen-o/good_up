import 'package:flutter/material.dart';
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



  // ページインデックス保存用
  int _screen = 0;
  // 表示する Widget の一覧
  static List<Widget> _pageList = [
    HomeScreen(),
    AlarmScreen(),
    ShopScreen(),
    SettingsScreen2()
  ];
  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home,color:Colors.black
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.access_alarm,color:Colors.black),
        label: 'Alarm',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart,color:Colors.black),
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.build,color:Colors.black),
        label: 'Settings',
      ),
    ];
  }
  void _showTutorial(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();

    //if (pref.getBool('isAlreadyFirstLaunch') != true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FlutterOverboardPage(),
          fullscreenDialog: true,
        ),
      );
      pref.setBool('isAlreadyFirstLaunch', true);
    }
  //}
  void _setUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showTutorial(context));

    return Scaffold(
      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text(
          'Good Up',
          style: TextStyle(fontSize: 16),
        ),
      ),
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