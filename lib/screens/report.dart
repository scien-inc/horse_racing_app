import 'package:flutter/material.dart';
import 'package:horse_racing_app/widget/input_screen.dart';

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
  String selectedYear = '2023'; // 初期選択年

  @override
  Widget build(BuildContext context) {
    List<String> years = List<String>.generate(
      2100 - 2023 + 1,
      (index) => (2023 + index).toString(),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: buildDropdownField(
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
      ),
    );
  }
}
