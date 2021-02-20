import 'package:flutter/material.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';
import '../screens/Surveys.dart';
import '../screens/ProfileUpdate.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTemplate(),
      appBar: AppBarTemplate("Dashboard"),
      body: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            GestureDetector(
              child: Card(
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Surveys",style: TextStyle(fontSize: 20.0),)
                    ],
                  )
                ),
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => Surveys()
                ));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              child: Card(
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Edit Profile",style: TextStyle(fontSize: 20.0))
                    ],
                  )
                ),
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => ProfileUpdate()
                ));
              },
            )
          ],
        ),
      ),     
    );
  }
}