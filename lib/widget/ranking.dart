import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  final String title;

  RankingPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              ),
            onPressed: () => Navigator.of(context).pop(),
            ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold, // 太字
          ),          
          ),
        centerTitle: true,
        toolbarHeight: 70,//textsize
        iconTheme: IconThemeData(color: Colors.white),
        ),

      body: Center(
        child: Text(
          '$titleのランキング'),
      ),
    );
  }
}