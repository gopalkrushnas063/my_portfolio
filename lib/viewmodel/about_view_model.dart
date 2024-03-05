import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_portfolio/model/about_model.dart';


class AboutViewModel extends GetxController {
  var isLoading = true.obs;
  var aboutModel = AboutModel(
    position: '',
    name: '',
    about: '',
    dob: '',
    webUrl: '',
    degree: '',
    address: '',
    age: '',
    email: '',
    phone: '',
    github: '',
    percentageTechStack: [],
    education: [],
    experience: [],
  ).obs;

  @override
  void onInit() {
    fetchAboutData();
    super.onInit();
  }

  void fetchAboutData() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse("https://gopalkrushnas063.github.io/portfolio_json/about.json"));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        aboutModel(AboutModel.fromJson(jsonResponse[0]));
        // Call method to display pie chart
        displayPieChart(aboutModel.value.percentageTechStack);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Exception occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  // Method to display pie chart based on percentage_tech_stack data
  void displayPieChart(List<dynamic> techStackData) {
    Map<String, double> dataMap = {};
    techStackData.forEach((item) {
      dataMap[item['stack_name']] = double.parse(item['percentage']);
    });
    // Display pie chart using Get package or any other method
    // Example:
    // Get.toNamed('/pie_chart_page', arguments: dataMap);
  }
}
