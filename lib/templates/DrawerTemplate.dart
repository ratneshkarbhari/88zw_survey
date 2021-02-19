import 'package:flutter/material.dart';
import '../screens/ProfileUpdate.dart';
import '../screens/Dashboard.dart';
import '../screens/Surveys.dart';


class DrawerTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Ratnesh Karbhari"),
            accountEmail: Text("ratneshkarbhari23@gmail.com"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Dashboard()));
            },
            title: Text("Dashboard"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Surveys()));
            },
            title: Text("Surveys"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileUpdate()));
            },
            title: Text("Edit Profile"),
          ),
          
        ],
      ),
    );
  }
}
