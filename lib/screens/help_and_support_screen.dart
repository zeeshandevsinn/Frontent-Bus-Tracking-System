import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Help & Support',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('Frequently Asked Questions (FAQs)'),
            buildSupportOption(
              'How to create an account?',
              'Learn how to sign up and start using our app in just a few simple steps.',
              Icons.account_circle,
            ),
            buildSupportOption(
              'Payment methods accepted',
              'Find out which payment options are available for your purchases.',
              Icons.payment,
            ),
            const SizedBox(height: 20),
            buildSectionTitle('Troubleshooting'),
            buildSupportOption(
              'App not loading?',
              'Follow these steps to resolve common loading issues.',
              Icons.warning,
            ),
            buildSupportOption(
              'Forgot your password?',
              'Instructions on how to reset your password quickly and securely.',
              Icons.lock_reset,
            ),
            const SizedBox(height: 20),
            const Text(
              'If you have any other questions or need further assistance, please don’t hesitate to reach out to us. Our support team is here to help you 24/7.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSupportOption(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
      onTap: () {

      },
    );
  }
}
