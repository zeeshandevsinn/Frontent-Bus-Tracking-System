import 'package:bus_tracking_management_system/screens/complain_management_screen.dart';
import 'package:bus_tracking_management_system/screens/live_bus_tracking_screen.dart';
import 'package:bus_tracking_management_system/screens/manage_user_screen.dart';
import 'package:bus_tracking_management_system/widgets/custom_app_bar.dart';
import 'package:bus_tracking_management_system/widgets/custom_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:bus_tracking_management_system/utils/consts.dart';

class AdminDashboard extends StatelessWidget {
  final int totalBuses = 10;
  final int activeRoutes = 5;
  final int totalUsers = 500;
  final int pendingComplaints = 15;


  final List<ChartData> chartData = [
    ChartData(DateTime(2024, 1, 1), 10),
    ChartData(DateTime(2024, 2, 1), 20),
    ChartData(DateTime(2024, 3, 1), 15),
    ChartData(DateTime(2024, 4, 1), 25),
    ChartData(DateTime(2024, 5, 1), 30),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        const CustomAppBar(
         title: "DashBoard",
        backgroundColor: AppColors.primary,
      ),
    
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOverviewSection(),
              const SizedBox(height: 16),
              _buildChartSection(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ _buildLiveTrackingSection(context),
              _buildUserManagementSection(context),
              
              ],),
              const SizedBox(height: 16),
              _buildComplaintManagementSection(context),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildOverviewSection() {
  final List<Map<String, dynamic>> overviewData = [
    {"title": "Students", "value": "1200", "icon": Icons.person},
    {"title": "Buses", "value": "25", "icon": Icons.directions_bus},
    {"title": "Routes", "value": "10", "icon": Icons.map},
    {"title": "Complaints", "value": "45", "icon": Icons.report_problem},
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overview",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 1.5, // Adjust the height-to-width ratio
          ),
          itemCount: overviewData.length,
          itemBuilder: (context, index) {
            final data = overviewData[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      data["icon"],
                      size: 20,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data["value"],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data["title"],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}

  Widget _buildChartSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Monthly Activity",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: CustomBarChart(
                chartData: chartData,
                header: "Monthly Activity Overview",
                title: "Activity",
                value: "Count",
                color: AppColors.primary,
                showSubTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTile(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(title),
      ],
    );
  }

Widget _buildLiveTrackingSection(BuildContext context) {
  return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Colors.blue.shade50,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Live Bus Tracking",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LiveTrackingScreen()),
              );
            },
            child: const Text(
              "View",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildUserManagementSection(BuildContext context) {
  return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Colors.green.shade50,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "User Management",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ManageUsersScreen()),
              );
            },
            child: const Text(
              "View",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildComplaintManagementSection(BuildContext context) {
  return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Colors.red.shade50,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Complaint Management",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ManageComplaintsScreen()),
                  );
                },
                child: const Text(
                  "View",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

}

