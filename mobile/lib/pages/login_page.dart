
import 'package:flutter/cupertino.dart';
 import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
 import 'package:responsive_admin_dashboard/common/theme_helper.dart';
import 'package:responsive_admin_dashboard/mainDash.dart';
 //import 'package:responsive_admin_dashboard/maindash.dart';
// import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_admin_dashboard/constants/constants.dart';

// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:convert';

// import 'package:async/async.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
 //import 'dart:io';


import 'package:flutter/cupertino.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_admin_dashboard/pages/register.dart';
import 'package:responsive_admin_dashboard/pages/register2.dart';
import 'package:responsive_admin_dashboard/pages/register3.dart';
import 'package:responsive_admin_dashboard/usermainDash.dart';
import '../Allmain.dart';
import '../techmainDash.dart';
import 'forgot_password_page.dart';
import 'profile_page.dart';
//import 'registration_page.dart';
import 'widgets/header_widget.dart';

// class LoginPage extends StatefulWidget{
//   const LoginPage({Key? key}): super(key:key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage>{
//   double _headerHeight = 250;
//   Key _formKey = GlobalKey<FormState>();
// //input controllers
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   Future<void> _login() async {
//     var uri = Uri.parse("http://localhost:3000/api/auth/login");
//     var data = {
//       "email": _emailController.text,
//       "password": _passwordController.text,
//     };
//     var request = http.post(uri,
//         body: json.encode(data), headers: {"Content-Type": "application/json"});
//     var response = await request.timeout(Duration(seconds: 10));
//     // print(response.body);
//     if (response.statusCode == 200) {
//       //save response in shared preferences
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString(
//           "token", (json.decode(response.body)["token"]).toString());
//       prefs.setString(
//           "userId", (json.decode(response.body)["user"]["userId"]).toString());
//       prefs.setString("club_id",
//           (json.decode(response.body)["user"]["club_id"]).toString());
//       prefs.setString(
//           "type", (json.decode(response.body)["user"]["type"]).toString());

//       // prefs.setString("user", (json.decode(response.body)["user"]).toString());
//       Navigator.push(context, MaterialPageRoute(builder: (context) => MainDash()));
    
//       Fluttertoast.showToast(
//           msg: "You Are Logged In",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: Colors.green,
//           textColor: Colors.black,
//           fontSize: 16.0);
//     }
//     //get data from shared preferences
//   }
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
              
//             Container(
//               height: _headerHeight,
              
//               child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
//             ),
//             SafeArea(
//               child: Container( 
//                 padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                   margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  
//                 child: Column(
                  
//                   children: [
    
    
// //      Wrap(
// //  children: <Widget>[
//           Image.asset('assets/images/unnamed.png' ,width: 150,height:90 ),

                               
                               
//                     Text(
//                       'Login',
//                       style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
//                     )  ,
//                     // Text(
//                     //   'Signin into your account',
//                     //   style: TextStyle(color: Colors.grey),
//                     // ),
//                     SizedBox(height: 30.0),
//                     Form(
//                       key: _formKey,
//                         child: Column(
//                           children: [
//                             Container(
//                               child: TextField(
//                                  controller: _emailController,
//                                 decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
//                               ),
//                               decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                             ),
//                             SizedBox(height: 30.0),
//                             Container(
//                               child: TextField(
//                                  controller: _passwordController,
//                                 obscureText: true,
//                                 decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
//                               ),
//                               decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                             ),
//                             SizedBox(height: 15.0),
//                             Container(
//                               margin: EdgeInsets.fromLTRB(10,0,10,20),
//                               alignment: Alignment.topRight,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
//                                 },
//                                 child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               decoration: ThemeHelper().buttonBoxDecoration(context),
//                               child: ElevatedButton(
//                                 style: ThemeHelper().buttonStyle(),
//                                 child: Padding(
//                                   padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
//                                   child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
//                                 ),
//                                 onPressed: (){
//                                   _login();
//                                   //After successful login we will redirect to profile page. Let's create profile page now
//                                   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  
//                                 },
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.fromLTRB(10,20,10,20),
//                               //child: Text('Don\'t have an account? Create'),
//                               child: Text.rich(
//                                 TextSpan(
//                                   children: [
//                                     TextSpan(text: "Don\'t have an account? "),
//                                     TextSpan(
//                                       text: 'Create',
//                                       recognizer: TapGestureRecognizer()
//                                         ..onTap = (){
//                                           Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
//                                         },
//                                       style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
//                                     ),
//                                   ]
//                                 )
//                               ),
//                             ),
//                           ],
//                         )
//                     ),
//                   ],
//                 )
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//   }
// }
import 'dart:convert';

import 'package:flutter/cupertino.dart';
// import 'package:home_rental/home.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  //input controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  Future<void> _login() async {
    var uri = Uri.parse("http://localhost:3000/api/auth/login");
    var data = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    var request = http.post(uri,
        body: json.encode(data), headers: {"Content-Type": "application/json"});
    var response = await request.timeout(Duration(seconds: 10));
    // print(response.body);
    if (response.statusCode == 200) {
      //save response in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(
          "token", (json.decode(response.body)["token"]).toString());
      prefs.setString(
          "userId", (json.decode(response.body)["user"]["userId"]).toString());
     
      prefs.setString(
          "type", (json.decode(response.body)["user"]["type"]).toString());

      // prefs.setString("user", (json.decode(response.body)["user"]).toString());
        var type;
  getLoggedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tt = prefs.getString("type");
    setState(() {
      type = tt;
    });
    print(prefs.getString("type"));
  }
  if(json.decode(response.body)["user"]["type"].toString() == "admin"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainDash()));
      Fluttertoast.showToast(
          msg: "You Are Logged In",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.black,
          fontSize: 16.0);
    }  if(json.decode(response.body)["user"]["type"].toString() == "technicien"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => TechMainDash()));
      Fluttertoast.showToast(
          msg: "You Are Logged In",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.black,
          fontSize: 16.0);
    }
     if(json.decode(response.body)["user"]["type"].toString() == "utilisateur"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => userMainDash()));
      Fluttertoast.showToast(
          msg: "You Are Logged In",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.black,
          fontSize: 16.0);
    }
    
    }
   
    //get data from shared preferences
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
              
            Container(
              height: _headerHeight,
              
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  
                child: Column(
                  
                  children: [
    
    
//      Wrap(
//  children: <Widget>[
          Image.asset('assets/images/unnamed.png' ,width: 150,height:90 ),

                               
                               
                    Text(
                      'Connexion',
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    )  ,
                    // Text(
                    //   'Signin into your account',
                    //   style: TextStyle(color: Colors.grey),
                    // ),
                    SizedBox(height: 30.0),
                    Form(
                       key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextField(
                                 controller: _emailController,
                                decoration: ThemeHelper().textInputDecoration('Email', 'Entrer votre email'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              child: TextField(
                                 controller: _passwordController,
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Mot de Passe', 'Entrer votre mot de passe'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 15.0),
                            // Container(
                            //   margin: EdgeInsets.fromLTRB(10,0,10,20),
                            //   alignment: Alignment.topRight,
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                            //     },
                            //     child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                            //     ),
                            //   ),
                            // ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Envoyer'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: (){
                                  _login();
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  
                                },
                              ),
                            ),
                         
                          //  Container(
                          //     margin: EdgeInsets.fromLTRB(10,20,10,20),
                          //     //child: Text('Don\'t have an account? Create'),
                          //     child: Text.rich(
                          //       TextSpan(
                          //         children: [
                          //           TextSpan(text: "vous n'avez pas de compte?  "),
                          //           TextSpan(
                          //             text: "s'inscrire",
                          //             recognizer: TapGestureRecognizer()
                          //               ..onTap = (){
                          //                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                          //               // Navigator.push(context, MaterialPageRoute(builder: (context) => addUser()));
                          //               },
                          //             style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                          //           ),
                          //         ]
                          //       )
                          //     ),
                          //   ),
                         
                          ],
                        )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
}