import 'dart:convert';

import 'package:gym_management/api/models/avaliacao_request.dart';
import 'package:gym_management/api/models/simplefied/avaliacao_simplefied.dart';
import 'package:gym_management/api/services/api_service.dart';
import 'package:http/http.dart' as http;

class AvaliacaoService {

  Future<List<AvaliacaoSimplefied>> getUltimasAvaliacoes() async {
    final response = await http.get(Uri.parse('${ApiServiceUrl.baseUrl}avaliacoes/alunos/1'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map<AvaliacaoSimplefied>((avaliacao) => AvaliacaoSimplefied.fromJSON(avaliacao)).toList();
    } else {
      throw Exception('Failed to load avaliacoes');
    }
  }

  Future<List<AvaliacaoSimplefied>> getAllAvaliacoesByAlunoId(int id) async {
    
    final response = await http.get(Uri.parse('${ApiServiceUrl.baseUrl}avaliacoes/alunos/$id/detalhes'));
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map<AvaliacaoSimplefied>((avaliacao) => AvaliacaoSimplefied.fromJSON(avaliacao)).toList();
    } else {
      throw Exception('Failed to load avaliacoes');
    }
  }

  Future<AvaliacaoSimplefied> getAvaliacaoById(int id) async {
    final response = await http.get(Uri.parse('${ApiServiceUrl.baseUrl}avaliacoes/$id'));
    if (response.statusCode == 200) {
      print(response.body);
      return AvaliacaoSimplefied.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load avaliacao');
    }
  }

  Future<void> requestAvaliacao (AvaliacaoRequest request) async {
    final response = await http.post(
      Uri.parse('${ApiServiceUrl.baseUrl}avaliacoes/requisitar-avaliacao'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to request avaliacao');
    }
  }
}
