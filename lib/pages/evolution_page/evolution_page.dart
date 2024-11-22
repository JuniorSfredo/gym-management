import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/simplefied/avaliacao_simplefied.dart';
import 'package:gym_management/domain/services/avaliacao_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/evolution_page/chart/evolution_chart.dart';

class EvolutionPage extends StatefulWidget {
  const EvolutionPage({super.key});

  @override
  State<EvolutionPage> createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage> {
  final PageController pageController = PageController(initialPage: 0);
  AvaliacaoService evolucaoService = AvaliacaoService();
  List<AvaliacaoSimplefied> ultimasAvaliacoes = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchUltimasAvaliacoes();
  }

  void fetchUltimasAvaliacoes() async {
    try {
      final List<AvaliacaoSimplefied> response =
          await evolucaoService.getUltimasAvaliacoes();
      setState(() {
        ultimasAvaliacoes = response;
      });
    } catch (e) {
      print(e);
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    if (ultimasAvaliacoes.isEmpty) {
      return Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: ColorsConst.dashboardBackground,
        ),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(ColorsConst.btnLoginColor),
          ),
        ),
      );
    }

    final int lastMonth = ultimasAvaliacoes.first.data.month;
    final int firstMonth = ultimasAvaliacoes.last.data.month;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConst.btnLoginColor,
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            'Minha Evolução',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    heightFactor: 0.65,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: width * 0.9,
                        height: height * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 36, 36, 36),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            PageView(
                              onPageChanged: (index) => _onPageChanged(index),
                              controller: pageController,
                              children: [
                                Column(
                                  children: [
                                    EvolutionChart(
                                      width: width,
                                      height: height,
                                      maxValue: ultimasAvaliacoes
                                          .last.percentualDeGordura,
                                      minValue: ultimasAvaliacoes
                                          .first.percentualDeGordura,
                                      lastMonth: lastMonth,
                                      firstMonth: firstMonth,
                                      title: 'Percentual de gordura: ',
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    EvolutionChart(
                                      width: width,
                                      height: height,
                                      maxValue: ultimasAvaliacoes.last.peso,
                                      minValue: ultimasAvaliacoes.first.peso,
                                      lastMonth: lastMonth,
                                      firstMonth: firstMonth,
                                      title: 'Peso corporal: ',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 30,
                              child: Row(
                                children: List.generate(
                                  2,
                                  (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          pageController.animateToPage(
                                            index,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: currentIndex == index ? 6 : 4,
                                        backgroundColor: index == currentIndex
                                            ? const Color.fromARGB(
                                                255, 212, 1, 1)
                                            : const Color.fromARGB(
                                                    126, 86, 86, 86)
                                                .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  width: width * 0.7,
                  height: height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/evolutions/id');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConst.btnLoginColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Ver todas as avaliações',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
