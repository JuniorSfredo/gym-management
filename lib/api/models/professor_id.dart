class ProfessorId {

  int id;

  ProfessorId({required this.id});

  toJson() {
    return {
      'id': id,
    };
  }
}
