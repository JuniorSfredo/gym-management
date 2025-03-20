class AlunoReference {

  int id;
  String nome;

  AlunoReference(this.id, this.nome);

  factory AlunoReference.fromJson(Map<String, dynamic> json) {
    return AlunoReference(
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
