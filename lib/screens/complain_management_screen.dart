import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:flutter/material.dart';

class ManageComplaintsScreen extends StatelessWidget {
  final List<Map<String, String>> complaints = [
    {"id": "1", "subject": "Bus late", "status": "Pending"},
    {"id": "2", "subject": "Overcrowded bus", "status": "Resolved"},
    {"id": "3", "subject": "Driver rude", "status": "Pending"},
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
          'Complaint Management',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Complaints",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  final complaint = complaints[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(complaint["subject"]!),
                      subtitle: Text("Status: ${complaint["status"]}"),
                      trailing: complaint["status"] == "Pending"
                          ? IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {
                                // Mark complaint as resolved
                              },
                            )
                          : null,
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
