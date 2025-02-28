import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/Mensalidade.dart';
import 'package:gym_management/domain/models/enums/status_pagemento.dart';
import 'package:gym_management/domain/services/mensalidade_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/formatters/formatter.dart';
import 'package:gym_management/pages/common/widgets/app_bar_header.dart';
import 'package:gym_management/pages/payment_page/details/field_value_item.dart';

class PaymentDetailsPage extends StatefulWidget {
  final int id;

  const PaymentDetailsPage({
    super.key,
    required this.id,
  });

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  MensalidadeService mensalidadeService = MensalidadeService();
  late Mensalidade mensalidade;
  bool isLoading = true;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    fetchMensalidade(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHeader(title: 'Detalhes do Pagamento'),
        body: Container(
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Column(
                    children: [
                      FieldValueItem(
                        field: 'Status do Pagamento',
                        value: mensalidade.statusPagamento
                            .replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '')
                            .split('_')
                            .map((e) =>
                                e.substring(0, 1).toUpperCase() +
                                e.substring(1).toLowerCase())
                            .join(' '),
                      ),
                      FieldValueItem(
                        field: 'Data de Vencimento',
                        value: Formatter.formatarData(
                            DateTime.parse(mensalidade.dataVencimento)),
                      ),
                      FieldValueItem(
                        field: 'Tipo de Plano',
                        value: mensalidade.plano.tiposPlanos
                                .substring(0, 1)
                                .toUpperCase() +
                            mensalidade.plano.tiposPlanos
                                .substring(1)
                                .toLowerCase(),
                      ),
                      FieldValueItem(
                        field: 'Valor da Mensalidade',
                        value: 'R\$ ${mensalidade.plano.valor}',
                      ),
                      if (mensalidade.statusPagamento
                              .replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '')
                              .split('_')
                              .map((e) => e.toLowerCase())
                              .join('') ==
                          StatusPagemento.aguardandoPagamento.name
                              .toLowerCase()) ...[
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(300, 50),
                              backgroundColor: ColorsConst.btnLoginColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      contentPadding: const EdgeInsets.all(25),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      backgroundColor:
                                          ColorsConst.dashboardButton,
                                      content: Container(
                                        alignment: Alignment.topLeft,
                                        width: 100,
                                        height: 200,
                                        child: Column(children: [
                                          const Text(
                                            'Deseja realmente pagar essa mensalidade?',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    fixedSize:
                                                        const Size(70, 15),
                                                    backgroundColor: ColorsConst
                                                        .successColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  onPressed: isProcessing ? null : () {
                                                    processarPagamento();
                                                  },
                                                  child: const Text(
                                                    'Sim',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 9,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize: const Size(70, 15),
                                                  backgroundColor:
                                                      ColorsConst.errorColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: const Text(
                                                  'Não',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 9,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                    );
                                  });
                            },
                            child: const Text(
                              'Pagar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void fetchMensalidade(int id) async {
    mensalidade = await mensalidadeService.getMensalidadeById(id);
    setState(() {
      isLoading = false;
    });
  }

  Future<void> processarPagamento() async {
    setState(() {
      isProcessing = true;
    });
    try {
      if (!mounted) return;
      await mensalidadeService.pagarMensalidade(mensalidade.id);
      Navigator.popAndPushNamed(context, '/mensalidades/id',
          arguments: mensalidade.id);
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isProcessing = false;
      });
    }
  }
}
