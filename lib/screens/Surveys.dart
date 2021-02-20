import 'package:flutter/material.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';


class Surveys extends StatefulWidget {
  @override
  _SurveysState createState() => _SurveysState();
}

class _SurveysState extends State<Surveys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTemplate(),
      appBar: AppBarTemplate("Surveys"),
      body: SurveysPage(),
    );
  }
}

class SurveysPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Surveys"),     
    );
  }
}