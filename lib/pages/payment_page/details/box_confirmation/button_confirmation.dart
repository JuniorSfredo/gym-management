import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management/domain/models/Mensalidade.dart';
import 'package:gym_management/domain/services/mensalidade_service.dart';

class ButtonConfirmation extends StatefulWidget {
  final Mensalidade mensalidade;
  final Color btnColor;
  final String btnText;

  ButtonConfirmation(
      {super.key,
      required this.btnColor,
      required this.btnText,
      required this.mensalidade});
  @override
  State<ButtonConfirmation> createState() => _ButtonConfirmationState();
}

class _ButtonConfirmationState extends State<ButtonConfirmation> {
  bool isProcessing = false;
  MensalidadeService mensalidadeService = MensalidadeService();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(70, 15),
        backgroundColor: widget.btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: widget.btnText == 'Sim'
          ? isProcessing
              ? null
              : () {
                  processarPagamento();
                }
          : () {
              context.pop();
            },
      child: Text(
        widget.btnText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9,
        ),
      ),
    );
  }

  Future<void> processarPagamento() async {
    setState(() {
      isProcessing = true;
    });
    try {
      if (!mounted) return;
      await mensalidadeService.pagarMensalidade(widget.mensalidade.id);
      context.go('/payments/${widget.mensalidade.aluno.id}');
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isProcessing = false;
      });
    }
  }
}
