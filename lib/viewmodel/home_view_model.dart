import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/model/home_model.dart';

class HomeViewModel extends GetxController {
  var isLoading = true.obs;
  var homeModel = HomeModel(image: '',name: '',position: [], careerObjective: '', resumeUrl: '').obs;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void fetchHomeData() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          "https://gopalkrushnas063.github.io/portfolio_json/home.json"));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        homeModel(HomeModel.fromJson(jsonResponse[0]));
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Exception occurred: $e');
    } finally {
      isLoading(false);
    }
  }
}
