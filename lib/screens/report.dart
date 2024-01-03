import 'package:flutter/material.dart';
import 'package:horse_racing_app/widget/input_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:horse_racing_app/widget/graph.dart';
import 'package:horse_racing_app/widget/finantial.dart';
import 'package:horse_racing_app/widget/hit_rate.dart';
import 'package:horse_racing_app/widget/field_report.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReportScreen(),
    );
  }
}

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String selectedYear = '${DateTime.now().year}年'; // 現在の年を初期選択年に設定

  @override
Widget build(BuildContext context) {
  // 現在の年から未来の年までをリストに追加し、「年」を付加
  List<String> years = List<String>.generate(
    2100 - DateTime.now().year + 1,
    (index) => '${DateTime.now().year + index}年',
  );

  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'レポート',
        style: TextStyle(
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      toolbarHeight: 100,
      backgroundColor: Colors.white,
    ),
    backgroundColor: Colors.white,
    body: SingleChildScrollView( // SingleChildScrollViewを追加
      child: Padding(
        padding: EdgeInsets.only(left: 1, top: 10, right: 10, bottom: 0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 150, // プルダウンフィールドの幅を調整
                child: InputOverlayUtils.buildDropdownField(
                  years,
                  selectedYear,
                  (newValue) {
                    setState(() {
                      selectedYear = newValue!;
                    });
                  },
                  borderRadius: 10.0, // 任意の角丸設定
                ),
              ),
            ),
            CombinedChartWidget(), // Expanded ウィジェットを削除
            //SizedBox(height: 1.0), 
            FinancialSummaryWidget(),
            HitRatesWidget(),
            FieldwiseReportWidget(),
          ],
        ),
      ),
    ),
  );
}
}