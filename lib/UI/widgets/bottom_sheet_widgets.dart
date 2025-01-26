import 'dart:io';

import 'package:contact_app/App_Components/App_Colors/app_colors.dart';
import 'package:contact_app/App_Components/Models/contact.dart';
import 'package:contact_app/UI/widgets/custom_text_field.dart';
import 'package:contact_app/UI/widgets/inbut_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetWidgets extends StatefulWidget {

  BottomSheetWidgets({super.key});

  @override
  State<BottomSheetWidgets> createState() => _BottomSheetWidgetsState();
}

class _BottomSheetWidgetsState extends State<BottomSheetWidgets> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();
  final formKey=GlobalKey<FormState>();

  File? image;

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          child: Wrap(
            children: [
              InbutCard(nameController: nameController,
                emailController: emailController,
                phoneController: phoneController,
                onClick: ()async{
                  ImagePicker imagePicker=ImagePicker();
                  var file=await imagePicker.pickImage(source: ImageSource.gallery);
                  image=File(file!.path);
                  if(file != null ){
                    image=File(file.path);
                    setState(() {
                    });
                  }
                },
                image: image,
              ),
              CustomTextField(
                  controller: nameController,
                  hint: "Enter User Name ",
                  textInputType: TextInputType.name,
                  validator: (value) => value.isEmpty ? "Enter User Name" : null),
              CustomTextField(
                  controller: emailController,
                  hint: "Enter User Email",
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter your Email";
                    } else if (RegExp(
                        "\w+@\w+\.(?:com|net)")
                        .hasMatch(value)) {
                      return "Enter Valid Email";
                    }
                    return null;
                  }
              ),
              CustomTextField(
                  controller: phoneController,
                  hint: "Enter User Phone",
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter your Phone";
                    } else if (!RegExp("^(?:[+0]9)?[0-9]{10}").hasMatch(value)) {
                      return "Enter Valid Phone";
                    }
                    return null;
                  }),
              FilledButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    if(image ==null){
                      return;
                    }
                    Contact.contact.add(Contact(image: image!, userName: nameController.text, phoneNumber: phoneController.text, email: emailController.text));
                    Navigator.pop(context);
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: AppColors.darkBlue,
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter user"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
