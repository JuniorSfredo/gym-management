import 'package:flutter/material.dart';
import 'package:gym_management/domain/models/aluno.dart';
import 'package:gym_management/domain/services/aluno_service.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';
import 'package:gym_management/pages/common/formatters/formatter.dart';
import 'package:gym_management/pages/common/widgets/app_bar_header.dart';
import 'package:gym_management/pages/profile_page/update_profile_page/update_profile_page.dart';

class ProfilePage extends StatefulWidget {

  final int alunoId;

  const ProfilePage({
    super.key,
    required this.alunoId,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  AlunoService alunoService = AlunoService();
  late Aluno aluno;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAluno(widget.alunoId);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return isLoading ?
    SafeArea(
      child: Scaffold(
        appBar: const AppBarHeader(title: 'Meu perfil'),
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorsConst.btnLoginColor),
            ),
          ),
        ),
      ),
    )
    : SafeArea(
      child: Scaffold(
        appBar: const AppBarHeader(title: 'Meu perfil'),
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: ColorsConst.dashboardBackground,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(pageWidth: width, pageHeight: height, nomeAluno: aluno.nome),
              const SizedBox(height: 10),
              ComponentListProfile(
                campo: 'Nome:',
                componente: aluno.nome,
              ),
              ComponentListProfile(
                campo: 'Altura:',
                componente: '${aluno.altura}m',
              ),
              ComponentListProfile(
                campo: 'Peso:',
                componente: '${aluno.peso}Kg',
              ),
              ComponentListProfile(
                campo: 'Data de Nascimento:',
                componente: Formatter.formatarData(aluno.dataNascimento),
              ),
              ComponentListProfile(
                campo: 'Ativo',
                componente: aluno.ativo ? 'Sim' : 'Não',
              ),
              ComponentListProfile(
                campo: 'Endereço:',
                componente: aluno.endereco,
              ),
              const SizedBox(height: 20),
              Center(child: UpdateProfileButton(pageWidth: width, pageHeight: height, aluno: aluno)),
            ],
          ),
        ),
      ),
    );
  }

  void fetchAluno(int alunoId) async {
    aluno = await alunoService.fetchAlunoById(alunoId);
    setState(() {
      isLoading = false;
    });
  }

}

class ComponentListProfile extends StatelessWidget {
  final String campo;
  final dynamic componente;
  const ComponentListProfile({
    super.key,
    required this.campo,
    required this.componente,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            campo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            textAlign: TextAlign.start,
            componente,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String nomeAluno;
  final double pageWidth;
  final double pageHeight;
  const ProfileHeader ({
    super.key,
    required this.pageWidth,
    required this.pageHeight,
    required this.nomeAluno,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: pageWidth,
      height: pageHeight * 0.3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/profileheaderimg.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('assets/img/userimage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            nomeAluno,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class UpdateProfileButton extends StatelessWidget {
  final Aluno aluno;
  final double pageWidth;
  final double pageHeight;
  const UpdateProfileButton({
    super.key,
    required this.pageWidth,
    required this.pageHeight,
    required this.aluno,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConst.btnLoginColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: Size(pageWidth * 0.6, 50),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProfilePage(aluno: aluno),
          ),
        );
      },
      child: const Text(
        'Atualizar Perfil',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
