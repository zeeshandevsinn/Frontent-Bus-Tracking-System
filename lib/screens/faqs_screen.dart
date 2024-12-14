import 'package:bus_tracking_management_system/utils/consts.dart';
import 'package:flutter/material.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'FAQs',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildQuestionAnswer(
              '1. What is the UOG Mobile App?',
              'The UOG Mobile App is a bus tracking and student route management application designed to enhance the transportation experience for students and staff at the University of Gujrat. It provides real-time bus tracking, route optimization, and notifications.',
            ),
            buildQuestionAnswer(
              '2. Who can log in to the app?',
              'The app supports three types of logins: Students, Faculty/Teachers, and Admin/Others. Students and faculty log in via LMS, while others log in through WebUOGIS.',
            ),
            buildQuestionAnswer(
              '3. How do I track my bus?',
              'You can track your bus in real-time by selecting the "Live Bus Tracking" feature. This will show the current location of your bus on the map.',
            ),
            buildQuestionAnswer(
              '4. What are the time intervals for live tracking?',
              'Live tracking is available during the following time intervals:\n- 6:00 AM to 9:00 AM\n- 9:00 AM to 10:00 AM\n- 11:30 AM to 1:00 PM',
            ),
            buildQuestionAnswer(
              '5. How many times can I track the bus in a month?',
              'Students using the free version have a limit of 1000 hits per month to check live tracking. The app will notify you when you are close to your limit.',
            ),
            buildQuestionAnswer(
              '6. Can I file a complaint about the bus service?',
              'Yes, you can file a complaint regarding the bus service through the "Complaints" section in the app. Provide details about the issue for resolution.',
            ),
            buildQuestionAnswer(
              '7. Will I receive notifications about bus delays?',
              'Yes, the app sends notifications to inform you about route changes or bus delays. It also updates the location of the bus every 10 seconds during live tracking.',
            ),
            buildQuestionAnswer(
              '8. Is there a free version of the app?',
              'Yes, the free version of the app provides all essential features, including live tracking with a limit of 1000 hits per month.',
            ),
            buildQuestionAnswer(
              '9. What mapping services does the app use?',
              'The app uses OpenStreetMap (free) and Google Maps (paid) for tracking and displaying routes.',
            ),
            buildQuestionAnswer(
              '10. How is my profile information used?',
              'Your profile information, including your name, batch/session, semester, and route/bus stop, is used to provide personalized features like route optimization and notifications.',
            ),
            buildQuestionAnswer(
              '11. Can I update my route or bus stop information?',
              'Yes, you can update your route or bus stop information in the "Profile" section of the app.',
            ),
            buildQuestionAnswer(
              '12. What should I do if I cannot log in?',
              'Ensure you are using the correct login credentials for LMS or WebUOGIS. If you still face issues, contact the support team for assistance.',
            ),
            buildQuestionAnswer(
              '13. How do I contact support?',
              'You can contact support through the "Help" section in the app. Support is available via email or phone to assist you with any issues.',
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'These FAQs are designed to address common questions for the UOG Mobile App. If you have additional queries, please contact support.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestionAnswer(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          answer,
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
