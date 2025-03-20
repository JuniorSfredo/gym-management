import 'package:gym_management/api/models/references/aluno_reference.dart';
import 'package:gym_management/api/models/references/dobra_cutanea_reference.dart';
import 'package:gym_management/api/models/references/professor_reference.dart';

class AvaliacaoSimplefied {

  int id;
  DateTime data;
  double peso;
  double percentualDeGordura;
  double imc;
  String observacao;
  AlunoReference aluno;
  ProfessorReference professor;
  List<DobraCutaneaReference> dobrasCutaneas;

  AvaliacaoSimplefied(this.id, this.data, this.peso, this.percentualDeGordura, this.imc,
      this.observacao, this.aluno, this.professor, this.dobrasCutaneas);

  factory AvaliacaoSimplefied.fromJSON(Map<String, dynamic> json) {
    return AvaliacaoSimplefied(
      json['id'],
      DateTime.parse(json['data']),
      json['peso'],
      json['percentualDeGordura'],
      json['imc'],
      json['observacao'],
      AlunoReference.fromJson(json['aluno']),
      ProfessorReference.fromJSON(json['professor']),
      (json['dobrasCutaneas'] as List).map((dobra) => DobraCutaneaReference.fromJSON(dobra)).toList(),
    );
  }
}
