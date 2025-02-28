import 'package:gym_management/domain/models/references/aluno_reference.dart';
import 'package:gym_management/domain/models/references/plano_reference.dart';

class Mensalidade {

  int id;
  String dataVencimento;
  String statusPagamento;
  PlanoReference plano;
  AlunoReference aluno;

  Mensalidade(
    this.id, 
    this.dataVencimento, 
    this.statusPagamento, 
    this.plano, 
    this.aluno
  );

  factory Mensalidade.fromJson(Map<String, dynamic> json) {
    return Mensalidade(
      json['id'],
      json['dataVencimento'],
      json['statusPagamento'],
      PlanoReference.fromJson(json['plano']),
      AlunoReference.fromJson(json['aluno'])
    );
  }
}
