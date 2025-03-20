import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management/api/models/aluno_id.dart';
import 'package:gym_management/api/models/avaliacao_request.dart';
import 'package:gym_management/api/models/professor.dart';
import 'package:gym_management/api/models/professor_id.dart';
import 'package:gym_management/api/services/avaliacao_service.dart';
import 'package:gym_management/api/services/professor_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/core/formatters/formatter.dart';
import 'package:gym_management/pages/common/widgets/app_bar_header.dart';
import 'package:gym_management/pages/evaluations_page/request_evaluation/form_inputs/data_input.dart';
import 'package:gym_management/pages/evaluations_page/request_evaluation/form_inputs/professor_input.dart';
import 'package:gym_management/pages/evaluations_page/request_evaluation/form_inputs/sucess_dialog_request_evaluation.dart';
import 'package:gym_management/pages/evaluations_page/request_evaluation/form_inputs/time_input.dart';

class RequestEvaluationPage extends StatefulWidget {
  const RequestEvaluationPage({
    super.key,
  });

  @override
  State<RequestEvaluationPage> createState() => _RequestEvaluationPageState();
}

class _RequestEvaluationPageState extends State<RequestEvaluationPage> {
  ProfessorService professorService = ProfessorService();
  AvaliacaoService avaliacaoService = AvaliacaoService();
  List<Professor> professores = [];
  bool isLoading = true;
  DateTime? _selectedDate;
  TimeOfDay? pickedHour;
  late int professorId;
  bool isSubmitting = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchProfessores();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHeader(title: 'Solicitar Avaliação'),
        body: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                color: ColorsConst.dashboardBackground,
              ),
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ColorsConst.btnLoginColor,
                    ))
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 40),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Selecione um professor:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            const SizedBox(height: 10),
                            ProfessorInput(
                                professores: professores,
                                onProfessorSelected: (id) =>
                                    setState(() => professorId = id)),
                            const SizedBox(height: 20),
                            const Text('Selecione a data:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            const SizedBox(height: 10),
                            DataInput(
                                onDateSelected: (selectedDay) => setState(
                                    () => _selectedDate = selectedDay)),
                            const SizedBox(height: 20),
                            const Text('Selecione o horário:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            const SizedBox(height: 10),
                            TimeInput(
                                setInputTime: (selectedHour) =>
                                    setState(() => pickedHour = selectedHour)),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(300, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor:
                                          ColorsConst.btnLoginColor),
                                  onPressed: isSubmitting
                                      ? null
                                      : () async {
                                          if (formKey.currentState!.validate()) {
                                            successRequest();
                                            if (mounted) {
                                              try {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return const SuccessDialogRequestEvaluation();
                                                    }).then((_) {
                                                  if (mounted) {
                                                    context.go('/dashboard');
                                                  }
                                                });
                                              } catch (e) {
                                                print(e);
                                              } finally {
                                                setState(() {
                                                  isSubmitting = false;
                                                });
                                              }
                                            }
                                          }
                                        },
                                  child: const Text(
                                    'Solicitar Avaliação',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
            if (isSubmitting)
              Container(
                width: width,
                height: height,
                color: const Color.fromARGB(119, 0, 0, 0),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorsConst.btnLoginColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void fetchProfessores() async {
    dynamic response = await professorService.getAllProfessores();
    try {
      setState(() {
        professores = response;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void successRequest() async {
    setState(() => isSubmitting = true);
    AvaliacaoRequest avaliacaoRequest = AvaliacaoRequest(
        Formatter.toJsonFormat(
          DateTime(_selectedDate!.year, _selectedDate!.month, _selectedDate!.day,
                   pickedHour!.hour, pickedHour!.minute
                  ),
          ),
        ProfessorId(id: professorId),
        AlunoId(id: 1)
    );
    await avaliacaoService.requestAvaliacao(avaliacaoRequest);
  }
}
