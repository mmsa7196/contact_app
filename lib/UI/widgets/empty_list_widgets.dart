import 'package:contact_app/App_Components/App_Assets/app_assets.dart';
import 'package:contact_app/App_Components/App_Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidgets extends StatelessWidget {
  const EmptyListWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAssets.animation1),
          const Text("There is No Contacts Added Here",style: TextStyle(color: AppColors.gold,fontSize:20,fontWeight:FontWeight.w500 ,),)
        ],
      ),
    );
  }
}
