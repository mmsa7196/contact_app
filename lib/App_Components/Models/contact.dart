import 'dart:io';

class Contact {
  File image;
  String userName;
  String phoneNumber;
  String email;

  Contact({required this.image,required this.userName,required this.phoneNumber,required this.email});
  static List<Contact> contact = [];
}
