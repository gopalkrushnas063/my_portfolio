import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/resume_controller.dart';
import 'package:my_portfolio/data/resume_data.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Resume"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: GetBuilder<ResumeController>(
            init: ResumeController(),
            builder: (controller) {
              return FlutterResumeTemplate(
                data: data,
                templateTheme: controller.theme.value,
                mode: TemplateMode.readOnlyMode,
                showButtons: false,
                imageBoxFit: BoxFit.cover,
                // Remove the fixed height to allow flexible sizing
                // height: 2500,
              );
            },
          ),
        ),
      ),
    );
  }
}