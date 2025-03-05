import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_management/pages/common/constants/colors_const.dart';

class DashboardImageBtn extends StatelessWidget {
  
  final Text btnText;
  final String routeDestination;

  const DashboardImageBtn({
    super.key,
    required this.btnText,
    required this.routeDestination,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 60),
          backgroundColor: ColorsConst.dashboardButtonSlide,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          context.go(routeDestination);
        },
        child: btnText,
      ),
    );
  }
}
