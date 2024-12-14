import 'package:bus_tracking_management_system/screens/faqs_screen.dart';
import 'package:bus_tracking_management_system/screens/help_and_support_screen.dart';
import 'package:bus_tracking_management_system/screens/login_screen.dart';
import 'package:bus_tracking_management_system/screens/profile_details_screen.dart';
import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_button.dart';
import 'package:bus_tracking_management_system/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String username = '';
  String email = '';
  Map<String, dynamic>? userData;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CustomListTile(
                        onTap: () {
                          Get.to(() => const UpdateProfileScreen());
                        },
                        title: 'Update Profile',
                        icon: Icons.person_outline,
                      ),
                     

                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:
                  Column(
                    children: [
                      CustomListTile(
                        title: 'FAQs',
                        icon: Icons.help_outline,
                        onTap: () {
                          Get.to(()=>const FAQsScreen());

                        },
                      ),
                      CustomListTile(
                        title: 'Help And Support',
                        icon: Icons.support_agent_outlined,
                        onTap: () {

                          Get.to(()=>const HelpAndSupportScreen());
                        },
                      ),
                     
                    ],
                  ),
                ),
                 const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CustomListTile(
                        title: 'Logout',
                        icon: Icons.logout,
                        onTap: () {
                         _showLogoutConfirmationDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
  );}}
