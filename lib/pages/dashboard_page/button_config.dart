import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_management/pages/dashboard_page/navigation/navigation_item.dart';
import 'package:gym_management/pages/evolution_page/evolution_page.dart';

class ButtonConfigs {
  
  final List<NavigationItem> dashboardNavigationItems= [
    NavigationItem(
      text: 'Evolução',
      icon: FontAwesomeIcons.chartSimple,
      onPressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EvolutionPage(),
          ),
        );
      },
    ),
    NavigationItem(
      text: 'Treinos',
      icon: FontAwesomeIcons.dumbbell,
      onPressed: (context) {
        Navigator.pushNamed(context, '/training');
      },
    ),
    NavigationItem(
      text: 'Pagamentos',
      icon: FontAwesomeIcons.dollarSign,
      onPressed: (context) {
        Navigator.pushNamed(context, '/payments');
      },
    ),
    NavigationItem(
      text: 'Profissionais',
      icon: FontAwesomeIcons.users,
      onPressed: (context) {
        print('BTN PRESSED');
      },
    ),
    NavigationItem(
      text: 'Ajuda',
      icon: FontAwesomeIcons.circleInfo,
      onPressed: (context) {
        print('BTN PRESSED');
      },
    ),
  ];

  final List<Map<String, dynamic>> dashboardSliderButtonsConfig = [
  {
    'text': 'Solicitar Avaliação',
    'onPressed': () {
      print('Botão de avaliação de aluno pressionado');
    },
  },
  {
    'text': 'Adicionar Treino',
    'onPressed': () {
      print('Botão de adicionar treino pressionado');
    },
  }
];

}
