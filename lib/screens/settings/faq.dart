import 'package:flutter/material.dart';
import 'package:horse_racing_app/widget/shared_bottom_nav_bar.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  int _currentIndex = 4; // 初期インデックスを0に設定

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // タップされたときにインデックスを更新
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント設定'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Text('アカウント設定ページ'),
      ),
      bottomNavigationBar: SharedBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,// SharedBottomNavBarにページリストを渡す
      ),
    );
  }
}
