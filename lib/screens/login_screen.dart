import 'package:bus_tracking_management_system/screens/home_screen.dart';
import 'package:bus_tracking_management_system/screens/selection_screen.dart';
import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_button.dart';
import 'package:bus_tracking_management_system/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  final String? userType;
  const SignInScreen({
    super.key,
    this.userType,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool checkValue = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                    'Login to your Account',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    controller: passWordController,
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
                  Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.primary,
                        value: checkValue,
                        onChanged: (value) {
                          if (mounted) {
                            setState(() {
                              checkValue = value!;
                            });
                          }
                        },
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onTap: () {
                      // Validate the form
                      if (_formKey.currentState!.validate()) {
                        // If validation passes, navigate to the respective dashboard
                        if (widget.userType == 'Student') {
                          Get.to(() => HomeScreen(userType: widget.userType));
                        } else if (widget.userType == 'Teacher') {
                          Get.to(() => HomeScreen(userType: widget.userType));
                        } else if (widget.userType == 'Admin') {
                          Get.to(() => HomeScreen(userType: widget.userType));
                        } else {
                          Get.to(() => HomeScreen(userType: widget.userType));
                        }
                      }
                    },
                    label: 'Login',
                    bgColor: AppColors.primary,
                    labelColor: Colors.white,
                    borderRadius: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account ?  ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => const SelectionSignupScreen());
                            },
                          text: 'Sign Up',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
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
