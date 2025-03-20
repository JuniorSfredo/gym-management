class AlunoId {

  int id;

  AlunoId({required this.id});

  toJson() {
    return {
      'id': id,
    };
  }
}
