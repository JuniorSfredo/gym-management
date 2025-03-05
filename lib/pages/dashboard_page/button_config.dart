import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management/pages/dashboard_page/navigation/navigation_item.dart';

class ButtonConfigs {
  
  final List<NavigationItem> dashboardNavigationItems= [
    NavigationItem(
      text: 'Evolução',
      icon: FontAwesomeIcons.chartSimple,
      onPressed: (context) {
        context.go('/evolution');
      },
    ),
    NavigationItem(
      text: 'Treinos',
      icon: FontAwesomeIcons.dumbbell,
      onPressed: (context) {
        context.go('/training');
      },
    ),
    NavigationItem(
      text: 'Pagamentos',
      icon: FontAwesomeIcons.dollarSign,
      onPressed: (context) {
        context.go('/payments/1');
      },
    ),
    NavigationItem(
      text: 'Profissionais',
      icon: FontAwesomeIcons.users,
      onPressed: (context) {
        context.go('/profissionais');
      },
    ),
    NavigationItem(
      text: 'Ajuda',
      icon: FontAwesomeIcons.circleInfo,
      onPressed: (context) {
        context.go('/ajuda');
      },
    ),
  ];

  final List<Map<String, dynamic>> dashboardSliderButtonsConfig = [
  {
    'text': 'Solicitar Avaliação',
    'routeDestination': '/request-evaluation',
  },
  {
    'text': 'Adicionar Treino',
    'routeDestination': '/dashboard',
  }
];

}
