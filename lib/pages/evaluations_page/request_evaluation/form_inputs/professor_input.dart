import 'package:flutter/material.dart';
import 'package:gym_management/api/models/professor.dart';
import 'package:gym_management/core/validators/form_requisitar_avaliacao.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

class ProfessorInput extends StatelessWidget {

  final List<Professor> professores;
  final Function(int) onProfessorSelected;

  const ProfessorInput({
    super.key,
    required this.professores,
    required this.onProfessorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) {
        return RequisitarAvaliacaoValidator.validateNullOrEmpty(
            value, '\'Professor\'');
      },
      style: const TextStyle(
          color: Color.fromARGB(168, 255, 255, 255),
          fontWeight: FontWeight.w500),
      dropdownColor: ColorsConst.dashboardButton,
      items: professores.map((Professor professor) {
        return DropdownMenuItem<String>(
          value: professor.id.toString(),
          child: Text(professor.nome,
              style: const TextStyle(
                color: Color.fromARGB(168, 255, 255, 255),
              )),
        );
      }).toList(),
      onChanged: (value) {
        onProfessorSelected(int.parse(value!));
      },
    );
  }
}
