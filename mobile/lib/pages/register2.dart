import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:convert';

import 'package:responsive_admin_dashboard/pages/login_page.dart';

class addUser2 extends StatefulWidget {
  @override
  _addUser2 createState() => _addUser2();
}

class _addUser2 extends State<addUser2> {
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
    


   //create multipart request for POST or PATCH method
   var request = http.MultipartRequest("POST", Uri.parse("http://localhost:3000/api/users/addUser"));
   //add text fields
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['type'] = type;
   //create multipart using filepath, string or bytes
   var pic = await http.MultipartFile.fromPath("file_field", imageFile.path);
   //add multipart to request
   request.files.add(pic);
   var response = await request.send();

   //Get the response from the server
   var responseData = await response.stream.toBytes();
   var responseString = String.fromCharCodes(responseData);
   print(responseString);













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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(color: CupertinoColors.activeBlue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: CupertinoColors.activeBlue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: CupertinoColors.activeBlue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _typeController,
                      decoration: InputDecoration(
                        hintText: "Type : (user/manager)",
                        hintStyle: TextStyle(color: CupertinoColors.activeBlue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   child: ElevatedButton(
                    //     child: Text('Upload Image'),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.green[800],
                    //     ),
                    //     onPressed: () async {
                    //       final pickedFile = await ImagePicker()
                    //           .pickImage(source: ImageSource.gallery);
                    //       setState(() {
                    //         _file = pickedFile;
                    //       });
                    //     },
                    //   ),
                    // ),
          //            Text("Select an image"),
          // FlatButton.icon(
          //     onPressed: () async => await getImage(),
          //     icon: Icon(Icons.upload_file),
          //     label: Text("Browse")),
          
          SizedBox(
            height: 20,
          ),
             Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        child: Text('Upload Image'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[800],
                        ),
                        onPressed: () async {
                          final pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          setState(() {
                            _file = pickedFile;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
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
                  child: Text('Save'))
            ],
          ),
        ),
      ]),
    );
  }
}
