import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/model/tech_skill_model.dart';


class TechSkillViewModel extends GetxController {
   var isLoading = true.obs;
  var techSkills = <TechSkillModel>[].obs;

  @override
  void onInit() {
    fetchSoftSkills();
    super.onInit();
  }

  void fetchSoftSkills() async {
    try {
      final response = await http.get(Uri.parse('https://gopalkrushnas063.github.io/portfolio_json/tech_skill.json'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        techSkills.assignAll(jsonData.map((data) => TechSkillModel.fromJson(data)).toList());
      } else {
        throw Exception('Failed to load soft skills');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
