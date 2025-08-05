import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/models/discussions_info_model.dart';
import 'package:responsive_admin_dashboard/pages/profile_page.dart';
import 'package:responsive_admin_dashboard/screens/components/adduserform.dart';
import 'package:responsive_admin_dashboard/AllusersAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:convert';
import 'discussions.dart';

class DiscussionInfoDetail extends StatefulWidget {
  final dynamic info;
 DiscussionInfoDetail({this.info});

  @override
  State<DiscussionInfoDetail> createState() => _DiscussionInfoDetailState();
}

class _DiscussionInfoDetailState extends State<DiscussionInfoDetail> {
  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");
    String userId = prefs.getString("userId");
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
      "userId": userId,
    };
    var uri = Uri.parse("http://localhost:3000/api/users/" +
        widget.info["_id"] +
        "/deleteuser");
   // var request = http.delete(uri, headers: headers);
    var request = http.delete(uri, headers: headers);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) =>AllusersAdmin() ));
  }
  

// class DiscussionInfoDetail extends StatelessWidget {
//   const DiscussionInfoDetail({Key? key, required this.info}) : super(key: key);

//   final DiscussionInfoModel info;

 










  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: appPadding),
      padding: EdgeInsets.all(appPadding / 2),
      child: Expanded(
            
          //contains a single child which is scrollable
          child: SingleChildScrollView(
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(40),
          //   child: Image.asset(
          //     'images/'+ widget.info['user_img'],
          //     height: 42,
          //     width: 42,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     widget.info['name'],
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),

                  Text(
                   widget.info['type'],
                    style: TextStyle(
                        color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                    
                  ),
                  
                  
                ],
              ),
            ),
          ),
         // Icon(Icons.more_vert_rounded,color: textColor.withOpacity(0.5),size: 18,
              new IconButton(
        icon: new Icon(Icons.more_vert_rounded),
        color: textColor.withOpacity(0.5),
        //size: 18,
        onPressed: (){
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ProfilePage() ));
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text('User info'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                              ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              'images/'+ widget.info['user_img'],
              height: 52,
              width: 52,
              fit: BoxFit.cover,
            ),
          ),
                            Text(
                     widget.info['name'],
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),

                  Text(
                     widget.info['type'],
                    style: TextStyle(
                        color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                   ),
                     Text(
                     widget.info['email'],
                    style: TextStyle(
                        color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                   ),
                          ],
                        ),
                      ),
                    ),
                     actions: [
                      // RaisedButton(
                      //     child: Text("edit"),
                          FloatingActionButton.extended(
       
        label: const Text('edit'),
        // icon: const Icon(Icons.plus_one_rounded),
        backgroundColor: Colors.yellow,

      
                          onPressed: () {
                            // your code
                              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text('User edit'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                                icon: Icon(Icons.account_box),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                icon: Icon(Icons.email),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Message',
                                icon: Icon(Icons.message ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     actions: [
                   FloatingActionButton.extended(
       
        label: const Text('edit'),
        // icon: const Icon(Icons.plus_one_rounded),
        backgroundColor: Colors.yellow,
                          onPressed: () {
                            // your code
                            
                          }),
                        
                          
                    ],
                  );
                });
                          }),
                          //   RaisedButton(
                          // child: Text("delete"),
                          // onPressed: () {
                          //   // your code
                          // }),
                             FloatingActionButton.extended(
        onPressed: () {
       deleteUser();
          // Add your onPressed code here!
        },
        label: const Text('delete'),
        // icon: const Icon(Icons.plus_one_rounded),
        backgroundColor: Colors.red,

      ),
                          
                    ],
                  );
                });
        }
      ),
          
        ],
      ),
        ))  );
  }
}


