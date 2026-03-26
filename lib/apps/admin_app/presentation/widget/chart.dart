import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class OverviewChart extends StatelessWidget {
  const OverviewChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(show: true),

        borderData: FlBorderData(show: false),

        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            gradient: const LinearGradient(
              colors: [Colors.blue, AppTheme.color],
            ),
            barWidth: 4,
            dotData: FlDotData(show: false),

            color: Colors.blue,

            spots: const [
              FlSpot(0, 10),
              FlSpot(1, 30),
              FlSpot(2, 20),
              FlSpot(3, 50),
              FlSpot(4, 40),
              FlSpot(5, 60),
            ],
          ),
        ],
      ),
    );
  }
}



class RowBlockGraph extends StatelessWidget {
  final List<int> data; // values 0–100

  const RowBlockGraph({super.key, required this.data});

  Color getColor(int value) {
    if (value > 80) return AppTheme.color;
    if (value > 50) return const Color.fromARGB(255, 0, 255, 255);
    return const Color.fromARGB(255, 134, 134, 134);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: data.map((value) {
        return Expanded(
          child: Container(
            height: value.toDouble(),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: getColor(value),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }).toList(),
    );
  }
}
