import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/model/banner_model.dart';

class BannerViewModel extends GetxController {
  var isLoading = true.obs;
  var banners = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      var response = await http.get(Uri.parse('https://gopalkrushnas063.github.io/portfolio_json/banner.json'));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        banners.assignAll(jsonData.map((model) => BannerModel.fromJson(model)).toList());
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
