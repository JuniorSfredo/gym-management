class Professor {
  int id;
  String nome;
  String perfilImgUrl;

  Professor({
    required this.id,
    required this.nome,
    required this.perfilImgUrl,
  });

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      id: json['id'],
      nome: json['nome'],
      perfilImgUrl: json['imgUrl'],
    );
  }
}
