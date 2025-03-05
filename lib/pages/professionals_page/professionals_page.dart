import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/professor.dart';
import 'package:gym_management/domain/services/professor_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/widgets/app_bar_header.dart';
import 'package:gym_management/pages/professionals_page/card/professionals_card.dart';

class ProfessionalPage extends StatefulWidget {
  const ProfessionalPage({super.key});

  @override
  State<ProfessionalPage> createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends State<ProfessionalPage> {
  ProfessorService professorService = ProfessorService();
  List<Professor> professores = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfessores();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHeader(title: 'Nossos Profissionais'),
        body: Container(
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: isLoading ? const Center(child: CircularProgressIndicator()) 
          : Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: GridView.builder(
              itemCount: professores.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.83),
              itemBuilder: (context, index) {
                return ProfessionalsCard(
                  professor: professores.elementAt(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void fetchProfessores() async {
    professores = await professorService.getAllProfessores();
    setState(() {
      isLoading = false;
    });
  }
}
