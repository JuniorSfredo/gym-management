import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_management/domain/models/simplefied/avaliacao_simplefied.dart';
import 'package:gym_management/domain/services/avaliacao_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/constants/text_style_const.dart';
import 'package:gym_management/pages/common/formatters/formatter.dart';
import 'package:gym_management/pages/common/widgets/simple_back_button.dart';
import 'package:gym_management/pages/evaluations_page/box/item_box/evaluation_box_details_items.dart';

class EvaluationBoxDetail extends StatefulWidget {
  final int avaliacaoId;

  const EvaluationBoxDetail({
    super.key,
    required this.avaliacaoId,
  });

  @override
  State<EvaluationBoxDetail> createState() => _EvaluationBoxDetailState();
}

class _EvaluationBoxDetailState extends State<EvaluationBoxDetail> {
  AvaliacaoService evolucaoService = AvaliacaoService();
  late AvaliacaoSimplefied avaliacao;
  bool isLoading = true;
  late List<dynamic> avaliacaoDetails = [
    {
      "field": "Peso",
      "value": avaliacao.peso.toString(),
      "icon": FontAwesomeIcons.weightHanging,
    },
    {
      "field": "IMC",
      "value": avaliacao.imc.toString(),
      "icon": FontAwesomeIcons.gaugeHigh,
    },
    {
      "field": "Percentual de Gordura",
      "value": avaliacao.percentualDeGordura.toString(),
      "icon": FontAwesomeIcons.percent,
    },
    {
      "field": "Professor",
      "value": avaliacao.professor.nome,
      "icon": FontAwesomeIcons.userTie,
    }
  ];

  @override
  void initState() {
    super.initState();
    getAvaliacaoDetails(widget.avaliacaoId);
  }

  void getAvaliacaoDetails(int avaliacaoId) async {
    try {
      AvaliacaoSimplefied avaliacaoSimplefied =
          await evolucaoService.getAvaliacaoById(avaliacaoId);
      setState(() {
        avaliacao = avaliacaoSimplefied;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: ColorsConst.dashboardBackground,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorsConst.btnLoginColor),
              ))
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Formatter.formatarData(avaliacao.data),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 13),
                        Flexible(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: avaliacaoDetails.length,
                            itemBuilder: (context, index) {
                              return BoxDetailsItems(
                                field:
                                    avaliacaoDetails.elementAt(index)['field'],
                                value: avaliacaoDetails
                                    .elementAt(index)['value']
                                    .toString(),
                                icon: avaliacaoDetails.elementAt(index)['icon'],
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.zero,
                          padding: const EdgeInsets.only(top: 15),
                          child: const Text(
                            'Dobras Cutâneas:',
                            style: TextStylesConst.primaryTextStyle,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: avaliacao.dobrasCutaneas.length,
                                itemBuilder: (context, index) {
                                  return BoxDetailsItems(
                                    field:
                                        '${avaliacao.dobrasCutaneas[index].dobra[0]}'
                                        '${avaliacao.dobrasCutaneas[index].dobra.substring(1).toLowerCase()}',
                                    value: avaliacao.dobrasCutaneas[index].mm
                                        .toString(),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                      bottom: 25,
                      right: 25,
                      child: SimpleBackButton(
                        backgroundColor: ColorsConst.btnLoginColor,
                        contentColor: Colors.white,
                      )
                  ),
                ],
              ),
      ),
    );
  }
}
