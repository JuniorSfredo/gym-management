import 'package:flutter/material.dart';

class InputUpdateProfile extends StatelessWidget {
  final String inputLabel;
  final dynamic value;
  const InputUpdateProfile({
    super.key,
    required this.inputLabel,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(
        text: value.toString(),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: ' $inputLabel: ',
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.white,
              ))),
    );
  }
}
