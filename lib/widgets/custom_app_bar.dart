import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
       shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      automaticallyImplyLeading: false, 
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
