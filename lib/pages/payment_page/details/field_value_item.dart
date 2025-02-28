import 'package:flutter/material.dart';

class FieldValueItem extends StatelessWidget {

  final String field;
  final String value;

  const FieldValueItem({
    super.key,
    required this.field,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            '$field:',
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' $value',
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
