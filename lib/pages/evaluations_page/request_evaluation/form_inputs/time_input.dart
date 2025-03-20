import 'package:flutter/material.dart';
import 'package:gym_management/core/formatters/formatter.dart';
import 'package:gym_management/core/validators/form_requisitar_avaliacao.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

class TimeInput extends StatefulWidget {
  final Function(TimeOfDay) setInputTime;

  const TimeInput({
    super.key, 
    required this.setInputTime
  });

  @override
  State<TimeInput> createState() => TimeInputState();
}

class TimeInputState extends State<TimeInput> {

  TimeOfDay? pickedHour;
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _timeController,
      validator: (value) {
        return RequisitarAvaliacaoValidator.validateNullOrEmpty(
            value, '\'Horário\'');
      },
      readOnly: true,
      style: const TextStyle(color: Color.fromARGB(168, 255, 255, 255)),
      decoration: InputDecoration(
        hintText: _timeController.text.isEmpty
            ? 'Clique para selecionar o horário'
            : Formatter.formatarHora(pickedHour!),
        hintStyle: const TextStyle(color: Color.fromARGB(168, 255, 255, 255)),
      ),
      onTap: () async {
        TimeOfDay? selectedHour = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 08, minute: 00),
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                colorScheme: const ColorScheme(
                  brightness: Brightness.dark,
                  primary: ColorsConst.btnLoginColor,
                  onPrimary: Color.fromARGB(255, 255, 255, 255),
                  secondary: Color.fromARGB(255, 160, 0, 0),
                  onSecondary: Color.fromARGB(255, 54, 10, 10),
                  error: ColorsConst.errorColor,
                  onError: ColorsConst.errorColor,
                  surface: ColorsConst.dashboardBackground,
                  onSurface: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              child: child!,
            );
          },
        );

        if (selectedHour != null) {
          setState(() {
            pickedHour = selectedHour;
            _timeController.text = Formatter.formatarHora(pickedHour!);
          });
          widget.setInputTime(pickedHour!);
        }
      },
    );
  }
}
