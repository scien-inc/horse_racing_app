import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:horse_racing_app/widget/shared_bottom_nav_bar.dart';

class ReportPage extends StatelessWidget{
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ReportScreen());
  }
}


class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}
class _ReportScreenState extends State<ReportScreen> {
  int _currentIndex = 0; // 初期インデックスを0に設定

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // タップされたときにインデックスを更新
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('レポート'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView( // Changed from Column to ListView
          children: [
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  // Assuming data and styling
                ),
              ),
            ),
            SizedBox(height: 20),
            // Placeholder for the financial summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSummaryItem('収入', '¥550,008'),
                _buildSummaryItem('出費', '-¥788,162'),
                _buildSummaryItem('純益', '¥238,154'),
              ],
            ),
            SizedBox(height: 20),
            // Placeholder for the percentage indicator
            Container(
              height: 100,
              child: Center(child: Text('1,200%')), // Example percentage
            ),
            SizedBox(height: 20),
            // Placeholder for the pie chart
            Container(
              height: 200,
              child: PieChart(
                PieChartData(
                  // Assuming data and styling, not a real implementation
                ),
              ),
            ),
            SizedBox(height: 20),
            // Placeholder for other summary items
            _buildSummaryItem('開人金額', '¥10,000'),
            _buildSummaryItem('担い保し金額', '¥120,000'),
            SizedBox(height: 20),
            // Placeholder for the bottom summary
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSummaryItem('開人R', '11'),
                  _buildSummaryItem('的中R', '5'),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildSummaryItem(String title, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}