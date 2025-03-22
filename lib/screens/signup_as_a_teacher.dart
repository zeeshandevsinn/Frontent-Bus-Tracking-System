import 'package:bus_tracking_management_system/screens/basic_signup_screen.dart';
import 'package:bus_tracking_management_system/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TeacherSignUpScreen extends StatelessWidget {
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseSignUpScreen(
      controllers: [departmentController, designationController],
      userType: 'Teacher',
      title: 'Teacher Add',
      additionalFields: [
        CustomTextFormField(
          controller: TextEditingController(),
          hintText: 'Department',
          prefixIcon: Icons.business,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Department';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: TextEditingController(),
          hintText: 'Designation',
          prefixIcon: Icons.work,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Designation';
            }
            return null;
          },
        ),
      ],
    );
  }
}
