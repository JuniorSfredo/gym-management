import 'dart:convert';

import 'package:gym_management/domain/models/aluno.dart';
import 'package:gym_management/domain/services/api_service.dart';
import 'package:http/http.dart' as http;

class AlunoService {

    Future<Aluno> fetchAlunoById(int id) async {
    final response = await http.get(Uri.parse('${ApiServiceUrl.baseUrl}alunos/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return Aluno.fromJSON(jsonResponse);
    } else {
      throw Exception('Failed to load aluno');
    }
  }
}
