import 'package:flutter/material.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

class RedTextButton extends StatelessWidget {

  final String textBtn;
  final Function() onPressed;

  const RedTextButton({super.key, required this.textBtn, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textBtn,
        style: const TextStyle(color: ColorsConst.btnLoginColor),
      ),
    );
  }
}
