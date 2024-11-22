import 'dart:convert';

import 'package:gym_management/domain/models/simplefied/avaliacao_simplefied.dart';
import 'package:gym_management/domain/services/api_service.dart';
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
}
