import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/Mensalidade.dart';
import 'package:gym_management/domain/models/enums/status_pagemento.dart';
import 'package:gym_management/domain/services/mensalidade_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/formatters/formatter.dart';
import 'package:gym_management/pages/common/widgets/app_bar_header.dart';
import 'package:gym_management/pages/payment_page/details/box_confirmation/box_confirmation_widget.dart';
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

  @override
  void initState() {
    super.initState();
    fetchMensalidade(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: ColorsConst.dashboardBackground,
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBarHeader(
                  title: 'Detalhes do Pagamento',
                  backRoute: '/payments/${mensalidade.aluno.id}'),
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
                                          return BoxConfirmationWidget(mensalidade: mensalidade);
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
}
