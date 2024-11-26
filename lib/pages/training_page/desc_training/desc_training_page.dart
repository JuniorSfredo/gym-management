import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/Treino.dart';
import 'package:gym_management/domain/services/treino_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

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

  @override
  void initState() {
    super.initState();
    fetchGetTreinoById(widget.treinoId, widget.alunoId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoading ?
              Container(
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
                  iconTheme: const IconThemeData(color: Colors.white),
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
                ),
              ));
  }

  void fetchGetTreinoById(int treinoId, int alunoId) async {
    final response = await treinoService.getTreinoById(treinoId, alunoId);
    setState(() {
      treino = response;
      isLoading = false;
    });
  }
}
