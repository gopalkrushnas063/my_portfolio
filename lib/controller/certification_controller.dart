import 'package:get/get.dart';
import 'package:my_portfolio/model/certification_model.dart';
import 'package:my_portfolio/viewmodel/certification_service.dart';



class CertificationController extends GetxController {
  var certifications = <CertificationModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCertifications();
  }

  void fetchCertifications() async {
    isLoading.value = true;
    try {
      var certificationService = CertificationService();
      certifications.value = await certificationService.getCertifications();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
