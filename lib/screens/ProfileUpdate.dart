import 'package:flutter/material.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';


class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTemplate(),
      appBar: AppBarTemplate("Update Profile"),
      body: ProfileUpdatePage(),
    );
  }
}

class ProfileUpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("ProfileUpdate"),     
    );
  }
}