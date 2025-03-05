import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management/domain/models/treino.dart';
import 'package:gym_management/domain/services/treino_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  TreinoService treinoService = TreinoService();
  List<Treino> treinos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTreinos(1);
  }

  void fetchTreinos(int id) async {
    try {
      final response = await treinoService.getTreinosByAlunoId(1);
      treinos = response;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConst.btnLoginColor,
          leading: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
            onPressed: () {
              context.go('/dashboard');
            },
          ),
          title: const Text(
            'Meus Treinos', 
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: treinos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Container(
                      width: width * 0.9,
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        color: ColorsConst.listItemsColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              treinos[index].nome,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.go('/alunos/1/treinos/${treinos.elementAt(index).id}');
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.circleInfo,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
