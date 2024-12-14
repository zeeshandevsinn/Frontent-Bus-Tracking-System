import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RoutesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> routes = [
    {
      "routeName": "Route A",
      "startingPoint": "Main Campus",
      "endingPoint": "City Center",
      "stops": 8,
    },
    {
      "routeName": "Route B",
      "startingPoint": "North Gate",
      "endingPoint": "Suburb Area",
      "stops": 5,
    },
    {
      "routeName": "Route C",
      "startingPoint": "Library",
      "endingPoint": "South Gate",
      "stops": 10,
    },
    {
      "routeName": "Route D",
      "startingPoint": "Hostels",
      "endingPoint": "Market Area",
      "stops": 7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      const CustomAppBar(
         title: "Bus Routes",
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Bus Routes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  final route = routes[index];
                  return _buildRouteCard(route);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteCard(Map<String, dynamic> route) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              route['routeName'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Starting Point: ${route['startingPoint']}"),
            Text("Ending Point: ${route['endingPoint']}"),
            Text("Number of Stops: ${route['stops']}"),
          ],
        ),
      ),
    );
  }
}
