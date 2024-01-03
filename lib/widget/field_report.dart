import 'package:flutter/material.dart';
import 'package:horse_racing_app/widget/racecourse.dart';

class FieldwiseReportWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('分野別レポート', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildIconWithLabel('material/icons/calendar_blank.png', '期間別',context, (ctx) => RacecoursePage()),
              _buildIconWithLabel('material/icons/sneaker_move.png', 'コース別', context, (ctx) => RacecoursePage()),
              _buildIconWithLabel('material/icons/horse.png', '競馬場別', context, (ctx) => RacecoursePage()),
              _buildIconWithLabel('material/icons/ticket.png', '券種別', context, (ctx) => RacecoursePage()),
            ],
          ),
        ],
      ),
    );
  }

Widget _buildIconWithLabel(String imagePath, String label, BuildContext context, WidgetBuilder pageBuilder) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => pageBuilder(context),
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
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Image.asset(imagePath, width: 30.0, height: 30.0),
          ),
          SizedBox(height: 8.0),
          Text(label, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
}
