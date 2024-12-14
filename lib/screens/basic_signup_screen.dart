import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_app_bar.dart';
import 'package:bus_tracking_management_system/widgets/custom_button.dart';
import 'package:bus_tracking_management_system/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class BaseSignUpScreen extends StatefulWidget {
  final String title;
  final List<Widget> additionalFields;
final String userType;

  BaseSignUpScreen({required this.title, required this.additionalFields, required this.userType});

  @override
  State<BaseSignUpScreen> createState() => _BaseSignUpScreenState();
}

class _BaseSignUpScreenState extends State<BaseSignUpScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool areFieldsValid() {
   return _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
         title: widget.title,
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Create your Account',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: nameController,
                    hintText: 'Name',
                    prefixIcon: Icons.person,
                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Email',
                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    suffixIcon: isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixIconColor: Colors.black,
                     onTapSuffixIcon: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    controller: passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                     obscureText: !isPasswordVisible, 
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                   const SizedBox(height: 20),
                  ...widget.additionalFields,
                  const SizedBox(height: 20),
                  CustomButton(
                     onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Get.to(() => SignInScreen(userType: widget.userType));
                      }
                    },
                    label: 'Register',
                    bgColor:  AppColors.primary,
                    labelColor: Colors.white,
                      borderRadius: 50,
                      height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
