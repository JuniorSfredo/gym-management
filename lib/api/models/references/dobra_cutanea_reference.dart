class DobraCutaneaReference {

  int id;
  String dobra;
  double mm;

  DobraCutaneaReference(this.id, this.dobra, this.mm);

  factory DobraCutaneaReference.fromJSON(Map<String, dynamic> json) {
    return DobraCutaneaReference(
      json['id'],
      json['dobra'],
      json['mm'],
    );
  }
}
