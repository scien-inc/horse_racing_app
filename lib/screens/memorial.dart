import 'package:flutter/material.dart';
import 'package:horse_racing_app/widget/shared_bottom_nav_bar.dart';

class MemorialScreen extends StatefulWidget {
  @override
  _MemorialScreenState createState() => _MemorialScreenState();
}

class _MemorialScreenState extends State<MemorialScreen> {
  int _currentIndex = 1; // 初期インデックスを0に設定

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // タップされたときにインデックスを更新
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メモリアル'),
        toolbarHeight: 70,//textsize
        backgroundColor: Colors.white,//backgroundcolor
      ),
      body: Center(
        child: Text('Hello, World'),
      ),
      bottomNavigationBar: SharedBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,// SharedBottomNavBarにページリストを渡す
      ),
    );
  }
}
