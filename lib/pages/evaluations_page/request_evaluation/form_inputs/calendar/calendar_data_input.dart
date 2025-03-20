import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/widgets/red_text_button.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDataInput extends StatefulWidget {
  final Function(DateTime) setInputDate;

  const CalendarDataInput({
    super.key,
    required this.setInputDate,
  });

  @override
  State<CalendarDataInput> createState() => _CalendarDataInputState();
}

class _CalendarDataInputState extends State<CalendarDataInput> {
  DateTime _focusedDay = DateTime.now();
  DateTime _pickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        decoration: BoxDecoration(
          color: ColorsConst.dashboardBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        width: width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TableCalendar(
                  selectedDayPredicate: (day) => isSameDay(_pickedDate, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                      _pickedDate = selectedDay;
                    });
                  },
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    todayTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: ColorsConst.btnLoginColor,
                      shape: BoxShape.circle,
                    ),
                    disabledTextStyle: TextStyle(
                      color: Color.fromARGB(255, 109, 109, 109),
                    ),
                    weekendTextStyle: TextStyle(
                      color: Color.fromARGB(255, 109, 109, 109),
                    ),
                    rangeStartTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    defaultTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    outsideDaysVisible: false,
                  ),
                  headerStyle: const HeaderStyle(
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  availableCalendarFormats: const {CalendarFormat.month: 'Mês'},
                  focusedDay: _focusedDay,
                  firstDay: DateTime.now(),
                  lastDay: DateTime(2030, 12, 31),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RedTextButton(
                      textBtn: 'Cancelar', 
                      onPressed: () => context.pop(),
                    ),
                  RedTextButton(
                    textBtn: 'OK',
                    onPressed: () {
                      widget.setInputDate(_pickedDate);
                      context.pop();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
