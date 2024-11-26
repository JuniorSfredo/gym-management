import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_management/domain/models/simplefied/avaliacao_simplefied.dart';
import 'package:gym_management/domain/services/avaliacao_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/formatters/formatter.dart';
import 'package:gym_management/pages/evaluations_page/box/evaluation_box_details.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key});

  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  AvaliacaoService avaliacaoService = AvaliacaoService();
  final List<AvaliacaoSimplefied> avaliacoes = [];
  bool isLoading = true;
  List<bool> isExtended = [];

  void _toggleExtended(int index) {
    setState(() {
      for (int i = 0; i < isExtended.length; i++) {
        if (i != index) {
          isExtended[i] = false;
        }
      }
      isExtended[index] = !isExtended[index];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllAvaliacoes();
  }

  void fetchAllAvaliacoes() async {
    final response = await avaliacaoService.getAllAvaliacoesByAlunoId(1);
    try {
      setState(() {
        avaliacoes.addAll(response);
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget itemsDetais(int id, String peso, String imc, String percentualGordura,
      String professor) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Peso: ${peso}kg',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'IMC: $imc',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'Percentual de gordura: $percentualGordura%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'Professor: $professor',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return EvaluationBoxDetail(avaliacaoId: id); 
                    },
                  );
                },
                child: const Text(
                  'Ver detalhes',
                  style: TextStyle(
                    color: ColorsConst.dashboardBackground,
                    fontSize: 16,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorsConst.btnLoginColor,
        title: const Text(
          'Todas as avaliações',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: ListView.builder(
            itemCount: avaliacoes.length,
            itemBuilder: (context, index) {
              isExtended.add(false);
              return Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                child: GestureDetector(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: isExtended[index] ? 250 : 60,
                    width: MediaQuery.of(context).size.width,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: ColorsConst.listItemsColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Formatter.formatarData(avaliacoes[index].data),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AnimatedRotation(
                                turns: isExtended[index] ? 0.5 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: InkWell(
                                  onTap: () => _toggleExtended(index),
                                  child: const FaIcon(
                                    FontAwesomeIcons.chevronDown,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isExtended[index])
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: FutureBuilder<Widget>(
                              future: Future.delayed(
                                const Duration(milliseconds: 200),
                                () => itemsDetais(
                                  avaliacoes[index].id,
                                  avaliacoes[index].peso.toString(),
                                  avaliacoes[index].imc.toString(),
                                  avaliacoes[index]
                                      .percentualDeGordura
                                      .toString(),
                                  avaliacoes[index].professor.nome.toString(),
                                ),
                              ),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return snapshot.data!;
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    ));
  }
}
