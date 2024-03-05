import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/model/tech_skill_model.dart';
import 'package:my_portfolio/viewmodel/tech_skill_viewmodel.dart';




class TechSkillView extends StatelessWidget {
  final TechSkillViewModel _controller = Get.put(TechSkillViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tech Skills'),
        elevation: 0,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey[200],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemCount: _controller.techSkills.length,
              itemBuilder: (context, index) {
                TechSkillModel skill = _controller.techSkills[index];
                return Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          child: skill.imageUrl.endsWith('.svg')
                              ? SvgPicture.network(
                                  skill.imageUrl,
                                  height: 70,
                                  fit: BoxFit.fitWidth,
                                )
                              : Image.network(
                                  skill.imageUrl,
                                  height: 70,
                                  fit: BoxFit.fitWidth,
                                ),
                        ),
                        // SizedBox(height: 8),
                        // Text(
                        //   skill.title,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 8,
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        //   textAlign: TextAlign.center,
                        // ),
                        // SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
