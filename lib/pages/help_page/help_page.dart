import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/constants/text_style_const.dart';
import 'package:gym_management/pages/common/widgets/app_bar_header.dart';
import 'package:gym_management/pages/help_page/social_button/social_button.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarHeader(title: 'Ajuda'),
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sobre Nós:',
                  textAlign: TextAlign.start,
                  style: TextStylesConst.titleTextStyleHelpPage,
                ),
                SizedBox(height: 10),
                Text(
                  'Na XtremeGym, acreditamos que a atividade física vai além da estética – é um estilo de vida! Nossa missão é proporcionar um ambiente acolhedor e motivador, onde cada aluno possa alcançar seus objetivos com conforto e segurança.',
                  textAlign: TextAlign.justify,
                  style: TextStylesConst.descriptionTextStyleHelpPage,
                ),
                SizedBox(height: 20),
                Text('"Onde sua melhor versão ganha vida!"',
                    textAlign: TextAlign.justify,
                    style: TextStylesConst.descriptionTextStyleHelpPage),
                SizedBox(height: 10),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 30,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SocialButton(
                      icon: FontAwesomeIcons.whatsapp,
                      socialUrl: 'https://www.google.com/',
                    ),
                    SocialButton(
                        icon: FontAwesomeIcons.facebook,
                        socialUrl: 'https://www.google.com/'),
                    SocialButton(
                        icon: FontAwesomeIcons.instagram,
                        socialUrl: 'https://www.instagram.com/junior_sfredo/'),
                    SocialButton(
                        icon: FontAwesomeIcons.twitter,
                        socialUrl: 'https://www.google.com/'),
                    SocialButton(
                        icon: FontAwesomeIcons.github,
                        socialUrl: 'https://github.com/JuniorSfredo'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
