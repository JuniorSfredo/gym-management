import 'package:flutter/material.dart';
import 'package:gym_management/pages/common/widgets/app_bar_header.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppBarHeader(title: 'Ajuda'),
        body: Center(
          child: Text('Página de ajuda'),
        ),
      ),
    );
  }
}
