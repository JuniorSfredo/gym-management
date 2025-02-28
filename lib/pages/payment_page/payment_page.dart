import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/Mensalidade.dart';
import 'package:gym_management/domain/services/mensalidade_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/payment_page/item/payment_item_list.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  MensalidadeService mensalidadeService = MensalidadeService();
  List<Mensalidade> mensalidades = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAllMensalidades(1);
  }

  void fetchAllMensalidades(int alunoId) async {
    mensalidades = await mensalidadeService.getMensalidadesByAlunoId(alunoId);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: ColorsConst.btnLoginColor,
          title: const Text(
            'Pagamentos',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: ListView.builder(
            itemCount: mensalidades.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(top: index == 0 ? 15 : 0, bottom: 15, left: 20, right: 20),
                child: PaymentItemList(mensalidade: mensalidades.elementAt(index)),
              );
            },
          ),
        ),
      ),
    );
  }
}
