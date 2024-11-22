import 'package:flutter/material.dart';

class SimpleBackButton extends StatelessWidget {
  final Color backgroundColor;
  final Color contentColor;

  const SimpleBackButton({
    super.key,
    required this.backgroundColor,
    required this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return BackButton(
      color: contentColor,
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size(40, 40)),
        alignment: Alignment.center,
        backgroundColor:
            WidgetStatePropertyAll(backgroundColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
