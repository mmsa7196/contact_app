import 'package:contact_app/App_Components/App_Colors/app_colors.dart';
import 'package:contact_app/App_Components/Models/contact.dart';
import 'package:flutter/material.dart';
//ignore:must_be_immutable
class ContactCard extends StatelessWidget {
  Contact contact;
  int index;
  Function onClick;
  ContactCard({required this.contact, required this.index,required this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                  child: Image.file(
            contact.image,
            fit: BoxFit.cover,
            width:double.infinity,
          ),
              ),
          ),

          Padding(padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.person,color: AppColors.darkBlue,),
                  const SizedBox(width: 8,),
                  Expanded(child: Text(contact.userName,style:const TextStyle(fontSize: 16))),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.email,color: AppColors.darkBlue,),
                  const SizedBox(width: 8,),
                  Expanded(child: Text(contact.email,style:const TextStyle(fontSize: 16))),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.phone_in_talk,color: AppColors.darkBlue,),
                  const SizedBox(width: 8,),
                  Expanded(child: Text(contact.phoneNumber,style:const TextStyle(fontSize: 16))),
                ],
              ),
              FilledButton(onPressed: () {
                onClick(index);
              },
                style:FilledButton.styleFrom(
                  backgroundColor: AppColors.red,
                  foregroundColor: AppColors.white,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ) ,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 8,),
                  Text("Delete"),
                ],
              ),
              ),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
