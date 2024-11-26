import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gym_management/pages/dashboard_page/dashboard_page.dart';
import 'package:gym_management/pages/evaluations_page/evaluations_page.dart';
import 'package:gym_management/pages/login_page/login_page.dart';
import 'package:gym_management/pages/splash_page/splash_page.dart';
import 'package:gym_management/pages/training_page/desc_training/desc_training_page.dart';
import 'package:gym_management/pages/training_page/training_page.dart';

class GymManagementApp extends StatelessWidget {
  const GymManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Management',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/evolutions/id': (context) => const EvaluationPage(),
        '/training': (context) => const TrainingPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/alunos/alunoId/treinos/treinoId') {
          final args = settings.arguments as Map<String, int>;
          return MaterialPageRoute(
            builder: (context) {
              return DescTrainingPage(
                treinoId: args['treinoId']!,
                alunoId: args['alunoId']!,
              );
            },
          );
        }
        return MaterialPageRoute(
          builder: (context) => const DashboardPage()
        );
      },
    );
  }
}
