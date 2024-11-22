import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

class EvolutionChart extends StatelessWidget {
  final double width;
  final double height;
  final double maxValue;
  final double minValue;
  final int lastMonth;
  final int firstMonth;
  final String title;
  final Map<int, String> monthLabels = {
    1: 'Jan',
    2: 'Fev',
    3: 'Mar',
    4: 'Abr',
    5: 'Mai',
    6: 'Jun',
    7: 'Jul',
    8: 'Ago',
    9: 'Set',
    10: 'Out',
    11: 'Nov',
    12: 'Dez',
  };
  EvolutionChart({
    super.key,
    required this.width,
    required this.height,
    required this.maxValue,
    required this.minValue,
    required this.lastMonth,
    required this.firstMonth,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: SizedBox(
        height: height * 0.4,
        width: width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250,
                  height: 230,
                  child: LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          axisNameWidget: null,
                        ),
                        rightTitles: const AxisTitles(
                          axisNameWidget: null,
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            interval: 1,
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final int month = value.toInt();
                              if (month == firstMonth || month == lastMonth) {
                                return Text(
                                  monthLabels[month]!,
                                  style: const TextStyle(color: Colors.white),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            interval:  1,
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              if (value.round() == minValue.round() || value.round() == maxValue.round()) {
                                if (title.contains('Peso')) {
                                  return Text(
                                    '${value.round()}Kg',
                                    style: const TextStyle(color: Colors.white),
                                  );
                                }
                                if (title.contains('Percentual')) {
                                  return Text(
                                    '${value.round()}%',
                                    style: const TextStyle(color: Colors.white),
                                  );
                                }
                              }
                              return const SizedBox.shrink();
                            },
                            reservedSize: 35,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: const Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          left: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                      gridData: const FlGridData(
                        show: false,
                      ),
                      minY: minValue - 10,
                      minX: firstMonth.toDouble() - 1,
                      maxX: lastMonth.toDouble() + 1,
                      maxY: maxValue + 10,
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: false,
                          color: ColorsConst.btnLoginColor,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(show: false),
                          spots: [
                            FlSpot(firstMonth.toDouble(), maxValue),
                            FlSpot(lastMonth.toDouble(), minValue),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
