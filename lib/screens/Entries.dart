import 'dart:convert';
import './AddEntries.dart';
import 'package:flutter/material.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';
import 'package:http/http.dart' as http;
import '../utils/Constants.dart';

class Entries extends StatefulWidget {
  final surveyId;
  Entries(this.surveyId);

  @override
  _EntriesState createState() => _EntriesState(this.surveyId);
}

class _EntriesState extends State<Entries> {
  final surveyId;
  _EntriesState(this.surveyId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTemplate(),
      appBar: AppBarTemplate("Survey Entries"),
      body: EntriesPage(this.surveyId),
    );
  }
}

class EntriesPage extends StatefulWidget {
  final surveyId;
  EntriesPage(this.surveyId);

  @override
  _EntriesPageState createState() => _EntriesPageState();
}

class _EntriesPageState extends State<EntriesPage> {
  var surveyEntries;

  

  Future _fetchEntiresExe() async {
    var apiUrl = Constants.url + '/fetch-all-survey-entries';
    var apiKey = "bb9c2fe9125fe3a500b8a8711adfc9c3";
    var params = {
      "apiKey": apiKey,
      "survey_id": this.widget.surveyId
    };
    var entriesForSurvey = await http.post(apiUrl, body: params);
    var entriesForSurveyBody = entriesForSurvey.body;
    if (entriesForSurvey.statusCode==200) {
      var surveyEntriesBodyObj = jsonDecode(entriesForSurveyBody);
      if (surveyEntriesBodyObj["result"]=="success") {
        return surveyEntries = surveyEntriesBodyObj["survey_entries"];
      }
    }
  }

  @override
    void initState() {
    super.initState();
    _fetchEntiresExe();
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: surveyEntries==null ? 
      ListView(
        children: [
          Text("Survey Entries Not Found", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
          MaterialButton(
            height: 50.0,
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> AddEntries()));
            },
            color: Colors.purple,
            child: Text("Add Entry",
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          )
        ]
      ):
        Text("Entries Found"),
      )
    );    
  }
}
