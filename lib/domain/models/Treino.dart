import 'package:gym_management/domain/models/Exercicio.dart';
import 'package:gym_management/domain/models/references/aluno_reference.dart';
import 'package:gym_management/domain/models/references/professor_reference.dart';

class Treino {

  int id;
  String nome;
  AlunoReference aluno;
  ProfessorReference professor;
  List<Exercicio> exercicios;

  Treino(
    this.id, 
    this.nome, 
    this.aluno, 
    this.professor, 
    this.exercicios
  );

  factory Treino.fromJson(Map<String, dynamic> json) {
    return Treino(
      json['id'],
      json['nome'],
      AlunoReference.fromJSON(json['aluno']),
      ProfessorReference.fromJSON(json['professor']),
      (json['exercicios'] as List).map((e) => Exercicio.fromJSON(e)).toList()
    );
  }
}
