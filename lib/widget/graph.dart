import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'dart:math';



class CombinedChartWidget extends StatefulWidget {
  @override
  _CombinedChartWidgetState createState() => _CombinedChartWidgetState();
}

class _CombinedChartWidgetState extends State<CombinedChartWidget> {
  late List<_ChartData> data;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    super.initState();
    data = List.generate(12, (index) {
      double income = Random().nextDouble() * 100;
      double expense = -Random().nextDouble() * 100;
      return _ChartData('${index+1}月', income, expense, income - expense);
    });

    //_tooltip = TooltipBehavior(enable: true);
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      shouldAlwaysShow: true,
      tooltipDisplayMode: TrackballDisplayMode.none,
      builder: (BuildContext context, TrackballDetails trackballDetails) {
        _ChartData chartData = data[trackballDetails.pointIndex!];
        showOverlay(context, chartData);
        return Container();
      }
    );
  }
  void showOverlay(BuildContext context, _ChartData chartData) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height / 2,
        left: MediaQuery.of(context).size.width / 4,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Text(chartData.tooltip),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(overlayEntry);

    // Hide overlay after some seconds
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, 
      height: 180, // 高さを設定
      child: SfCartesianChart(
        trackballBehavior: _trackballBehavior,
        plotAreaBorderWidth: 0, 
        primaryXAxis: CategoryAxis(
          axisLine: AxisLine(width: 0), // X軸の線を非表示
          majorGridLines: MajorGridLines(width: 0), // X軸の罫線を非表示
          majorTickLines: MajorTickLines(size: 0), // X軸のメモリを非表示
          labelStyle: TextStyle(color: Colors.transparent), // X軸のラベルを非表示に設定
        ),
        primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0), // Y軸の線を非表示
          minimum: -150,
          maximum: 150,
          interval: 10,
          majorGridLines: MajorGridLines(width: 0), // Y軸の罫線を非表示
          majorTickLines: MajorTickLines(size: 0), // Y軸のメモリを非表示
          labelStyle: TextStyle(color: Colors.transparent), // X軸のラベルを非表示に設定
          plotBands: <PlotBand>[
          PlotBand(
            isVisible: true,
            start: 0,
            end: 0,
            color: Colors.grey,
            borderWidth: 1,
          ),
        ],
        ),

        series: <CartesianSeries>[
          StackedColumnSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.income,
            name: '入金',
            color: Colors.lightBlue.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
            ), // 上部の角を丸くする
          ),
        StackedColumnSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.expense,
          name: '出金',
          color: Colors.lightGreen.withOpacity(0.6),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(3),
              bottomRight: Radius.circular(3),
            ), 
        ),
        LineSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.difference,
          name: '差額',
          color: Colors.red,
          width: 1,
          markerSettings: MarkerSettings(
            isVisible: true,
            shape: DataMarkerType.circle,
            borderWidth: 1,
            borderColor: Colors.orange,
            height: 5,
            width: 5
          ),
        ),
      ],
      ),
    );
  }
}



class _ChartData {
  _ChartData(this.x, this.income, this.expense, this.difference) :
    tooltip = '入金: ${income.toStringAsFixed(2)}\n出金: ${expense.toStringAsFixed(2)}\n差額: ${difference.toStringAsFixed(2)}';

  final String x;
  final double income;
  final double expense;
  final double difference;
  final String tooltip;
}