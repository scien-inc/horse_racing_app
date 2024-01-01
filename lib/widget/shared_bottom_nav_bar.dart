import 'package:flutter/material.dart';
import 'package:horse_racing_app/screens/report.dart';
import 'package:horse_racing_app/screens/favorite.dart';
import 'package:horse_racing_app/screens/input.dart';
import 'package:horse_racing_app/screens/memorial.dart';
import 'package:horse_racing_app/screens/settings.dart';

class SharedBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  SharedBottomNavBar({required this.currentIndex, required this.onTap});

  final _pages = [
    ReportScreen(),
    MemorialScreen(),
    InputScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('material/icons/report_${currentIndex == 0 ? 'true' : 'false'}.png'), size: 24.0),
          label: 'レポート',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('material/icons/memorial_${currentIndex == 1 ? 'true' : 'false'}.png'), size: 24.0),
          label: 'メモリアル',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('material/icons/input_${currentIndex == 2 ? 'true' : 'false'}.png'), size: 24.0),
          label: '収支入力',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('material/icons/favorite_${currentIndex == 3 ? 'true' : 'false'}.png'), size: 24.0),
          label: 'お気に入り',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('material/icons/settings_${currentIndex == 4 ? 'true' : 'false'}.png'), size: 24.0),
          label: '設定',
        ),
        // ...他のアイテムも同様に定義
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index); // インデックスを更新するためのコールバックを呼び出す
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => _pages[index]),
          (Route<dynamic> route) => false,
        ); // 新しいページに遷移
      },
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
    );
  }
}
