import 'dart:math';

import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:get/get.dart';

class ResumeController extends GetxController {
  var theme = TemplateTheme.modern.obs;
  var list = [
    TemplateTheme.none,
    TemplateTheme.classic,
    TemplateTheme.modern,
    TemplateTheme.technical,
    TemplateTheme.business,
  ];

  TemplateTheme getRandomItem() {
    final random = Random();
    final index = random.nextInt(5);
    theme.value = list[index];
    return list[index];
  }
}