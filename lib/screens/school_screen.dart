import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:bus_tracking_management_system/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class UniversityScreen extends StatelessWidget {
  const UniversityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: const CustomAppBar(
         title: "University",
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "UOG (University of Gujarat)",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Excellence in Education",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

            
              const Text(
                "Overview",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "UOG University is a prestigious institution known for its academic excellence and diverse community. Established in 1636, it offers a range of programs and research opportunities to shape the leaders of tomorrow.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              const Text(
                "Departments",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
               const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: [
                  _departmentChip("Computer Science"),
                  _departmentChip("Engineering"),
                  _departmentChip("Business"),
                  _departmentChip("Medicine"),
                  _departmentChip("Law"),
                  _departmentChip("Arts"),
                ],
              ),
               const SizedBox(height: 20),

               const Text(
                "Popular Courses",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
               const SizedBox(height: 10),
              _courseCard("Data Science", "Duration: 2 years", "\$15,000/year"),
               const SizedBox(height: 10),
              _courseCard("Business Administration", "Duration: 4 years", "\$20,000/year"),
               SizedBox(height: 10),
              _courseCard("Medicine", "Duration: 5 years", "\$30,000/year"),
               SizedBox(height: 20),

              // Events Section
               const Text(
                "Upcoming Events",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
               const SizedBox(height: 10),
              _eventCard("Tech Expo 2024", "Dec 5, 2024", "Explore cutting-edge innovations."),
              _eventCard("Alumni Meet", "Jan 20, 2025", "Reunion of Harvard alumni."),
               const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _departmentChip(String label) {
    return Chip(
      label: Text(label,style: const TextStyle(color: Colors.white),),
      backgroundColor: AppColors.primary,
    );
  }

  Widget _courseCard(String title, String duration, String fee) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(duration),
                Text(fee),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _eventCard(String title, String date, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.event, color: Colors.blueAccent),
        title: Text(title),
        subtitle: Text("$date\n$description"),
        isThreeLine: true,
      ),
    );
  }
}