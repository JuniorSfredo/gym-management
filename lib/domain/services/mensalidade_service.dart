import 'dart:convert';

import 'package:gym_management/domain/models/Mensalidade.dart';
import 'package:gym_management/domain/models/mensalidade_id.dart';
import 'package:gym_management/domain/services/api_service.dart';
import 'package:http/http.dart' as http;

class MensalidadeService {

  Future<List<Mensalidade>> getMensalidadesByAlunoId(int alunoId) async {
    final dynamic response = await http.get(Uri.parse('${ApiServiceUrl.baseUrl}mensalidades/alunos/$alunoId'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map<Mensalidade>((mensalidade) => Mensalidade.fromJson(mensalidade)).toList();
    } else {
      throw Exception('Failed to load mensalidades');
    }
  }

  Future<Mensalidade> getMensalidadeById(int id) async {
    final dynamic response = await http.get(Uri.parse('${ApiServiceUrl.baseUrl}mensalidades/$id'));
    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      return Mensalidade.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load mensalidade');
    }
  }

  Future<MensalidadeId> pagarMensalidade(int id) async {
    final dynamic response = await http.post(Uri.parse('${ApiServiceUrl.baseUrl}mensalidades/$id/pagar'));
    if (response.statusCode == 200) {
      dynamic jsonResponse = jsonDecode(response.body);
      return MensalidadeId.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to pay mensalidade');
    }
  }
}
