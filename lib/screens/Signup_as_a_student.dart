import 'package:bus_tracking_management_system/screens/basic_signup_screen.dart';
import 'package:bus_tracking_management_system/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class StudentSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseSignUpScreen(
      userType: 'Student',
      title: 'Student Signup',
      additionalFields: [
        CustomTextFormField(
          controller: TextEditingController(),
          hintText: 'Batch/Session',
          prefixIcon: Icons.school,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Batch/Session';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: TextEditingController(),
          hintText: 'Semester',
          prefixIcon: Icons.calendar_today,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Semester';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: TextEditingController(),
          hintText: 'Bus Stop/Route',
          prefixIcon: Icons.directions_bus,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Bus Stop/Route';
            }
            return null;
          },
        ),
      ],
    );
  }
}
