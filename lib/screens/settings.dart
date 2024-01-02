import 'package:flutter/material.dart';
import 'package:horse_racing_app/screens/settings/account.dart';
import 'package:horse_racing_app/screens/settings/contact.dart';
import 'package:horse_racing_app/screens/settings/faq.dart';
import 'package:horse_racing_app/screens/settings/notifications.dart';
import 'package:horse_racing_app/screens/settings/terms.dart';
import 'package:horse_racing_app/screens/settings/user.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SettingsScreen());
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
        title: Text('設定'),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          premiumMemberCard(),
          sectionHeader('ユーザー'),
          settingsOption(context, Icons.key_rounded, 'アカウント設定', Colors.grey, AccountSettingsPage()),
          settingsOption(context, Icons.person_outline, 'ユーザー設定', Colors.grey, UserSettingsPage()),
          settingsOption(context, Icons.notifications, '通知', Colors.grey, NotificationsSettingsPage()),
          sectionHeader('サポート'),
          settingsOption(context, Icons.help_outline, 'よくある質問', Colors.grey, FAQPage()),
          settingsOption(context, Icons.mail_outline, 'お問い合わせ', Colors.grey, ContactPage()),
          settingsOption(context, Icons.info_outline, '規約一覧', Colors.grey, TermsPage()),
        ],
      ),

    );
  }

  // プレミアム会員カードのウィジェット
  Widget premiumMemberCard() {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        //size
        height: 130,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[600]!, Colors.blue[900]!],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          //insert icon 
          leading: ImageIcon(AssetImage('material/icons/crown.png'), color: Colors.white, size: 30.0),
          title: Text(
            'プレミアム会員',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            'Lorem ipsum dolor sit amet consectetur. Pellentesque dui porttitor ullamcorper urna. Varius nisi at elit eu vivamus feugiat diam at in.',
            style: TextStyle(color: Colors.white70),
          ),
          trailing: Icon(Icons.chevron_right, color: Colors.white),
        ),
      ),
    );
  }

  // セクションヘッダーのウィジェット
  Widget sectionHeader(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.white,
      child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget settingsOption(BuildContext context, IconData icon, String title, Color textColor, Widget destinationPage) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title, style: TextStyle(color: textColor)),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => destinationPage));
        },
      ),
    );
  }
}
