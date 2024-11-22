import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxDetailsItems extends StatelessWidget {
  final String field;
  final String value;
  final IconData? icon;

  const BoxDetailsItems({
    super.key,
    required this.field,
    required this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          if (icon != null) ...[
            FaIcon(
              icon,
              color: Colors.white,
              size: 15,
            ),
            const SizedBox(width: 10),
          ],
          Text(
            '$field: ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
