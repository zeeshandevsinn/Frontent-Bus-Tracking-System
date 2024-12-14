import 'dart:ui';

import 'package:bus_tracking_management_system/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors{
// Color primary =  Color.fromARGB(255, 0x0f, 0x0b, 0x5e);
  // static const Color primary = Color(0xfff4800f);
   static const Color primary = Color.fromARGB(255, 0x0f, 0x0b, 0x5e);
  static const Color lightPrimary = Color(0x99514EB6);
  static const Color secondary = Color(0xffFFD600);
  static const Color grey = Color(0xffF6F6F8);


}


 void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Get.offAll(() => const SignInScreen());
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );}