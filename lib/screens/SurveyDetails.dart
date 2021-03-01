import 'dart:async';
import 'package:flutter/material.dart';
import '../templates/AppBarTemplate.dart';
import '../templates/DrawerTemplate.dart';
import './Entries.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class SurveyDetails extends StatefulWidget {
  final surveyData;
  SurveyDetails(this.surveyData);
  @override
  _SurveyDetailsState createState() => _SurveyDetailsState(this.surveyData);
}

class _SurveyDetailsState extends State<SurveyDetails> {
  final surveyData;
  _SurveyDetailsState(this.surveyData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTemplate(),
      appBar: AppBarTemplate("Survey Details"),
      body: SurveyDetailsPage(this.surveyData),
    );
  }
}

class SurveyDetailsPage extends StatefulWidget {
  final surveyData;
  SurveyDetailsPage(this.surveyData);

  @override
  _SurveyDetailsPageState createState() => _SurveyDetailsPageState(this.surveyData);
}

class _SurveyDetailsPageState extends State<SurveyDetailsPage> {

  final surveyData;
  _SurveyDetailsPageState(this.surveyData);


  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.2046, 77.4977),
    zoom: 14.5,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListView(
          children: [
            SizedBox(height: 20.0,),
            Text("Title: "+this.widget.surveyData["title"],style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0,),
            Text("Description: "+this.widget.surveyData["description"],style: TextStyle(fontSize: 17.0),),
            SizedBox(height: 10.0,),
            Text("Address: "+this.widget.surveyData["address"],style: TextStyle(fontSize: 17.0),),
            SizedBox(height: 10.0,),
            Text("Location: ",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0,),
            SizedBox(
              height: 100,
              width: 200,  
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 50.0,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Entries(this.widget.surveyData["id"])));
              },
              color: Colors.purple,
              child: Text("Entries",
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            )
          ],
        ),     
      ),
    );
  }
}