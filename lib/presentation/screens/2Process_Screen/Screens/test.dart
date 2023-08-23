// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Chart Example'),
      ),
      body: Center(
        child: SfCircularChart(
          series: <CircularSeries>[
            // Add the series to the chart
            DoughnutSeries<ChartData, String>(
              dataSource: <ChartData>[
                ChartData('A', 25),
                ChartData('B', 30),
                ChartData('C', 20),
                ChartData('D', 15),
                ChartData('E', 10),
              ],
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            ),
          ],
        ),
      ),
    );
  }

  Map<int, TableColumnWidth> _getColumnWidths() {
    return {
      0: FixedColumnWidth(100.0), // Customize the width of column 0
      1: FixedColumnWidth(150.0), // Customize the width of column 1
      2: FixedColumnWidth(120.0), // Customize the width of column 2
      // Add more entries for additional columns
    };
  }
}

// Create a data model class for chart data
class ChartData {
  ChartData(this.x, this.y, {this.color});

  final String x;
  final double y;
  final Color? color;
}
