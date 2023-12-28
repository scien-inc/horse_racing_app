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
    MemorialScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('material/icons/report_false.png'), size: 24.0,), label: 'Report'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('material/icons/memorial_false.png'), size: 24.0,), label: 'Memorial'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('material/icons/input_false.png'), size: 24.0,), label: 'Input'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('material/icons/favorite_false.png'), size: 24.0,), label: 'Favorite'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('material/icons/settings_false.png'), size: 24.0,), label: 'Settings'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
