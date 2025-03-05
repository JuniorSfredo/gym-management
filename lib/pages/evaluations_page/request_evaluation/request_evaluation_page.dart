import 'package:flutter/material.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/widgets/app_bar_header.dart';

class RequestEvaluationPage extends StatelessWidget {


  const RequestEvaluationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHeader(title: 'Solicitar Avaliação'),
        body: Container(
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
        ),
      ),
    );
  }
}
