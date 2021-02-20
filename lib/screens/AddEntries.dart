import 'package:flutter/material.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';


class AddEntries extends StatefulWidget {
  @override
  _AddEntriesState createState() => _AddEntriesState();
}

class _AddEntriesState extends State<AddEntries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTemplate(),
      appBar: AppBarTemplate("Add Entries"),
      body: AddEntriesPage(),
    );
  }
}

class AddEntriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("AddEntries"),     
    );
  }
}