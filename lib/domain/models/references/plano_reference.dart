class PlanoReference {

  int id;
  String tiposPlanos;
  double valor;

  PlanoReference(this.id, this.tiposPlanos, this.valor);

  factory PlanoReference.fromJson(Map<String, dynamic> json) {
    return PlanoReference(
      json['id'],
      json['tiposPlanos'],
      json['valor'],
    );
  }
}
