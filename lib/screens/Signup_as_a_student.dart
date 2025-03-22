import 'package:bus_tracking_management_system/screens/basic_signup_screen.dart';
import 'package:bus_tracking_management_system/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class StudentSignUpScreen extends StatefulWidget {
  @override
  State<StudentSignUpScreen> createState() => _StudentSignUpScreenState();
}

class _StudentSignUpScreenState extends State<StudentSignUpScreen> {
  final TextEditingController batchController = TextEditingController();

  final TextEditingController semesterController = TextEditingController();

  final TextEditingController routeController = TextEditingController();

  final TextEditingController routeFeeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseSignUpScreen(
      controllers: [
        batchController,
        semesterController,
        routeController,
        routeFeeController
      ],
      userType: 'Student',
      title: 'Student Add',
      additionalFields: [
        CustomTextFormField(
          controller: batchController,
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
          controller: semesterController,
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
          controller: routeController,
          hintText: 'Bus Stop/Route',
          prefixIcon: Icons.directions_bus,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Bus Stop/Route';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: routeFeeController,
          hintText: 'Route Fee',
          prefixIcon: Icons.directions_bus,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Route Fee';
            }
            return null;
          },
        ),
      ],
    );
  }
}
