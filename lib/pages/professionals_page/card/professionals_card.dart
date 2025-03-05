import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/professor.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

class ProfessionalsCard extends StatelessWidget {

  final Professor professor;

  const ProfessionalsCard({
    super.key,
    required this.professor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsConst.btnLoginColor, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                fit: BoxFit.cover,
                professor.perfilImgUrl,
                width: 100,
                height: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(professor.nome,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          const Text('Personal Trainer',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
