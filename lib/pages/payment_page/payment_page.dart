import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/Mensalidade.dart';
import 'package:gym_management/domain/services/mensalidade_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/widgets/app_bar_header.dart';
import 'package:gym_management/pages/payment_page/item/payment_item_list.dart';

class PaymentPage extends StatefulWidget {
  
  final int alunoId;

  const PaymentPage({
    super.key,
    required this.alunoId,
  });

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
    fetchAllMensalidades(widget.alunoId);
  }

  void fetchAllMensalidades(int alunoId) async {
    mensalidades = await mensalidadeService.getMensalidadesByAlunoId(alunoId);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ?
    SafeArea(child: Scaffold(
      appBar: const AppBarHeader(title: 'Mensalidades'),
      body: Container(
        decoration: const BoxDecoration(
          color: ColorsConst.dashboardBackground,
        ),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorsConst.btnLoginColor),
          ),
        ),
      ),
    ))
    : SafeArea(
      child: Scaffold(
        appBar:
            const AppBarHeader(title: 'Mensalidades', backRoute: '/dashboard'),
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: ListView.builder(
            itemCount: mensalidades.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    top: index == 0 ? 15 : 0, bottom: 15, left: 20, right: 20),
                child:
                    PaymentItemList(mensalidade: mensalidades.elementAt(index)),
              );
            },
          ),
        ),
      ),
    );
  }
}
