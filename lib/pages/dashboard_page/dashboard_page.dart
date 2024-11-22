import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/aluno.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/dashboard_page/footer/dashboard_footer.dart';
import 'package:gym_management/pages/dashboard_page/header/dashboard_header.dart';
import 'package:gym_management/pages/dashboard_page/navigation/dashboard_navigation.dart';
import 'package:gym_management/pages/dashboard_page/slider/dashboard_slider.dart';
import 'package:gym_management/domain/services/aluno_service.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final AlunoService alunoService = AlunoService();
  late Aluno aluno;
  bool isLoading = true;

  @override
  void initState() {
    fetchAluno();
    super.initState();
  }

  void fetchAluno() async {
    try {
      final Aluno response = await alunoService.fetchAlunoById(1);
      setState(() {
        aluno = response;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF121212),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: ColorsConst.btnLoginColor,
          ),
        ),
      );
    }

      return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF121212),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // # Header
              DashboardHeader(aluno: aluno),
              // # NAVIGATION
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 25),
                child: DashboardNavigation(),
              ),
              // # SLIDES
              const Padding(
                padding: EdgeInsets.only(top: 5, right: 1),
                child: DashboardSlider(),
              ),
              // # FOOTER BUTTONS
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Center(
                  child: DashboardFooter(aluno: aluno),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
