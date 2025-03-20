// ignore_for_file: file_names

class Exercicio {
  int id;
  String nome;
  int qtdSeries;
  int minRepeticoes;
  int maxRepeticoes;

  Exercicio(
    this.id, 
    this.nome, 
    this.qtdSeries, 
    this.minRepeticoes, 
    this.maxRepeticoes
  );

  factory Exercicio.fromJSON(Map<String, dynamic> json) {
    return Exercicio(
      json['id'],
      json['name'],
      json['qtdSeries'],
      json['minRepeticoes'],
      json['maxRepeticoes']
    );
  }
}
