import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/model/certification_model.dart';

class CertificationService {
  Future<List<CertificationModel>> getCertifications() async {
    final response = await http.get(Uri.parse('https://gopalkrushnas063.github.io/portfolio_json/certificate.json'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['certifications'];
      return jsonList.map((json) => CertificationModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load certifications');
    }
  }
}
