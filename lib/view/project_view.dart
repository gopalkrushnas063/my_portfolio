import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/model/project_model.dart';
import 'package:my_portfolio/viewmodel/project_view_viewmodel.dart';
import 'package:my_portfolio/widgets/custom_drawer.dart';

class ProjectView extends StatelessWidget {
  final ProjectViewModel projectController = Get.put(ProjectViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      drawer: buildDrawer(context),
      body: Obx(
        () => projectController.projects.isEmpty
            ? const Center(
                child: LinearProgressIndicator(
                  color: Colors.red,
                ),
              )
            : ListView.builder(
                itemCount: projectController.projects.length,
                itemBuilder: (context, index) {
                  ProjectModel project = projectController.projects[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            child: Image.network(
                              project.image,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                project.name,
                                style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                project.description,
                                style: GoogleFonts.aBeeZee(fontSize: 14),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: project.technologies.map((tech) {
                                  Widget imageWidget;
                                  switch (tech.toLowerCase()) {
                                    case 'flutter':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/flutter.png',
                                        height: 20,
                                        width: 20,
                                      );
                                      break;
                                    case 'dart':
                                      imageWidget = Image.network(
                                        'https://github.com/gopalkrushnas063/portfolio_json/assets/103574856/1984bee5-35c8-4ddb-94ed-d056c0fb1098',
                                        height: 44,
                                        width: 44,
                                      );
                                      break;
                                    case 'html':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/html.png',
                                        height: 30,
                                        width: 30,
                                      );
                                      break;
                                    case 'css':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/css.png',
                                        height: 30,
                                        width: 50,
                                      );
                                      break;
                                    case 'android':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/android.png',
                                        height: 40,
                                        width: 50,
                                      );
                                      break;
                                    case 'firebase':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/firebase.png',
                                        height: 30,
                                        width: 50,
                                      );
                                      break;

                                    case 'mysql':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/mysql.png',
                                        height: 30,
                                        width: 50,
                                      );
                                      break;
                                    case 'intellij':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/intellij.png',
                                        height: 30,
                                        width: 50,
                                      );
                                      break;
                                    case 'javascript':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/js.png',
                                        height: 30,
                                        width: 50,
                                      );
                                      break;
                                    case 'vscode':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/vscode.png',
                                        height: 30,
                                        width: 50,
                                      );
                                      break;
                                    case 'maven':
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/maven.png',
                                        height: 30,
                                        width: 50,
                                      );
                                      break;
                                    case 'github':
                                      imageWidget = Image.network(
                                        'https://github.com/gopalkrushnas063/portfolio_json/assets/103574856/ebdada98-5714-4ab7-8ff9-60b0091ab966',
                                        height: 28,
                                        width: 45,
                                      );
                                      break;
                                    default:
                                      imageWidget = Image.network(
                                        'https://gopalkrushnas063.github.io/images/skills/java.png',
                                        height: 30,
                                        width: 50,
                                      );
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        imageWidget,
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("GitHub"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Live Link"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
