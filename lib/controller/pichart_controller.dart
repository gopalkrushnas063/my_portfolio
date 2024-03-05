import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';


class PieChartController extends GetxController {
  var chartType = ChartType.disc.obs;
  var showCenterText = true.obs;
  var showCenterWidget = true.obs;
  var ringStrokeWidth = 32.0.obs;
  var chartLegendSpacing = 32.0.obs;
  var showLegendsInRow = false.obs;
  var showLegends = true.obs;
  var showLegendLabel = false.obs;
  var showChartValueBackground = true.obs;
  var showChartValues = true.obs;
  var showChartValuesInPercentage = false.obs;
  var showChartValuesOutside = false.obs;
  var showGradientColors = false.obs;
  var legendShape = LegendShape.circle.obs;
  var legendPosition = LegendPosition.right.obs;

  void toggleChartType(ChartType type) {
    chartType.value = type;
  }

  void toggleLegendShape(LegendShape shape) {
    legendShape.value = shape;
  }

  void toggleLegendPosition(LegendPosition position) {
    legendPosition.value = position;
  }
}

enum LegendShape { circle, rectangle }

// enum LegendPosition { left, right, top, bottom }
