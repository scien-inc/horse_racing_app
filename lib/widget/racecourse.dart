import 'package:flutter/material.dart';

class RacecoursePage extends StatelessWidget {
  final List<String> racecourses = [
    '東京競馬場',
    '中山競馬場',
    '京都競馬場',
    '阪神競馬場',
    '新潟競馬場',
    '福島競馬場',
    '小倉競馬場',
    '函館競馬場',
    '札幌競馬場',
    '地方',
    '欧州',
    '米国',
    'アジア',
    '中東',
    'その他',
  ];

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
          "競馬場別",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold, // 太字
          ),          
          ),
        centerTitle: true,
        toolbarHeight: 70,//textsize
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: racecourses.length,
        itemBuilder: (context, index) {
          return Container(
            height: 57.0,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    racecourses[index],
                    style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold, // 太字
                    ),  
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios, 
                    color: Colors.grey,
                    size: 10.0,
                    ),
                  onTap: () {
                    // タップされた競馬場の名前を使って新しいページに遷移
                    Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return RacecourseDetailPage(title: racecourses[index],);
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
                ),
                Container(
                  width: 361.0,  
                  height: 0.7, // Dividerの長さを変更
                  color: Colors.grey.shade300,
                ),
              ]
            )
          );
        },
      ),
    );
  }
}

class RacecourseDetailPage extends StatelessWidget {
  final String title;

  RacecourseDetailPage({required this.title});

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
        child: Text('$title の詳細ページ'),
      ),
    );
  }
}