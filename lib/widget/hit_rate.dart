import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HitRatesWidget extends StatefulWidget {
  @override
  _HitRatesWidgetState createState() => _HitRatesWidgetState();
}

class _HitRatesWidgetState extends State<HitRatesWidget> {
  int purchaseR = 11; // 購入Rの初期値
  int hitR = 5; // 的中Rの初期値

  @override
  Widget build(BuildContext context) {
    int hitRate = ((hitR / purchaseR) * 100).toInt(); // 的中率の計算、整数に変換

    return Container(
      height: 150.0, // ここでウィジェットの高さを設定
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // 3つの要素を等間隔に配置
        children: <Widget>[
          SizedBox(width: 1.0), // 左側にパディングを追加
          _buildRateColumn('購入R', purchaseR),
          _buildRateColumn('的中R', hitR),
          _buildDonutChart(hitRate), // hitRateをdoubleに変換して渡す
        ],
      ),
    );
  }
  Widget _buildRateColumn(String title, int value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.0), // タイトルと数字の間隔を調整
        Text(
          '$value',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
      
    );
  }

  Widget _buildDonutChart(int hitRate) {
    return Container(
      width: 150.0, // グラフのサイズ調整
      child: SfCircularChart(
        series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
            dataSource: [
              ChartData('的中', hitRate, Colors.green),
              ChartData('その他', 100 - hitRate, Colors.grey),
            ],
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            pointColorMapper: (ChartData data, _) => data.color,
            radius: '80%', // 内側の半径を調整
            innerRadius: '70%',
            // dataLabelSettingsを削除
          ),
        ],
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('的中率', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                  Text('$hitRate%', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color color;
}
