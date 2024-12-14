import 'package:bus_tracking_management_system/screens/Signup_as_a_student.dart';
import 'package:bus_tracking_management_system/screens/login_screen.dart';
import 'package:bus_tracking_management_system/screens/signup_as_a_teacher.dart';
import 'package:bus_tracking_management_system/screens/signup_as_an_admin.dart';
import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectionSignupScreen extends StatefulWidget {
  const SelectionSignupScreen({super.key});

  @override
  State<SelectionSignupScreen> createState() => _SelectionSignupScreenState();
}

class _SelectionSignupScreenState extends State<SelectionSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                          onTap:(){ Get.to(()=> TeacherSignUpScreen());},
                          label: 'Signup as a teacher',
                          bgColor:  AppColors.primary,
                          labelColor: Colors.white,
                          borderRadius: 50,
                          height: 50,
                       ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          onTap:(){ Get.to(()=> StudentSignUpScreen());},
                          label: 'Signup as a student',
                          bgColor:  AppColors.primary,
                          labelColor: Colors.white,
                          borderRadius: 50,
                          height: 50,
                       ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          onTap:(){ Get.to(()=> AdminSignUpScreen());},
                          label: 'Signup as an admin',
                          bgColor:  AppColors.primary,
                          labelColor: Colors.white,
                          borderRadius: 50,
                          height: 50,
                       ),
                      const SizedBox(
                        height: 12,
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
                              Get.to(()=>const SignInScreen());
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
    );
  }
}