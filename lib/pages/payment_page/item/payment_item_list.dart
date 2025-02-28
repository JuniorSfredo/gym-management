import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/Mensalidade.dart';
import 'package:gym_management/domain/models/enums/status_pagemento.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/formatters/formatter.dart';

class PaymentItemList extends StatelessWidget {
  final Mensalidade mensalidade;

  const PaymentItemList({
    super.key,
    required this.mensalidade,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          backgroundColor: ColorsConst.listItemsColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
              print(mensalidade.id);
          Navigator.pushNamed(
            context, '/mensalidades/id', 
            arguments: mensalidade.id
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Formatter.formatarData(
                  DateTime.parse(mensalidade.dataVencimento)),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              alignment: Alignment.center,
              height: 30,
              decoration: BoxDecoration(
                color: ColorsConst.backgroundComponentColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: mensalidade.statusPagamento.toLowerCase() == StatusPagemento.pago.name.toLowerCase()
                          ? ColorsConst.aprovedItemColor
                          : ColorsConst.pendingItemColor,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      mensalidade.statusPagamento.toLowerCase() == StatusPagemento.pago.name.toLowerCase()
                          ? 'Pago'
                          : 'Aguardando',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
