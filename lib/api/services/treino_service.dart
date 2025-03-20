import 'dart:convert';
import 'package:gym_management/api/models/treino.dart';
import 'package:gym_management/api/services/api_service.dart';
import 'package:http/http.dart' as http;

class TreinoService {
  
  Future<List<Treino>> getTreinosByAlunoId(int alunoId) async {

    final response = await http.get(Uri.parse("${ApiServiceUrl.baseUrl}alunos/$alunoId/treinos"));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse.map((e) => Treino.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load treinos');
    }
  }

  Future<Treino> getTreinoById(int treinoId, int alunoId) async {
    final response = await http.get(Uri.parse("${ApiServiceUrl.baseUrl}alunos/$alunoId/treinos/$treinoId"));
    if (response.statusCode == 200) {
      return Treino.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load treino');
    }
  }
}
