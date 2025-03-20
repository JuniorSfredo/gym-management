import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/constants/text_style_const.dart';
import 'package:gym_management/pages/common/widgets/red_text_button.dart';

class SuccessDialogRequestEvaluation extends StatelessWidget {
  const SuccessDialogRequestEvaluation({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
      backgroundColor: ColorsConst.dashboardBackground,
      content: SizedBox(
        width: 150,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Avaliação solicitada com sucesso!',
                style: TextStylesConst.boldDefaultTextStyle),
            Align(
              alignment: Alignment.bottomRight,
              child: RedTextButton(
                onPressed: () => context.go('/dashboard'),
                textBtn: 'OK',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
