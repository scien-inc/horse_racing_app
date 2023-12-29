import 'package:flutter/material.dart';
import 'package:horse_racing_app/screens/report.dart';
import 'package:horse_racing_app/screens/favorite.dart';
import 'package:horse_racing_app/screens/input.dart';
import 'package:horse_racing_app/screens/memorial.dart';
import 'package:horse_racing_app/screens/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  int _currentIndex = 0;
  final _pages = [
    ReportScreen(),
    MemorialScreen(),
    InputScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? ImageIcon(AssetImage('material/icons/report_true.png'), size: 24.0)
                : ImageIcon(AssetImage('material/icons/report_false.png'), size: 24.0),
            label: 'レポート',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? ImageIcon(AssetImage('material/icons/memorial_true.png'), size: 24.0)
                : ImageIcon(AssetImage('material/icons/memorial_false.png'), size: 24.0),
            label: 'メモリアル',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? ImageIcon(AssetImage('material/icons/input_true.png'), size: 24.0)
                : ImageIcon(AssetImage('material/icons/input_false.png'), size: 24.0),
            label: '収支入力',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? ImageIcon(AssetImage('material/icons/favorite_true.png'), size: 24.0)
                : ImageIcon(AssetImage('material/icons/favorite_false.png'), size: 24.0),
            label: 'お気に入り',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? ImageIcon(AssetImage('material/icons/settings_true.png'), size: 24.0)
                : ImageIcon(AssetImage('material/icons/settings_false.png'), size: 24.0),
            label: '設定',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
