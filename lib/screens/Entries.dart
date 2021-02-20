import 'package:flutter/material.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';


class Entries extends StatefulWidget {
  @override
  _EntriesState createState() => _EntriesState();
}

class _EntriesState extends State<Entries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTemplate(),
      appBar: AppBarTemplate("Survey Entries"),
      body: EntriesPage(),
    );
  }
}

class EntriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Entries"),     
    );
  }
}