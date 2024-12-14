import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Add New User screen
              },
              child: const Text("Add New User"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(user["name"]!),
                      subtitle: Text(user["email"]!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Handle delete user logic
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
