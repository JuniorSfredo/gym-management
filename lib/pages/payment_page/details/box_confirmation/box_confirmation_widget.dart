import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/Mensalidade.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/payment_page/details/box_confirmation/button_confirmation.dart';

class BoxConfirmationWidget extends StatelessWidget {
  final Mensalidade mensalidade;

  const BoxConfirmationWidget({
    super.key,
    required this.mensalidade,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(25),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      backgroundColor: ColorsConst.dashboardButton,
      content: Container(
        alignment: Alignment.topLeft,
        width: 100,
        height: 200,
        child: Column(children: [
          const Text(
            'Deseja realmente pagar essa mensalidade?',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ButtonConfirmation(
                      btnColor: ColorsConst.successColor,
                      btnText: 'Sim',
                      mensalidade: mensalidade)),
              ButtonConfirmation(
                  btnColor: const Color.fromRGBO(133, 9, 0, 1),
                  btnText: 'Não',
                  mensalidade: mensalidade),
            ],
          ),
        ]),
      ),
    );
  }
}
