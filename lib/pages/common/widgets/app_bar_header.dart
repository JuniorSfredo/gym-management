import 'package:flutter/material.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const AppBarHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: ColorsConst.btnLoginColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/payments');
        }, 
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
