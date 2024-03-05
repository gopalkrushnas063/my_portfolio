import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/pichart_controller.dart';
import 'package:pie_chart/pie_chart.dart';

class SettingsWidget extends StatelessWidget {
  final PieChartController pieChartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.only(bottom: 5.0),
        child: Column(
          children: [
            Obx(
              () => SwitchListTile(
                value: pieChartController.showGradientColors.value,
                title: const Text("Show Gradient Colors"),
                onChanged: (val) {
                  pieChartController.showGradientColors.value = val;
                },
              ),
            ),
           
            ListTile(
              title: const Text("Chart Type"),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<ChartType>(
                  value: pieChartController.chartType.value,
                  items: const [
                    DropdownMenuItem(
                      value: ChartType.disc,
                      child: Text("Disc"),
                    ),
                    DropdownMenuItem(
                      value: ChartType.ring,
                      child: Text("Ring"),
                    ),
                  ],
                  onChanged: (val) {
                    pieChartController.toggleChartType(val!);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
