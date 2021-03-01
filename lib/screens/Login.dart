import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/Constants.dart';
import '../screens/Dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final prefs = Constants.prefs;

  final mobileNumberController = new TextEditingController();
  final passwordController = new TextEditingController();

  bool _pwdObscureTextState = true;

  pwdShowHide() {
    setState(() {
      if(_pwdObscureTextState==false){
        _pwdObscureTextState=true;
      }else{
        _pwdObscureTextState=false;
      }      
    });
  }

  var loginError = "";

  Future _loginExe() async{
    var enteredMobileNumber = mobileNumberController.text;
    var enteredPassword = passwordController.text;
    if (enteredMobileNumber == '' || enteredPassword == '') {
      setState(() {
        loginError = "Please Enter both Mobile Number and Password";
      });
    } else if (enteredMobileNumber != "" && enteredPassword != "") {
      setState(() {
        loginError = "";
      });
      var apiUrl = Constants.url+'/employee-login-api';
      var apiKey = "bb9c2fe9125fe3a500b8a8711adfc9c3";
      var params = {
        "apiKey" : apiKey,
        "mobile_number" : enteredMobileNumber,
        "password" : enteredPassword,
        "role" : "survey"
      };
      var loginResponse = await http.post(apiUrl, body: params);
      var resObj = jsonDecode(loginResponse.body);
      if(resObj["result"]=="public_failure"){
        setState(() {
          loginError = resObj["reason"];
        });
      }else{
        var prefs = Constants.prefs;
        var empData = jsonDecode(resObj["employee_data"]);
        prefs.setBool("loggedIn", true);
        prefs.setString("user_id", empData["id"]);
        prefs.setString("first_name", empData["first_name"]);
        prefs.setString("last_name", empData["last_name"]);
        prefs.setString("mobile_number", empData["mobile_number"]);
        Navigator.push(context,MaterialPageRoute(builder: (context) => Dashboard()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: [
              Image.network(
                  "https://codesevaco.tech/88zwBackend/assets/images/88zwlogo.jpeg"),
              Text(
                loginError,
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: "Mobile Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: passwordController,
                obscureText: _pwdObscureTextState,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: pwdShowHide,icon: Icon(_pwdObscureTextState
                        ? Icons.visibility
                        : Icons.visibility_off)),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                height: 50.0,
                onPressed: _loginExe,
                color: Colors.purple,
                child: Text("Login",
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
