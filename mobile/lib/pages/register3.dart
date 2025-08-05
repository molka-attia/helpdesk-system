import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_admin_dashboard/common/theme_helper.dart';
import 'package:responsive_admin_dashboard/pages/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:convert';

import 'package:responsive_admin_dashboard/pages/login_page.dart';

class addUser3 extends StatefulWidget {
  @override
  _addUser3 createState() => _addUser3();
}

class _addUser3 extends State<addUser3> {
  //input controllers
   File _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _typeController = TextEditingController();

  //XFile
  XFile _file;

  Future<dynamic> SignUp(File imageFile, String name, String email,
      String password, String type, context) async {
    // var stream =
    //     new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // var length = await imageFile.length();
    // var uri = Uri.parse("http://localhost:3000/api/users/addUser");
    // var request = new http.MultipartRequest("POST", uri);
    // var multipartFile = new http.MultipartFile('user_img', stream, length,
    //     filename: basename(imageFile.path));
    // request.files.add(multipartFile);
    // var stream =
      //  new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    //var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://localhost:3000/api/users/addUser2");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    //var multipartFile = new http.MultipartFile('myFile', stream, length,
      //  filename: basename(imageFile.path));

    // add file to multipart
   // request.files.add(multipartFile);

    // send
        request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['type'] = type;
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });

    // var response = await request.send();
    // Fluttertoast.showToast(
    //     msg: "User Added Successfully",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.TOP,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    // response.stream.transform(utf8.decoder).listen((value) {});
    // return response;
  }

 // @override
 // Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add User'),
//       ),
//       body: ListView(scrollDirection: Axis.vertical, children: [
//         Container(
//           padding: EdgeInsets.all(20),
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                         hintText: "Name",
//                         hintStyle: TextStyle(color: CupertinoColors.activeBlue),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         hintText: "Email",
//                         hintStyle: TextStyle(color: CupertinoColors.activeBlue),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         hintStyle: TextStyle(color: CupertinoColors.activeBlue),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextField(
//                       controller: _typeController,
//                       decoration: InputDecoration(
//                         hintText: "Type : (user/manager)",
//                         hintStyle: TextStyle(color: CupertinoColors.activeBlue),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     // Container(
//                     //   width: MediaQuery.of(context).size.width,
//                     //   child: ElevatedButton(
//                     //     child: Text('Upload Image'),
//                     //     style: ElevatedButton.styleFrom(
//                     //       primary: Colors.green[800],
//                     //     ),
//                     //     onPressed: () async {
//                     //       final pickedFile = await ImagePicker()
//                     //           .pickImage(source: ImageSource.gallery);
//                     //       setState(() {
//                     //         _file = pickedFile;
//                     //       });
//                     //     },
//                     //   ),
//                     // ),
//                      Text("Select an image"),
//           FlatButton.icon(
//               onPressed: () async => await getImage(),
//               icon: Icon(Icons.upload_file),
//               label: Text("Browse")),
//           SizedBox(
//             height: 20,
//           ),
//                   ],
//                 ),
//               ),
//               ElevatedButton(
//                   onPressed: () async{
//                     //File image = File(_file.path);
//                     await SignUp(
//                         _image,
//                         _nameController.text,
//                         _emailController.text,
//                         _passwordController.text,
//                         _typeController.text,
//                         context);
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
//                   },
//                   child: Text('Save'))
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }
 final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: _nameController,
                            decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your first name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('type', 'Enter your last type'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if(!(val.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                     
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                           SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number",
                                "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if(!(val.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                // Row(
                                //   children: <Widget>[
                                //     Checkbox(
                                //         value: checkboxValue,
                                //         onChanged: (value) {
                                //           setState(() {
                                //             checkboxValue = value!;
                                //             state.didChange(value);
                                //           });
                                //         }),
                                //     Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                //   ],
                                // ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                              FloatingActionButton.extended(
         onPressed: () async{
                    //File image = File(_file.path);
                    await SignUp(
                        _image,
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text,
                        _typeController.text,
                        context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>RegistrationPage() ));
          // Add your onPressed code here!
       // },
        label: const Text('Ajouter'),
        // icon: const Icon(Icons.plus_one_rounded),
        backgroundColor: Colors.blue,

      ),
                        // SizedBox(height: 20.0),
                        // Container(
                        //   decoration: ThemeHelper().buttonBoxDecoration(context),
                        //   child: ElevatedButton(
                        //     style: ThemeHelper().buttonStyle(),
                        //     child: Padding(
                        //       padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        //       child: Text(
                        //         "Register".toUpperCase(),
                        //         style: TextStyle(
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ),
                        //     onPressed: () {
                        //       if (_formKey.currentState!.validate()) {
                        //         Navigator.of(context).pushAndRemoveUntil(
                        //             MaterialPageRoute(
                        //                 builder: (context) => ProfilePage()
                        //             ),
                        //                 (Route<dynamic> route) => false
                        //         );
                        //       }
                        //     },
                        //   ),
                        // ),
                        SizedBox(height: 30.0),
                       // Text("Or create account using social media",  style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // GestureDetector(
                            //   child: FaIcon(
                            //     FontAwesomeIcons.googlePlus, size: 35,
                            //     color: HexColor("#EC2D2F"),),
                            //   onTap: () {
                            //     setState(() {
                            //       showDialog(
                            //         context: context,
                            //         builder: (BuildContext context) {
                            //           return ThemeHelper().alartDialog("Google Plus","You tap on GooglePlus social icon.",context);
                            //         },
                            //       );
                            //     });
                            //   },
                            // ),
                            SizedBox(width: 30.0,),
                            // GestureDetector(
                            //   child: Container(
                            //     padding: EdgeInsets.all(0),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(100),
                            //       border: Border.all(width: 5, color: HexColor("#40ABF0")),
                            //       color: HexColor("#40ABF0"),
                            //     ),
                            //     child: FaIcon(
                            //       FontAwesomeIcons.twitter, size: 23,
                            //       color: HexColor("#FFFFFF"),),
                            //   ),
                            //   onTap: () {
                            //     setState(() {
                            //       showDialog(
                            //         context: context,
                            //         builder: (BuildContext context) {
                            //           return ThemeHelper().alartDialog("Twitter","You tap on Twitter social icon.",context);
                            //         },
                            //       );
                            //     });
                            //   },
                            // ),
                            // SizedBox(width: 30.0,),
                            // GestureDetector(
                            //   child: FaIcon(
                            //     FontAwesomeIcons.facebook, size: 35,
                            //     color: HexColor("#3E529C"),),
                            //   onTap: () {
                            //     setState(() {
                            //       showDialog(
                            //         context: context,
                            //         builder: (BuildContext context) {
                            //           return ThemeHelper().alartDialog("Facebook",
                            //               "You tap on Facebook social icon.",
                            //               context);
                            //         },
                            //       );
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}

