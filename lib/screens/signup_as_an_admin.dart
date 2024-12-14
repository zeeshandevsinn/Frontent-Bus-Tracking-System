import 'package:bus_tracking_management_system/screens/basic_signup_screen.dart';
import 'package:bus_tracking_management_system/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AdminSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseSignUpScreen(
      userType: 'Admin',
      title: 'Admin Signup',
      additionalFields: [
        CustomTextFormField(
          controller: TextEditingController(),
          hintText: 'Admin ID',
          prefixIcon: Icons.security,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Admin ID';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: TextEditingController(),
          hintText: 'Role',
          prefixIcon: Icons.admin_panel_settings,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Role';
            }
            return null;
          },
        ),
      ],
    );
  }
}
