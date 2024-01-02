import 'package:flutter/material.dart';
import 'package:horse_racing_app/screens/report.dart';
import 'package:horse_racing_app/screens/favorite.dart';
import 'package:horse_racing_app/screens/input.dart';
import 'package:horse_racing_app/screens/memorial.dart';
import 'package:horse_racing_app/screens/settings.dart';

enum TabItem {
  report(
    title: 'レポート',
    iconPath: 'material/icons/report',
    page: ReportPage(),
  ),
  memorial(
    title: 'メモリアル',
    iconPath: 'material/icons/memorial',
    page: MemorialPage(),
  ),
  input(
    title: '収支入力',
    iconPath: 'material/icons/input',
    page: InputPage(),
  ),
  favorite(
    title: 'お気に入り',
    iconPath: 'material/icons/favorite',
    page: FavoritePage(),
  ),
  settings(
    title: '設定',
    iconPath: 'material/icons/settings',
    page: SettingsPage(),
  );

  const TabItem({
    required this.title,
    required this.iconPath,
    required this.page,
  });

  final String title;
  final String iconPath;
  final Widget page;

  // アイコンを取得するメソッド
  ImageIcon getIcon(bool isActive) {
    return ImageIcon(
      AssetImage('${this.iconPath}_${isActive ? 'true' : 'false'}.png'),
      size: 24.0,
      color: isActive ? Colors.green : Colors.black,
    );
  }
}
