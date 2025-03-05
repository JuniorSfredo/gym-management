import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management/domain/models/exercicio.dart';
import 'package:gym_management/domain/models/treino.dart';
import 'package:gym_management/domain/services/treino_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/constants/text_style_const.dart';
import 'package:gym_management/pages/training_page/desc_training/item/training_item.dart';

class DescTrainingPage extends StatefulWidget {
  final int treinoId;
  final int alunoId;

  const DescTrainingPage(
      {super.key, required this.treinoId, required this.alunoId});

  @override
  State<DescTrainingPage> createState() => _DescTrainingPageState();
}

class _DescTrainingPageState extends State<DescTrainingPage> {
  TreinoService treinoService = TreinoService();
  late Treino treino;
  bool isLoading = true;
  late List<Exercicio> exercicios = treino.exercicios;

  @override
  void initState() {
    super.initState();
    fetchGetTreinoById(widget.treinoId, widget.alunoId);
  }

  void fetchGetTreinoById(int treinoId, int alunoId) async {
    final response = await treinoService.getTreinoById(treinoId, alunoId);
    setState(() {
      treino = response;
      isLoading = false;
    });
  }

  DataCell buildDataCell(String data) {
    return DataCell(
      Center(
        child: Text(
          textAlign: TextAlign.center,
          data,
          style: TextStylesConst.rowTableTextStyleSize13,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoading
            ? Container(
                decoration: const BoxDecoration(
                  color: ColorsConst.dashboardBackground,
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: ColorsConst.btnLoginColor,
                  leading: IconButton(
                      onPressed: () {
                        context.go('/training');
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  title: Text(
                    treino.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: Container(
                  decoration: const BoxDecoration(
                    color: ColorsConst.dashboardBackground,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        TrainingItem(
                          verticalPadding: 5,
                          field: 'Treino feito por',
                          value: treino.professor.nome,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Lista de exercícios:',
                          style: TextStylesConst.primaryTextStyle,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: DataTable(
                              columnSpacing: 40,
                              columns: const [
                                DataColumn(
                                  label: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Exericício',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Center(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Ser',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Min Rep',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Max Rep',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              rows: exercicios.map((exercicio) {
                                return DataRow(
                                  cells: [
                                    buildDataCell(exercicio.nome),
                                    buildDataCell(
                                        exercicio.qtdSeries.toString()),
                                    buildDataCell(
                                        exercicio.minRepeticoes.toString()),
                                    buildDataCell(
                                        exercicio.maxRepeticoes.toString()),
                                  ],
                                );
                              }).toList()),
                        ),
                        const SizedBox(height: 10),
                        const TrainingItem(
                          verticalPadding: 1,
                          field: 'Exe',
                          value: 'Nome do exercício',
                        ),
                        const TrainingItem(
                          verticalPadding: 1,
                          field: 'Ser',
                          value: 'Quantidade de séries',
                        ),
                        const TrainingItem(
                          verticalPadding: 1,
                          field: 'Min Rep',
                          value: 'Quantidade mínima de repetições',
                        ),
                        const TrainingItem(
                          verticalPadding: 1,
                          field: 'Max Rep',
                          value: 'Quantidade máxima de repetições',
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
