import 'package:gym_management/api/models/aluno_id.dart';
import 'package:gym_management/api/models/professor_id.dart';

class AvaliacaoRequest {

  String data;
  ProfessorId professor;
  AlunoId aluno;

  AvaliacaoRequest(this.data, this.professor, this.aluno);

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'professor': professor.toJson(),
      'aluno': aluno.toJson(),
    };
  }
  
}
