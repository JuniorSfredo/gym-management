import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management/pages/dashboard_page/dashboard_page.dart';
import 'package:gym_management/pages/evaluations_page/evaluations_page.dart';
import 'package:gym_management/pages/evaluations_page/request_evaluation/request_evaluation_page.dart';
import 'package:gym_management/pages/evolution_page/evolution_page.dart';
import 'package:gym_management/pages/help_page/help_page.dart';
import 'package:gym_management/pages/login_page/login_page.dart';
import 'package:gym_management/pages/payment_page/details/payment_details_page.dart';
import 'package:gym_management/pages/payment_page/payment_page.dart';
import 'package:gym_management/pages/professionals_page/professionals_page.dart';
import 'package:gym_management/pages/profile_page/profile_page.dart';
import 'package:gym_management/pages/splash_page/splash_page.dart';
import 'package:gym_management/pages/training_page/desc_training/desc_training_page.dart';
import 'package:gym_management/pages/training_page/training_page.dart';

class GymManagementApp extends StatelessWidget {
  final GoRouter _router = GoRouter(initialLocation: '/splash', routes: [
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) =>
          MaterialPage(key: state.pageKey, child: const SplashPage()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          MaterialPage(key: state.pageKey, child: const LoginPage()),
    ),
    GoRoute(
      path: '/dashboard',
      pageBuilder: (context, state) =>
          MaterialPage(key: state.pageKey, child: const DashboardPage()),
    ),
    GoRoute(
      path: '/evolution',
      pageBuilder: (context, state) =>
          MaterialPage(key: state.pageKey, child: const EvolutionPage()),
    ),
    GoRoute(
      path: '/evolutions/id',
      pageBuilder: (context, state) =>
          MaterialPage(key: state.pageKey, child: const EvaluationPage()),
    ),
    GoRoute(
      path: '/training',
      pageBuilder: (context, state) =>
          MaterialPage(key: state.pageKey, child: const TrainingPage()),
    ),
    GoRoute(
        path: '/profissionais',
        pageBuilder: (context, state) {
          return MaterialPage(
              key: state.pageKey, child: const ProfessionalPage());
        }),
    GoRoute(
        path: '/ajuda',
        pageBuilder: (context, state) {
          return MaterialPage(key: state.pageKey, child: const HelpPage());
        }),
    GoRoute(path: '/request-evaluation', pageBuilder: (context, state) {
      return MaterialPage(
          key: state.pageKey,
          child: const RequestEvaluationPage());
    }),

    // Rotas com argumentos
    GoRoute(
      path: '/alunos/:alunoId/treinos/:treinoId',
      pageBuilder: (context, state) {
        final int alunoId = int.parse(state.pathParameters['alunoId']!);
        final int treinoId = int.parse(state.pathParameters['treinoId']!);
        return MaterialPage(
            key: state.pageKey,
            child: DescTrainingPage(alunoId: alunoId, treinoId: treinoId));
      },
    ),
    GoRoute(
      path: '/payments/:alunoId',
      pageBuilder: (context, state) {
        final int alunoId = int.parse(state.pathParameters['alunoId']!);
        return MaterialPage(
            key: state.pageKey, child: PaymentPage(alunoId: alunoId));
      },
    ),
    GoRoute(
      path: '/mensalidades/:id',
      pageBuilder: (context, state) {
        final int id = int.parse(state.pathParameters['id']!);
        return MaterialPage(
            key: state.pageKey, child: PaymentDetailsPage(id: id));
      },
    ),
    GoRoute(
        path: '/profile/:alunoId',
        pageBuilder: (context, state) {
          final int alunoId = int.parse(state.pathParameters['alunoId']!);
          return MaterialPage(
              key: state.pageKey, child: ProfilePage(alunoId: alunoId));
        }),
  ]);

  GymManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
        Locale('pt', 'BR'),
      ],
      routerConfig: _router,
    );
  }
}
