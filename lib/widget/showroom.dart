import 'package:flutter/material.dart';
import 'package:horse_racing_app/widget/ranking.dart';


class Showroom extends StatefulWidget {
  const Showroom({super.key});

  @override
  _ShowroomState createState() => _ShowroomState();
}

class _ShowroomState extends State<Showroom> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
        ),
        
        
        title: const Text(
          '重賞展示室',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold, // 太字
          ),          
          ),
        centerTitle: true,
        toolbarHeight: 70,//textsize
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,//backgroundcolor
      ),

      backgroundColor: Colors.black,

      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 列数
            crossAxisSpacing: 8.0, // 列間のスペース
            mainAxisSpacing: 14.0, // 行間のスペース
          ),
          itemCount: awards.length,
          itemBuilder: (context, index) {
            return GridItem(award: awards[index]);
          },
        )
      
    );
  }
}



class Award {
  final String name;
  final int record;
  //String imagePath = 'material/icon/trophy.png' ;

  Award({required this.name, required this.record});
}

List<Award> awards =[
  Award(name: 'フェブラリーS', record: 2),
  Award(name: '高松宮記念', record: 1),
  Award(name: '大阪杯', record: 4),
  Award(name: '桜花賞', record: 3),
  Award(name: '皐月賞', record: 4),
  Award(name: '天皇賞（春）', record: 3),
  Award(name: 'NHKマイルC', record: 2),
  Award(name: 'ヴィクトリアマイル', record: 3),
  Award(name: 'オークス', record: 0),
  Award(name: '日本ダービー', record: 1),
  Award(name: '秋華賞', record: 0),
  Award(name: '菊花賞', record: 4),
  Award(name: '天皇賞（秋）', record: 4),
  Award(name: 'エリザベス女王杯', record: 4),
  Award(name: 'マイルCS', record: 1),
  Award(name: 'ジャパンC', record: 2),
  Award(name: 'チャンピオンズC', record: 0),
  Award(name: '阪神JF', record: 0),
  Award(name: '朝日杯FS', record: 2),
  Award(name: '有馬記念', record: 3),
  Award(name: 'ホープフルS', record: 0),
  Award(name: '中山GJ', record: 4),
  Award(name: '中山大障害', record: 4),
  
];

class GridItem extends StatelessWidget {
  final Award award;

  GridItem({required this.award});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return RankingPage(title: award.name,);
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
                  transitionDuration: Duration(milliseconds: 250),
                ),
              );
            },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'material/img/trophy.png',
              height: 70,

            ),
            SizedBox(height: 8.0),
            Text(award.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.0
                )),
            Text('${award.record.toString()}レコード' ,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0
                )),
          ],
        ),
      )
    );
  }
}