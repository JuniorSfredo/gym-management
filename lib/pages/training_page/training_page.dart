import 'package:flutter/material.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConst.btnLoginColor,
          iconTheme: const IconThemeData(
            color: Colors.white
          ),
          title: const Text(
            'Todos os treinos', 
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
        ),
      ),
    );
  }
}
