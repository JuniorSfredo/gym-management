import 'package:flutter/material.dart';
import 'package:gym_management/api/models/aluno.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/profile_page/update_profile_page/button_update/update_profile_btn.dart';
import 'package:gym_management/pages/profile_page/update_profile_page/form_update/form_profile_update.dart';

class UpdateProfilePage extends StatelessWidget {
  final Aluno aluno;
  const UpdateProfilePage({
    super.key,
    required this.aluno,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final dynamic inputValues = [
      aluno.nome,
      aluno.altura,
      aluno.peso,
      aluno.dataNascimento,
      aluno.endereco
    ];
    final List<String> inputFields = [
      'Nome',
      'Altura',
      'Peso',
      'Data de nascimento',
      'Endereço'
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Atualizar perfil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          backgroundColor: ColorsConst.btnLoginColor,
        ),
        body: Container(
          width: width,
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 20, right: 20, bottom: 20),
                  child: FormUpdateProfile(
                    inputFields: inputFields,
                    values: inputValues,
                  ),
                ),
              ),
              UpdateProfileBtn(
                pageWidth: width,
                textBtn: 'Confirmar Alterações',
                btnColor: ColorsConst.successColor,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: UpdateProfileBtn(
                  pageWidth: width,
                  textBtn: 'Cancelar Alterações',
                  btnColor: ColorsConst.errorColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
