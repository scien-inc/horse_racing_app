import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
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
      body: ListView(
        children: <Widget>[
          SettingItem(title: '表示名', defaultValue: 'ゴールドシップ侍'),
          SettingItem(title: 'メールアドレス', defaultValue: 'goldshipsamurai@gmail.com'),
          SettingItem(title: 'パスワード', defaultValue: '変更する'),
          SettingItem(title: '電話番号', defaultValue: '追加する'),
        ],
      ),
      
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final String defaultValue;

  SettingItem({required this.title, required this.defaultValue});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0),),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(defaultValue, textAlign: TextAlign.right),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}