import 'package:flutter/material.dart';
import 'package:horse_racing_app/screens/report.dart';
import 'package:horse_racing_app/screens/favorite.dart';
import 'package:horse_racing_app/screens/input.dart';
import 'package:horse_racing_app/screens/memorial.dart';
import 'package:horse_racing_app/screens/settings.dart';

enum TabItem {
  home,
  timeline,
  input,
  favorite,
  settings;

  String get title {
    switch (this) {
      case TabItem.home:
        return 'レポート';
      case TabItem.timeline:
        return 'メモリアル';
      case TabItem.input:
        return '収支入力';
      case TabItem.favorite:
        return 'お気に入り';
      case TabItem.settings:
        return '設定';
    }
  }

  Widget get page {
    switch (this) {
      case TabItem.home:
        return ReportScreen();
      case TabItem.timeline:
        return MemorialScreen();
      case TabItem.input:
        return InputScreen();
      case TabItem.favorite:
        return FavoriteScreen();
      case TabItem.settings:
        return SettingsScreen();
    }
  }

  ImageIcon getIcon(int currentIndex) {
    String iconName;
    switch (this) {
      case TabItem.home:
        iconName = 'report';
        break;
      case TabItem.timeline:
        iconName = 'memorial';
        break;
      case TabItem.input:
        iconName = 'input';
        break;
      case TabItem.favorite:
        iconName = 'favorite';
        break;
      case TabItem.settings:
        iconName = 'settings';
        break;
    }
    return ImageIcon(
      AssetImage('material/icons/${iconName}_${currentIndex == TabItem.values.indexOf(this) ? 'true' : 'false'}.png'),
      size: 24.0,
    );
  }
}
