import 'package:gym_management/api/models/pessoa.dart';

class Aluno extends Pessoa {

  Aluno(super.id, super.nome, super.cpf, super.altura, super.peso,
        super.dataNascimentoString, super.ativo, super.endereco);

  factory Aluno.fromJSON(Map<String, dynamic> json) {
    return Aluno(
      json['id'],
      json['nome'],
      json['cpf'],
      json['altura'],
      json['peso'],
      json['dataNascimento'],
      json['ativo'],
      json['endereco'],
    );
  }

}
