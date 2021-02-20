import 'dart:convert';

import 'package:flutter/material.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';
import '../utils/Constants.dart';
import 'package:http/http.dart' as http;


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

class SurveysPage extends StatefulWidget {
  @override
  _SurveysPageState createState() => _SurveysPageState();
}

class _SurveysPageState extends State<SurveysPage> {

  final prefs = Constants.prefs;
  var surveyFetchStatus = "";
  var allSurveys;


  Future fetchSurveys() async{
    var request = http.MultipartRequest('POST', Uri.parse('https://codesevaco.tech/88zwBackend/get-all-surveys'));
    request.fields.addAll({
      'apiKey': Constants.apiKey,
      'user_id': 4.toString()
    });



    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      var resBody = jsonDecode(response.body);
      setState(() {
        return allSurveys = jsonDecode(resBody["surveys"]);
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
    void initState() {
    super.initState();
    fetchSurveys();
  } 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: allSurveys==null ? Center(child: 
          CircularProgressIndicator()
        ) : 
        ListView.builder(itemCount: allSurveys.length,
          itemBuilder: (context,index){
            return ListTile(
              trailing: Icon(Icons.add,color: Colors.white,),
              tileColor: Colors.purple,
              title: Text(allSurveys[index]["title"],style: TextStyle(fontSize: 20.0,color: Colors.white)),
            );
          },
        )
      ),
    );
  }
}