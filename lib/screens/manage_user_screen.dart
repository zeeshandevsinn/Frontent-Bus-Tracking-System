import 'dart:developer';

import 'package:bus_tracking_management_system/screens/Signup_as_a_student.dart';
import 'package:bus_tracking_management_system/screens/add_driver_screen.dart';
import 'package:bus_tracking_management_system/screens/signup_as_a_teacher.dart';
import 'package:bus_tracking_management_system/screens/signup_screen.dart';
import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ManageUsersScreen extends StatelessWidget {
  final List<Map<String, String>> users = [
    {"id": "1", "name": "John Doe", "email": "john.doe@example.com"},
    {"id": "2", "name": "Jane Smith", "email": "jane.smith@example.com"},
    {"id": "3", "name": "Michael Brown", "email": "michael.brown@example.com"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Manage Users',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection("Students", "students", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentSignUpScreen()),
                );
              }),
              SizedBox(height: 20),
              _buildSection("Teachers", "teachers", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherSignUpScreen()),
                );
              }),
              SizedBox(height: 20),
              _buildSection("Drivers", "drivers", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDriverScreen()),
                );
              }),
            ],
          ),
        ),
      ),
      //  Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           // Navigate to Add New User screen
      //         },
      //         child: const Text("Add New User"),
      //       ),
      //       const SizedBox(height: 16),
      //       Expanded(
      //         child: ListView.builder(
      //           itemCount: users.length,
      //           itemBuilder: (context, index) {
      //             final user = users[index];
      //             return Card(
      //               elevation: 4,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //               child: ListTile(
      //                 title: Text(user["name"]!),
      //                 subtitle: Text(user["email"]!),
      //                 trailing: IconButton(
      //                   icon: const Icon(Icons.delete),
      //                   onPressed: () {
      //                     // Handle delete user logic
      //                   },
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildSection(String title, String collection, final onPressed) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(Icons.add, color: Colors.blue, size: 28),
                    onPressed: onPressed),
              ],
            ),
            SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream: collection == 'driver'
                  ? FirebaseFirestore.instance.collection('driver').snapshots()
                  : FirebaseFirestore.instance
                      .collection('admin')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .collection(collection)
                      .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No $title Found"));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    log("Data: $data");
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade200,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(data['name'] ?? "No Name"),
                      subtitle: Text(data['email'] ?? "No Email"),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
