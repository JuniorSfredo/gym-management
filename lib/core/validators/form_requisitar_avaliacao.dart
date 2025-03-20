class RequisitarAvaliacaoValidator {
  static String? validateNullOrEmpty(String? value, String field) {
    if (value == null || value.isEmpty) {
      return 'O campo $field é obrigatório';
    }

    return null;
  }

  static String? validateDate(String date) {
    RegExp regExp = RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$');
    if (!regExp.hasMatch(date)) {
      return 'Data inválida. Use o formato dd/mm/aaaa';
    }
    
    return null;
  }
}
