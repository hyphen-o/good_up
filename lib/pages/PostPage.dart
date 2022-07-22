import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostPage extends StatefulWidget {

  @override
  _PostPagePageState createState() => _PostPagePageState();
}



class _PostPagePageState extends State<PostPage> {
  late String ItemName;
  late String Money;

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("出品画面"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _textEditingController,
            onChanged: (text) {
              ItemName = text;
            },
            enabled: true,
            maxLength: 50, // 入力数
            style: TextStyle(color: Colors.black),
            obscureText: false,
            maxLines:1 ,
            decoration: const InputDecoration(
              icon: Icon(Icons.speaker_notes),
              hintText: '投稿内容を記載します',
              labelText: 'ごほうび * ',
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: _textEditingController2,
            onChanged: (text) {
              Money = text;
            },
            enabled: true,
            maxLength: 5, // 入力数
            style: TextStyle(color: Colors.black),
            obscureText: false,
            maxLines:1 ,
            decoration: const InputDecoration(
              icon: Icon(Icons.money),
              hintText: '投稿内容を記載します',
              labelText: '値段 * ',
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            label: const Text('出品'),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              CollectionReference posts = FirebaseFirestore.instance.collection('posts');
              posts.add({
                "content": ItemName,
                "money": Money
              });
              _textEditingController.clear();
              _textEditingController2.clear();
            },
          ),
        ]
      ),
    );
  }

  void _onSubmitted(String content) {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    posts.add({
      "content": content
    });

    /// 入力欄をクリアにする
    _textEditingController.clear();
  }
  void _onSubmitted2(String money) {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    posts.add({
      "money": money
    });

    /// 入力欄をクリアにする
    _textEditingController2.clear();
  }
}