import 'package:flutter/material.dart';
import 'package:gym_management/core/formatters/formatter.dart';
import 'package:gym_management/core/validators/form_requisitar_avaliacao.dart';
import 'package:gym_management/pages/evaluations_page/request_evaluation/form_inputs/calendar/calendar_data_input.dart';

class DataInput extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DataInput({super.key, required this.onDateSelected});

  @override
  State<DataInput> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        String? error =
            RequisitarAvaliacaoValidator.validateNullOrEmpty(value, '\'Data\'');
        return error ?? RequisitarAvaliacaoValidator.validateDate(value!);
      },
      readOnly: true,
      controller: _dateController,
      style: const TextStyle(color: Color.fromARGB(146, 255, 255, 255)),
      decoration: InputDecoration(
        hintText: _dateController.text.isEmpty ? 
            'Clique para selecionar uma data'
            : Formatter.formatarData(_selectedDate!),
        hintStyle: const TextStyle(color: Color.fromARGB(168, 255, 255, 255)),
      ),
      onTap: () async {
        showDialog(
          context: context,
          builder: (context) => CalendarDataInput(
            setInputDate: (pickedDate) {
              _dateController.text = Formatter.formatarData(pickedDate);
              setState( () => _selectedDate = pickedDate );
              widget.onDateSelected(pickedDate);
            },
          ),
        );
      },
    );
  }
}
