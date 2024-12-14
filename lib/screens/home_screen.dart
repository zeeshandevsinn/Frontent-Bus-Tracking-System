import 'package:bus_tracking_management_system/screens/admin_dashboard.dart';
import 'package:bus_tracking_management_system/screens/dashboard_screen.dart';
import 'package:bus_tracking_management_system/screens/login_screen.dart';
import 'package:bus_tracking_management_system/screens/payment_screen.dart';
import 'package:bus_tracking_management_system/screens/routes_screen.dart';
import 'package:bus_tracking_management_system/screens/school_screen.dart';
import 'package:bus_tracking_management_system/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  var userType;
   HomeScreen({super.key,required this.userType});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  late String title;
   late Widget currentScreen;
     @override
  void initState() {
    title = "DashBoard";
    currentScreen =  (widget.userType == 'Student')?StudentDashboard():(widget.userType == 'Teacher')?StudentDashboard():(widget.userType == 'Admin')?AdminDashboard():StudentDashboard();
    print('userType:${widget.userType}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
                  appBar: SliderAppBar(
                      appBarColor: Colors.white,
                      title: Text(title,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700))),
                  key: _sliderDrawerKey,
                  sliderOpenSize: 179,
                  slider: _SliderView(
                    onItemClick: (title) {
                      _sliderDrawerKey.currentState!.closeSlider();
                      setState(() {
                        this.title = title;
                        currentScreen = _getScreenForTitle(title);
                      });
                    },
                  ),
                  child: currentScreen),
      ),
    );
  }

     Widget _getScreenForTitle(String title) {
    switch (title) {
      case 'DashBoard':
        return (widget.userType == 'Student')?StudentDashboard():(widget.userType == 'Teacher')?StudentDashboard():(widget.userType == 'Admin')?AdminDashboard():StudentDashboard();
      case 'University':
        return const UniversityScreen();
      case 'Payments':
        return PaymentScreen();
      case 'Routes':
        return RoutesScreen(); 
      case 'Setting':
        return SettingsScreen(); 
      case 'LogOut':
         _showLogoutConfirmationDialog(context);
          return currentScreen;
      default:
        return StudentDashboard();
    }
  }
}



class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRreQE9uAp3oKzq4bYl_9JObHmVSCflmRif4CRDBerIn9368m13GEaf5gdi6lazTD7Qn3w&usqp=CAU')
                  .image,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'John',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...[
            Menu(Icons.home, 'DashBoard'),
            Menu(Icons.school, 'University'),
            Menu(Icons.payment, 'Payments'),
            Menu(Icons.route, 'Routes'),
            Menu(Icons.settings, 'Setting'),
            Menu(Icons.arrow_back_ios, 'LogOut')
          ]
              .map((menu) => _SliderMenuItem(
                  title: menu.title,
                  iconData: menu.iconData,
                  onTap: onItemClick))
              .toList(),
        ],
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title,
            style: const TextStyle(
                color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
        leading: Icon(iconData, color: Colors.black),
        onTap: () => onTap?.call(title));
  }
}

class _AuthorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Quotes> quotesList = [];
    quotesList.add(Quotes(Colors.amber, 'Amelia Brown',
        'Life would be a great deal easier if dead things had the decency to remain dead.'));
    quotesList.add(Quotes(Colors.orange, 'Olivia Smith',
        'That proves you are unusual," returned the Scarecrow'));
    quotesList.add(Quotes(Colors.deepOrange, 'Sophia Jones',
        'Her name badge read: Hello! My name is DIE, DEMIGOD SCUM!'));
    quotesList.add(Quotes(Colors.red, 'Isabella Johnson',
        'I am about as intimidating as a butterfly.'));
    quotesList.add(Quotes(Colors.purple, 'Emily Taylor',
        'Never ask an elf for help; they might decide your better off dead, eh?'));
    quotesList
        .add(Quotes(Colors.green, 'Maya Thomas', 'Act first, explain later'));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (builder, index) {
            return LimitedBox(
              maxHeight: 150,
              child: Container(
                decoration: BoxDecoration(
                    color: quotesList[index].color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        quotesList[index].author,
                        style: const TextStyle(
                            fontFamily: 'BalsamiqSans_Blod',
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        quotesList[index].quote,
                        style: const TextStyle(
                            fontFamily: 'BalsamiqSans_Regular',
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (builder, index) {
            return const Divider(
              height: 10,
              thickness: 0,
            );
          },
          itemCount: quotesList.length),
    );
  }
}

class Quotes {
  final MaterialColor color;
  final String author;
  final String quote;

  Quotes(this.color, this.author, this.quote);
}

class Menu {
  final IconData iconData;
  final String title;

  Menu(this.iconData, this.title);
}


void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Get.offAll(() => const SignInScreen());
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
