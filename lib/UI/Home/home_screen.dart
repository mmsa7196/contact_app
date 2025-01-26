import 'package:contact_app/App_Components/App_Assets/app_assets.dart';
import 'package:contact_app/App_Components/App_Colors/app_colors.dart';
import 'package:contact_app/App_Components/Models/contact.dart';
import 'package:contact_app/UI/widgets/bottom_sheet_widgets.dart';
import 'package:contact_app/UI/widgets/contact_card.dart';
import 'package:contact_app/UI/widgets/empty_list_widgets.dart';
import 'package:flutter/material.dart';

//ignore:must_be_immutable
class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext contact) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                AppAssets.route,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            Contact.contact.isEmpty
                ? const EmptyListWidgets()
                : Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.7),
                      itemBuilder: (context, index) => ContactCard(
                          onClick: (int index) {
                            Contact.contact.removeAt(index);
                            setState(() {});
                          },
                          contact: Contact.contact[index],
                          index: index),
                      itemCount: Contact.contact.length,
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: Contact.contact.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                Contact.contact.removeAt(Contact.contact.length - 1);
                setState(() {});
              },
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              child: const Icon(Icons.delete),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: Contact.contact.length < 6,
            child: FloatingActionButton(
              onPressed: () {
                _showModaleBottonSheet();
              },
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _showModaleBottonSheet() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkBlue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      isDismissible: true,
      builder: (contact) => BottomSheetWidgets(),
    );
    setState(() {});
  }
}
