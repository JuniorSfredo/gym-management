import 'package:flutter/material.dart';
import 'package:gym_management/api/models/aluno.dart';

class DashboardHeader extends StatelessWidget {
  final Aluno aluno ;
  
  const DashboardHeader({
    super.key,
    required this.aluno,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ), 
              ),
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage('assets/img/dashimage.png'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                  Positioned(
                    top: 185,
                    left: 20,
                    child: Text(
                      'Olá, ${aluno.nome}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                 ],
              ),
           );
  }
}
