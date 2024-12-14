import 'dart:io';
import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_button.dart';
import 'package:bus_tracking_management_system/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final profileFormKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isEnabled = false;
  bool isSaving = false;
  File? _selectedImage;
  Map<String, dynamic>? userData;

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    userData = {
      "userName": "John Doe",
      "email": "john.doe@example.com",
      "imageUrl": "",
    };
    _firstNameController.text = userData?['userName'] ?? '';
    _emailController.text = userData?['email'] ?? '';
    setState(() {});
  }


  void _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(9),
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              children: <Widget>[
                const SizedBox(height: 30),
                ListTile(
                  onTap: () {
                    // _pickImageFromCamera();
                    Navigator.of(context).pop();
                  },
                  leading: const Icon(Icons.camera_alt, color: AppColors.primary),
                  title: const Text("Camera", style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  onTap: () {
                    // _pickImageFromGallery();
                    Navigator.of(context).pop();
                  },
                  leading: const Icon(Icons.image, color: AppColors.primary),
                  title: const Text("Gallery", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _saveInfo() {
    if (!profileFormKey.currentState!.validate()) return;

    setState(() {
      isSaving = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isSaving = false;
        isEnabled = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
         'Update Profile Screen',
         style: TextStyle(
           fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
         ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: profileFormKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                userData != null
                    ? Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: _selectedImage != null
                                      ? Image.file(
                                          _selectedImage!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(Icons.camera_alt, size: 50, color: AppColors.primary),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 100,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: IconButton(
                                    onPressed: _showPicker,
                                    icon: const Icon(Icons.edit, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            textAlign: TextAlign.center,
                            '${userData?['userName'] ?? ''}'.toUpperCase(),
                          style: const TextStyle(  fontWeight: FontWeight.w600,
                            fontSize: 18,),
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            controller: _firstNameController,
                            prefixIcon: Icons.person,
                            hintText: 'First Name',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter a valid name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: _emailController,
                            prefixIcon: Icons.email,
                            hintText: 'Email',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 40),
                          CustomButton(
                            onTap: isEnabled ? _saveInfo : null,
                            label: isSaving ? 'Saving...' : 'Save',
                            bgColor: isEnabled ? AppColors.primary : Colors.grey,
                            labelColor: Colors.white,
                          ),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
