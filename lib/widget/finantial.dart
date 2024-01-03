import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinancialSummaryWidget extends StatefulWidget {
  @override
  _FinancialSummaryWidgetState createState() => _FinancialSummaryWidgetState();
}

class _FinancialSummaryWidgetState extends State<FinancialSummaryWidget> {
  int purchaseAmount = 10000;
  int refundAmount = 120000;
  // 収支を払い戻し金額 - 購入金額で計算
  int get balance => refundAmount - purchaseAmount;

  int get recoveryRate => purchaseAmount != 0 ? ((refundAmount / purchaseAmount) * 100).toInt() : 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        _buildRecoveryRateItemNoBackground('material/icons/percent.png', '回収率', recoveryRate), // コンテナの外に配置
        SizedBox(height: 20.0),
        Container(
          width: screenWidth * 0.9,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              
              _buildFinancialItem('material/icons/coins.png', '購入金額', '¥', purchaseAmount),
              SizedBox(height: 20.0),
              _buildFinancialItem('material/icons/hand_coins.png', '払い戻し金額', '¥', refundAmount),
              SizedBox(height: 20.0),
              _buildFinancialItem('material/icons/plus_minus.png', '収支', balance >= 0 ? '+ ¥' : '- ¥', balance.abs(), textColor: balance >= 0 ? Colors.green : Colors.red),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialItem(String imagePath, String label, String suffix, int amount, {Color textColor = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 19.0),
            Image.asset(imagePath, width: 24.0, height: 24.0),
            SizedBox(width: 10.0),
            Text(label, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          ],
        ),
        Text(
          suffix + NumberFormat('#,###').format(amount),
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: textColor),
        ),
      ],
    );
  }

  Widget _buildRecoveryRateItem(String imagePath, String label, double rate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 19.0),
            Image.asset(imagePath, width: 24.0, height: 24.0),
            SizedBox(width: 10.0),
            Text(label, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          ],
        ),
        Text(
          NumberFormat('#,##0.0').format(rate) + ' %',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRecoveryRateItemNoBackground(String imagePath, String label, int rate) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        children: <Widget>[
          SizedBox(width: 54.0),
          Image.asset(imagePath, width: 24.0, height: 24.0),
          SizedBox(width: 10.0),
          Text(label, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        ],
      ),
      Text(
        NumberFormat('#,##0.0').format(rate) + ' %',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    ],
  );
}

}