import 'package:flutter/material.dart';
import 'package:horse_racing_app/widget/shared_bottom_nav_bar.dart';
import 'package:horse_racing_app/main.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}
class _FavoriteScreenState extends State<FavoriteScreen> {
  int _currentIndex = 3; // 初期インデックスを0に設定

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // タップされたときにインデックスを更新
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('お気に入り'),
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
