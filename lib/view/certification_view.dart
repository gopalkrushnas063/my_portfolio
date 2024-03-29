import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/controller/certification_controller.dart';

class CertificationView extends StatelessWidget {
  final CertificationController _certificationController =
      Get.put(CertificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Certifications',
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: Obx(
        () => _certificationController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _certificationController.certifications.length,
                itemBuilder: (context, index) {
                  var certification =
                      _certificationController.certifications[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.network(certification.image),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              certification.name,
                              style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('Certificate'),
                                    content: Image.network(certification.image),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                "View Certificate",
                                style: GoogleFonts.aBeeZee(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
