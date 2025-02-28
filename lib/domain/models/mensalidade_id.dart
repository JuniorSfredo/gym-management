class MensalidadeId {
  int id;

  MensalidadeId({required this.id});

  factory MensalidadeId.fromJson(Map<String, dynamic> json) {
    return MensalidadeId(
      id: json['id'],
    );
  }
}
