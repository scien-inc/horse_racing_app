import 'package:flutter/material.dart';
import 'package:horse_racing_app/widget/showroom.dart';

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
              _buildIconWithLabel('material/icons/calendar_blank.png', '期間別', context, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Showroom()));
              }),
              _buildIconWithLabel('material/icons/sneaker_move.png', 'コース別', context, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Showroom()));
              }),
              _buildIconWithLabel('material/icons/horse.png', '競馬場別', context, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Showroom()));
              }),
              _buildIconWithLabel('material/icons/ticket.png', '券種別', context, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Showroom()));
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithLabel(String imagePath, String label, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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
