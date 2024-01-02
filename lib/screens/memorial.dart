import 'package:flutter/material.dart';
import 'package:horse_racing_app/widget/showroom.dart';
import 'package:horse_racing_app/widget/shared_bottom_nav_bar.dart';

class MemorialPage extends StatelessWidget{
  const MemorialPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: MemorialScreen());
  }
}


class MemorialScreen extends StatefulWidget {
  const MemorialScreen({super.key});

  @override
  _MemorialScreenState createState() => _MemorialScreenState();
}

class _MemorialScreenState extends State<MemorialScreen> {
  int _currentIndex = 1; // 初期インデックスを0に設定

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // タップされたときにインデックスを更新
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メモリアル'),
        toolbarHeight: 70,//textsize
        backgroundColor: Colors.white,//backgroundcolor
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            CustomButton(
            onPressed: (){},
            labelText: "券種別",
            imagePath: 'material/img/menu_item_tickets.png'
            ),

            SizedBox(height: 15.0),

            CustomButton(
            onPressed: (){},
            labelText: "競馬場別",
            imagePath: 'material/img/menu_item_racecourse.png'
            ),

            SizedBox(height:15.0),

            //重賞展示室への画面遷移
            CustomButton(
            onPressed: (){
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Showroom();
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    
                    final Offset begin = Offset(1.0, 0.0); // 右から左
                    // final Offset begin = Offset(-1.0, 0.0); // 左から右
                    final Offset end = Offset.zero;
                    final Animatable<Offset> tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: Curves.easeInOut));
                    final Animation<Offset> offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  transitionDuration: Duration(milliseconds: 300),
                ),
              );
            },
            labelText: "重賞展示室",
            imagePath: 'material/img/menu_item_awards.png'
            ),
          ]
        )
      ),

    );
  }
}



class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String labelText;
  final String imagePath;

  const CustomButton({super.key, required this.onPressed, required this.labelText, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width:361,
        height: 167.33,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2, // 画像を2の比率で表示
              child: Image.asset(imagePath), // 画像ファイルのパス
            ),
            Expanded(
              flex: 1, // テキストを1の比率で表示
              child:Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0), // 下左側の角を丸くする半径
                    bottomRight: Radius.circular(16.0), // 下右側の角を丸くする半径
                    ),
                    color: Color(0xFFF5F5F5)
                  ),
                width: MediaQuery.of(context).size.width,
                 //(0xFF5F5F5),
                child: Container(
                  alignment:Alignment(-0.85,0) ,
                  child:Text(
                    labelText,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold, // 太字
                    ),

                    ),
                )
                ),
            ),
          ],
        )
      ),
    );
  }
}
