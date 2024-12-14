import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:flutter/material.dart';

class LiveTrackingScreen extends StatelessWidget {
  const LiveTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          'Live Bus Tracking',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: Text("Map Interface Coming Soon!")),
    );
  }
}