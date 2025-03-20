class ProfessorReference {

  int id;
  String nome;

  ProfessorReference(this.id, this.nome);

  factory ProfessorReference.fromJSON(Map<String, dynamic> json) {
    return ProfessorReference(
      json['id'],
      json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}
