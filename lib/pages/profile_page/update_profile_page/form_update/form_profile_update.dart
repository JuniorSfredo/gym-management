import 'package:flutter/material.dart';
import 'package:gym_management/pages/common/formatters/formatter.dart';
import 'package:gym_management/pages/profile_page/update_profile_page/form_update/input_form_update.dart';

class FormUpdateProfile extends StatelessWidget {
  final List<String> inputFields;
  final List<dynamic> values;
  const FormUpdateProfile({
    super.key,
    required this.inputFields,
    required this.values
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: inputFields.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InputUpdateProfile(
                          inputLabel: inputFields[index],
                          value: values[index] is DateTime ? 
                                  Formatter.formatarData(values[index]) 
                                  : values[index],
                        ),
                      );
                    },
                  );
  }
}
