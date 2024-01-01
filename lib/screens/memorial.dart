import 'package:flutter/material.dart';


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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2, // 画像を2の比率で表示
              child: Image.asset(imagePath), // 画像ファイルのパス
            ),
            Expanded(
              flex: 1, // テキストを1の比率で表示
              child:Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0), // 下左側の角を丸くする半径
                    bottomRight: Radius.circular(16.0), // 下右側の角を丸くする半径
                    ),
                    color: Color(0xF5F5F5),
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

class MemorialScreen extends StatefulWidget {
  const MemorialScreen({super.key});

  @override
  _MemorialScreenState createState() => _MemorialScreenState();
}

class _MemorialScreenState extends State<MemorialScreen> {

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

            CustomButton(
            onPressed: (){},
            labelText: "重賞展示室",
            imagePath: 'material/img/menu_item_awards.png'
            ),
          ]
        )
      ),
    );
  }
}
