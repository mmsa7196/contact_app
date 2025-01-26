import 'package:contact_app/App_Components/App_Colors/app_colors.dart';
import 'package:flutter/material.dart';
typedef CustomTextFieldCallback=String? Function(String value);

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final CustomTextFieldCallback validator;
  final TextInputType textInputType;

  const CustomTextField(
      {required this.controller, required this.hint, required this.validator, required this.textInputType,super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextFormField(
          cursorColor: AppColors.lightBlue,
          controller: controller ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => validator(value!),
          style: const TextStyle(fontSize:16,
          color: AppColors.gold,
          ),
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.gold,
              ),
            ),
            focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.gold,
              ),
            ),
            disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.gold,
              ),
            ),
            enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.gold,
              ),
            ),
            errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.red,
              ),
            ),
            hintText: hint ,
            hintStyle:const TextStyle(color:AppColors.lightBlue),
            helperStyle:const TextStyle(fontSize: 16,
            color: AppColors.red
            ),
          ),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
