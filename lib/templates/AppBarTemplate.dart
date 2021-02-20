import 'package:astro_app/screens/Login.dart';
import 'package:flutter/material.dart';
import '../utils/Constants.dart';

class AppBarTemplate extends StatelessWidget with PreferredSizeWidget {

  final title;

  AppBarTemplate(this.title);

  final prefs = Constants.prefs;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.title),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {
            prefs.clear();
            Navigator.push(context,MaterialPageRoute(builder: (context)=> Login()));
          },
          icon: Icon(Icons.logout),
        )
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
