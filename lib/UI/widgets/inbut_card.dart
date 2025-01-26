import 'dart:io';

import 'package:contact_app/App_Components/App_Assets/app_assets.dart';
import 'package:contact_app/App_Components/App_Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//ignore:must_be_immutable
class InbutCard extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  File? image;
  Function onClick;
  InbutCard(
      {required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.onClick,
      this.image,
      super.key});

  @override
  State<InbutCard> createState() => _InbutCardState();
}

class _InbutCardState extends State<InbutCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              await widget.onClick();
              setState(() {});
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 3,
                      color: AppColors.gold,
                    ),
                  ),
                  child: widget.image == null
                      ? Lottie.asset(AppAssets.picker)
                      : Image.file(
                          widget.image!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: widget.nameController,
                  builder: (context, value, child) => Text(
                    value.text.isEmpty ? "User Name" : value.text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gold),
                  ),
                ),
                const Divider(
                  color: AppColors.gold,
                ),
                ValueListenableBuilder(
                  valueListenable: widget.emailController,
                  builder: (context, value, child) => Text(
                    value.text.isEmpty ? "example@email.com" : value.text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gold),
                  ),
                ),
                const Divider(
                  color: AppColors.gold,
                ),
                ValueListenableBuilder(
                  valueListenable: widget.phoneController,
                  builder: (context, value, child) => Text(
                    value.text.isEmpty ? "+200000000000" : value.text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gold),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
