import 'package:bus_tracking_management_system/screens/admin_dashboard.dart';
import 'package:bus_tracking_management_system/screens/live_bus_tracking_screen.dart';
import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_app_bar.dart';
import 'package:bus_tracking_management_system/widgets/custom_bar_chart.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  final String studentName = "John Doe";
  final String batch = "Batch 2023";
  final String semester = "6th Semester";
  final String route = "Route A - Stop 3";
  final int creditsUsed = 350;
  final int totalCredits = 1000; 


final List<ChartData> chartData = [
    ChartData(DateTime(2024, 11, 1), 120),
    ChartData(DateTime(2024, 11, 2), 150),
    ChartData(DateTime(2024, 11, 3), 100),
    ChartData(DateTime(2024, 11, 4), 180),
    ChartData(DateTime(2024, 11, 5), 200),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
         title: "Dashboard",
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              _buildProfileSection(),
              const SizedBox(height: 16),
              
          
              _buildLiveTrackingButton(context),
              const SizedBox(height: 16),
              
      
              _buildNotificationsSection(),
              const SizedBox(height: 16),
              
     
              _buildBarGraph(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildProfileSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Name: $studentName"),
            Text("Batch: $batch"),
            Text("Semester: $semester"),
            Text("Route: $route"),
          ],
        ),
      ),
    );
  }


  Widget _buildLiveTrackingButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LiveTrackingScreen()),
        );
      },
      child: const Text("Live Bus Tracking"),
    );
  }

  Widget _buildNotificationsSection() {
    final List<String> notifications = [
      "Bus Route A delayed by 10 mins.",
      "Your stop time updated to 7:30 AM.",
      "New route added for students in Batch 2024."
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Notifications",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(notifications[index]),
            );
          },
        ),
      ],
    );
  }


 Widget _buildBarGraph() {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Credit Usage",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: CustomBarChart(
              chartData: chartData,
              header: "Bus Usage",
              title: "Bus Tracking Usage",
              value: "5 Days",
              color: AppColors.primary,
              showSubTitle: true,
              enableZoom: true,
            ),
          ),
        ],
      ),
    ),
  );
}

}





