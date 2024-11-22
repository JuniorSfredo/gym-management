class Pessoa {
  int id;
  String nome;
  String cpf;
  double altura;
  double peso;
  DateTime dataNascimento;
  bool ativo;
  String endereco;

  Pessoa(
    this.id,
    this.nome,
    this.cpf,
    this.altura,
    this.peso,
    String dataNascimentoString,
    this.ativo,
    this.endereco,
  ) : dataNascimento = DateTime.parse(dataNascimentoString);

  String formatarDataNascimento() {
    return "${dataNascimento.day}/${dataNascimento.month}/${dataNascimento.year}";
  }
}
