import 'package:flutter/material.dart';

class UpdateProfileBtn extends StatelessWidget {
  final double pageWidth;
  final String textBtn;
  final Color btnColor;
  const UpdateProfileBtn({
    super.key,
    required this.pageWidth,
    required this.textBtn,
    required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(pageWidth * 0.75, 60),
                  backgroundColor: btnColor,
                ),
                onPressed: () {}, 
                child: Text(textBtn,
                  style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),),
              );
  }
}
