import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('レポート'),
        toolbarHeight: 70,//textsize
        backgroundColor: Colors.white,//backgroundcolor
      ),
      body: Center(
        child: Text('Hello, World'),
      ),
    );
  }
}
