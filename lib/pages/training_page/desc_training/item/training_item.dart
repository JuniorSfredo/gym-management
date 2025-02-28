import 'package:flutter/material.dart';
import 'package:gym_management/pages/common/constants/text_style_const.dart';

class TrainingItem extends StatelessWidget {
  final double verticalPadding;
  final String field;
  final String value;
  
  const TrainingItem({
    super.key,
    required this.verticalPadding,
    required this.field,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Row(
        children: [
          Text('$field: ', 
               style: TextStylesConst.primaryTextStyle,
          ),
          Text(value, 
               style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
               ),
          ),
        ],
      ),
    );
  }
}
