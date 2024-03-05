import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/dat_controller.dart';
import 'package:my_portfolio/controller/pichart_controller.dart';
import 'package:pie_chart/pie_chart.dart';


class PieChartWidget extends StatelessWidget {
  final PieChartController pieChartController = Get.find();
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PieChart(
        // ignore: invalid_use_of_protected_member
        dataMap: Get.find<DataController>().dataMap.value,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: pieChartController.chartLegendSpacing.value,
        chartRadius: math.min(MediaQuery.of(context).size.width / 2.5, 200),
        colorList: Get.find<DataController>().colorList,
        initialAngleInDegree: 0,
        chartType: pieChartController.chartType.value,
        centerText: pieChartController.showCenterText.value ? "" : null,
        centerWidget: pieChartController.showCenterWidget.value
            ? Container(child: const Text(""))
            : null,
        legendLabels: pieChartController.showLegendLabel.value
    // ignore: invalid_use_of_protected_member
    ? Map<String, String>.from(Get.find<DataController>().dataMap.value.map(
        (key, value) => MapEntry(key, value.toString())))
    : {},

        legendOptions: LegendOptions(
          showLegendsInRow: pieChartController.showLegendsInRow.value,
          legendPosition: pieChartController.legendPosition.value,
          showLegends: pieChartController.showLegends.value,
          legendShape: pieChartController.legendShape.value == LegendShape.circle
              ? BoxShape.circle
              : BoxShape.rectangle,
          legendTextStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: pieChartController.showChartValueBackground.value,
          showChartValues: pieChartController.showChartValues.value,
          showChartValuesInPercentage: pieChartController.showChartValuesInPercentage.value,
          showChartValuesOutside: pieChartController.showChartValuesOutside.value,
        ),
        ringStrokeWidth: pieChartController.ringStrokeWidth.value,
        emptyColor: Colors.grey,
        gradientList: pieChartController.showGradientColors.value
            ? Get.find<DataController>().gradientList
            : null,
        emptyColorGradient: const [
          Color(0xff6c5ce7),
          Colors.blue,
        ],
        baseChartColor: Colors.transparent,
      ),
    );
  }
}
