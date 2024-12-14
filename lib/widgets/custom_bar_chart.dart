import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomBarChart extends StatelessWidget {
  final List<ChartData> chartData;
  final String header, title, value;
  final Color color;
  final bool showSubTitle;
  final bool enableZoom;

  const CustomBarChart({
    super.key,
    required this.chartData,
    required this.header,
    required this.title,
    required this.value,
    required this.color,
    required this.showSubTitle,
    this.enableZoom = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        showSubTitle
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  header,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox(),
        Expanded(
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
              majorTickLines: MajorTickLines(size: 0),
              axisLine: AxisLine(width: 0),
              labelRotation: -45,
            ),
            zoomPanBehavior: enableZoom
                ? ZoomPanBehavior(
                    enableSelectionZooming: true,
                    enableDoubleTapZooming: true,
                    enableMouseWheelZooming: true,
                    enablePinching: true,
                    zoomMode: ZoomMode.x,
                    enablePanning: true,
                  )
                : null,
            primaryYAxis: const NumericAxis(),
            series: <CartesianSeries>[
              ColumnSeries<ChartData, String>(
                width: 0.6,
                color: color,
                dataSource: chartData,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                xValueMapper: (ChartData chart, _) =>
                    "${chart.category.day}/${chart.category.month}/${chart.category.year}",
                yValueMapper: (ChartData chart, _) => chart.value,
                enableTooltip: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final DateTime category;
  final num value;

  ChartData(this.category, this.value);
}