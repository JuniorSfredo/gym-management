import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_management/domain/models/aluno.dart';
import 'package:gym_management/pages/dashboard_page/footer/buttons/footer_button.dart';
import 'package:gym_management/pages/profile_page/profile_page.dart';

class DashboardFooter extends StatelessWidget {
  final Aluno aluno;
  final double width = 200;
  final double height = 65;

  const DashboardFooter({
    super.key,
    required this.aluno,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                border:
                    Border(right: BorderSide(color: Colors.white, width: 1)),
              ),
              child: FooterButton(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                width: width / 2,
                height: height,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(aluno: aluno),
                    ),
                  );
                },
                icon: FontAwesomeIcons.user,
              )),
          Container(
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Colors.white, width: 1)),
              ),
              child: FooterButton(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                width: width / 2,
                height: height,
                onPressed: () {
                  print("Btn user pressed!");
                },
                icon: FontAwesomeIcons.plus,
              )),
        ],
      ),
    );
  }
}
