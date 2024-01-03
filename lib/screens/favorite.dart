import 'package:flutter/material.dart';
import 'package:horse_racing_app/main.dart';

class FavoritePage extends StatelessWidget{
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FavoriteScreen());
  }
}

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}
class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'お気に入り',
          style: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold, // 太字
          ), 
        ),
        toolbarHeight: 100,//textsize
        backgroundColor: Colors.white,//backgroundcolor
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Hello, World'),
      ),
    );
  }
}
