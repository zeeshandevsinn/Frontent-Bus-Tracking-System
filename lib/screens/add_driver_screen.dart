import 'package:bus_tracking_management_system/screens/admin_dashboard.dart';
import 'package:bus_tracking_management_system/screens/home_screen.dart';
import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDriverScreen extends StatefulWidget {
  @override
  _AddDriverScreenState createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _isPasswordVisible = false;

  final List<String> areas = [
    "New York",
    "Los Angeles",
    "Chicago",
    "Houston",
    "Miami"
  ];
  final Map<String, List<Map<String, String>>> routesByArea = {
    "New York": [
      {"route": "Manhattan Express", "id": "NY-001"},
      {"route": "Brooklyn Line", "id": "NY-002"},
    ],
    "Los Angeles": [
      {"route": "Hollywood Route", "id": "LA-001"},
      {"route": "Beverly Hills Shuttle", "id": "LA-002"},
    ],
    "Chicago": [
      {"route": "Downtown Loop", "id": "CH-001"},
      {"route": "North Side Express", "id": "CH-002"},
    ],
    "Houston": [
      {"route": "Energy Corridor Line", "id": "HO-001"},
      {"route": "Medical Center Route", "id": "HO-002"},
    ],
    "Miami": [
      {"route": "South Beach Route", "id": "MI-001"},
      {"route": "Downtown Miami Loop", "id": "MI-002"},
    ],
  };

  String? selectedArea;
  String? selectedRoute;
  String? routeId;

  TextEditingController busNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Set background color
      appBar: AppBar(
        title: Text("Add Driver", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDropdownField(
                  label: "Select Area",
                  value: selectedArea,
                  items: areas,
                  onChanged: (value) {
                    setState(() {
                      selectedArea = value;
                      selectedRoute = null;
                      routeId = null;
                    });
                  },
                ),
                SizedBox(height: 10),
                _buildTextField(
                  controller: busNumberController,
                  label: "Bus Number",
                  hintText: "Enter bus number",
                  icon: Icons.directions_bus,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  controller: nameController,
                  label: "Driver Name",
                  hintText: "Enter driver name",
                  icon: Icons.person,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  controller: emailController,
                  label: "Driver Email",
                  hintText: "Enter driver email",
                  icon: Icons.email,
                ),
                SizedBox(height: 10),
                _buildPasswordField(),
                SizedBox(height: 10),
                _buildDropdownField(
                  label: "Select Route",
                  value: selectedRoute,
                  items: selectedArea != null
                      ? routesByArea[selectedArea]!
                          .map((route) => route["route"]!)
                          .toList()
                      : [],
                  onChanged: (value) {
                    setState(() {
                      selectedRoute = value;
                      routeId = routesByArea[selectedArea]!
                          .firstWhere((route) => route["route"] == value)["id"];
                    });
                  },
                ),
                if (routeId != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Route ID: $routeId",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                  ),
                SizedBox(height: 20),
                CustomButton(
                  isLoading: isLoading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      addDriver();
                    }
                  },
                  label: 'Add Driver',
                  bgColor: Colors.black,
                  labelColor: AppColors.primary,
                  borderRadius: 50,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String label,
      required String hintText,
      required IconData icon}) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white38),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
      validator: (value) => value!.isEmpty ? "Please enter $label" : null,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: !_isPasswordVisible,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.white70),
        hintText: "Enter password",
        hintStyle: TextStyle(color: Colors.white38),
        prefixIcon: Icon(Icons.lock, color: Colors.white70),
        suffixIcon: IconButton(
          icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.white70),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
      validator: (value) => value!.isEmpty ? "Please enter password" : null,
    );
  }

  Widget _buildDropdownField(
      {required String label,
      required String? value,
      required List<String> items,
      required Function(String?) onChanged}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
      dropdownColor: AppColors.primary,
      value: value,
      items: items.map((item) {
        return DropdownMenuItem(
            value: item,
            child: Text(item, style: TextStyle(color: Colors.white)));
      }).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? "Please select $label" : null,
    );
  }

  Future<void> addDriver() async {
    setState(() => isLoading = true);
    try {
      await FirebaseFirestore.instance.collection('drivers').add({
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "name": nameController.text.trim(),
        "busNumber": busNumberController.text.trim(),
        "areaName": selectedArea,
        "routeName": selectedRoute,
        "routeId": routeId
      });

      Get.snackbar("Success", "Driver Added Successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
      Navigator.pop(context);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    setState(() => isLoading = false);
  }
}
