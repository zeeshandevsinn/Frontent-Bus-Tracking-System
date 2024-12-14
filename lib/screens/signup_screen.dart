import 'package:bus_tracking_management_system/screens/login_screen.dart';
import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_button.dart';
import 'package:bus_tracking_management_system/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkValue = false;
    TextEditingController emailController=TextEditingController();
  TextEditingController passWordController=TextEditingController();
  TextEditingController nameController=TextEditingController();

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Create your Account',
                   style: TextStyle( fontSize: 50,
                    fontWeight: FontWeight.bold,),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormField(
                    controller:nameController,
                    hintText: 'Name',
                      prefixIcon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    hintText:'Email' ,
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
                    controller: passWordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
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
                           if(mounted){
                             setState(() {
                              checkValue = value!;
                            });
                           }
                          }),
                      const Text(
                      'Remember me',
                       style: TextStyle( fontWeight: FontWeight.w600,),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),CustomButton(
                      onTap:(){Get.to(()=>const SignInScreen());},
                      label: 'Register',
                      bgColor:  AppColors.primary,
                      labelColor: Colors.white,
                      borderRadius: 50,
                      height: 50,
                   ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account ?  ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Get.to(()=>const SignInScreen());
                            },
                          text: 'Sign In',
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
