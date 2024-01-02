import 'package:flutter/material.dart';
import 'package:horse_racing_app/screens/report.dart';
import 'package:horse_racing_app/screens/favorite.dart';
import 'package:horse_racing_app/screens/input.dart';
import 'package:horse_racing_app/screens/memorial.dart';
import 'package:horse_racing_app/screens/settings.dart';

enum TabItem {
  report(
    title: 'レポート',
    icon: Icons.leaderboard,
    page: ReportPage(),
  ),

  memorial(
    title: 'メモリアル',
    icon: Icons.emoji_events,
    page: MemorialPage(),
  ),

  input(
    title: '収支入力',
    icon: Icons.add_circle_outline,
    page: InputPage(),
  ),

  favorite(
    title: 'お気に入り',
  icon: Icons.grade,
    page: FavoritePage(),
  ),

  settings(
    title: '設定',
    icon: Icons.settings,
    page: SettingsPage(),
  );


  const TabItem({
    required this.title,
    required this.icon,
    required this.page,
  });

  /// タイトル
  final String title;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}