import 'dart:convert';

import 'package:gym_management/api/models/professor.dart';
import 'package:gym_management/api/services/api_service.dart';
import 'package:http/http.dart' as http;

class ProfessorService {

  Future<List<Professor>> getAllProfessores() async {

    dynamic response = await http.get(Uri.parse('${ApiServiceUrl.baseUrl}professores'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map<Professor>((professor) => Professor.fromJson(professor)).toList();
    }

    throw Exception('Failed to load professores');
  }
}
