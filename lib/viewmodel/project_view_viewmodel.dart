import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/model/project_model.dart';


class ProjectViewModel extends GetxController {
  var projects = <ProjectModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
  }

  void fetchProjects() async {
    final response = await http.get(Uri.parse('https://gopalkrushnas063.github.io/portfolio_json/project.json'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['projects'];
      projects.value = responseData.map((data) => ProjectModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }
}
