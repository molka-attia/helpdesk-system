import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

import 'package:http/http.dart' as http;
import 'package:responsive_admin_dashboard/tech screens/tech-components/oneticket.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';


import 'package:flutter/cupertino.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_admin_dashboard/AllusersAdmin.dart';


class Ticket extends StatefulWidget {
  @override
  State<Ticket> createState() => _DashuserState();
}

class _DashuserState extends State<Ticket> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  var users;
  getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     String token = prefs.getString("token");
     String userId = prefs.getString("userId");
    String clubId = prefs.getString("club_id");
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
      "userId": userId,
    };
   // var url = "http://localhost:3000/api/users/tickets";
   // };http://localhost:3000/api/tickets/${id}/deleteticket
    var uri = Uri.parse("http://localhost:3000/api/tickets/" +
       userId +
        "/getTechtickets");
        //http://localhost:3000/api/tickets/${id}/getTechtickets
    //var uri = Uri.parse(url);
    // var request = http.get(uri, headers: headers);
    var request = http.get(uri, headers: headers);
    var response = await request.timeout(Duration(seconds: 10));
    setState(() {
      users = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }
TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _typeController = TextEditingController();

  //XFile
 // XFile;

    XFile _file;
 












    final ScrollController _firstController = ScrollController();
  // Discussions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      padding: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tickets ',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              // Text(
              //   'View All',
              //   style: TextStyle(
              //     color: textColor.withOpacity(0.5),
              //     fontWeight: FontWeight.bold,
              //     fontSize: 13,
              //   ),
              // ),
      //         FloatingActionButton.extended(
      //   onPressed: () {
      //         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>RegistrationPage() ));
      //     // Add your onPressed code here!
      //      showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return AlertDialog(
      //               scrollable: true,
      //               title: Text('User Add'),
      //               content: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Form(
      //                   child: Column(
      //                     children: <Widget>[
      //                       // TextFormField(
      //                       //   decoration: InputDecoration(
      //                       //     labelText: 'Name',
      //                       //     icon: Icon(Icons.account_box),
      //                       //   ),
      //                       // ),

      //                       // TextFormField(
      //                       //   decoration: InputDecoration(
      //                       //     labelText: 'Email',
      //                       //     icon: Icon(Icons.email),
      //                       //   ),
      //                       // ),
      //                       // TextFormField(
      //                       //   decoration: InputDecoration(
      //                       //     labelText: 'Message',
      //                       //     icon: Icon(Icons.message ),
      //                       //   ),
      //                       // ),
      //               //               Container(
      //               //   width: MediaQuery.of(context).size.width,
      //               //   child: ElevatedButton(
      //               //     child: Text('Upload Image'),
      //               //     style: ElevatedButton.styleFrom(
      //               //       primary: Colors.green[800],
      //               //     ),
      //               //     onPressed: () async {
      //               //       final pickedFile = await ImagePicker()
      //               //           .pickImage(source: ImageSource.gallery);
      //               //       setState(() {
      //               //         // _file = pickedFile;
      //               //       });
      //               //     },
      //               //   ),
      //               // ),
      //               TextField(
      //                 controller: _nameController,
      //                 decoration: InputDecoration(
      //                   hintText: "Name",
      //                   hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 20,
      //               ),
      //               TextField(
      //                 controller: _emailController,
      //                 decoration: InputDecoration(
      //                   hintText: "Email",
      //                   hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                 ),
      //               ),
      //                SizedBox(
      //                 height: 20,
      //               ),
      //                   TextField(
      //                 controller: _passwordController,
      //                 decoration: InputDecoration(
      //                   hintText: "Password",
      //                   hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                 ),
      //               ),
      //                SizedBox(
      //                 height: 20,
      //               ),
      //               TextField(
      //                 controller: _typeController,
      //                 decoration: InputDecoration(
      //                   hintText: "Type : (Admin/technicien)",
      //                   hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 20,
      //               ),
      //               Container(
      //                 width: MediaQuery.of(context).size.width,
      //                 child: ElevatedButton(
      //                   child: Text('Upload Image'),
      //                   style: ElevatedButton.styleFrom(
      //                     primary: Colors.green[800],
      //                   ),
      //                   onPressed: () async {
      //                    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      //                     setState(() {

      //                       // _file =pickedFile;
      //                     });
      //                   },
      //                 ),
      //               ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //                actions: [
      //   //            FloatingActionButton.extended(
       
      //   // label: const Text('ajouter'),
      //   // // icon: const Icon(Icons.plus_one_rounded),
      //   // backgroundColor: Colors.yellow,
      //   //                     onPressed: () async{
      //   //             File image = File(_file.path);
      //   //             await SignUp(
      //   //                 image,
      //   //                 _nameController.text,
      //   //                 _emailController.text,
      //   //                 _passwordController.text,
      //   //                 _typeController.text,
      //   //                 context);
      //   //            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashuser()));
      //   //              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AllusersAdmin() ));
      //   //           },
      //   //           ),
      //                   ElevatedButton(
      //             onPressed: () async{
                 
      //               //Navigator.push(context, MaterialPageRoute(builder: (context)=>AllusersAdmin()));
      //             },
      //             child: Text('Save')) 
                          
      //               ],
      //             );
      //           });


          
      //   },
      //   label: const Text('Ajouter'),
      //   // icon: const Icon(Icons.plus_one_rounded),
      //   backgroundColor: Colors.blue,

      // ),
            ],
          ),
          SizedBox(
            height: appPadding,
          ),
          Expanded(
            // child: ListView.builder(
            //   // physics: NeverScrollableScrollPhysics(),
            //   physics:AlwaysScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: discussionData.length,
            //   itemBuilder: (context, index) => DiscussionInfoDetail(info: discussionData[index],),
            // ),
               child: Scrollbar(
                isAlwaysShown: true,
                controller: _firstController,
                child: ListView.builder(
                    controller: _firstController,
                     itemCount: users.length, 
                    itemBuilder:(context, index) => Oneticket(info: users[index],),
                    // (BuildContext context, int index) {
                      // return Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text('Scrollable 1 : Index $index'),
                      // );
                   // }
                    ),
              )),
          
        ],
      ),
    );
  }
}
