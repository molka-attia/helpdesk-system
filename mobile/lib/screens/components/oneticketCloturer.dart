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
import 'package:hexcolor/hexcolor.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


class OneticketCloturer extends StatefulWidget {
  
  final dynamic info;
OneticketCloturer({this.info});

  @override
  State<OneticketCloturer> createState() => _DiscussionInfoDetailState();
}
 Future<User> futureAlbum;

  // @override
  // void initState() {
  //   //super.initState();
  //   futureAlbum = fetchAlbum();
  // }

class User {
  // final int userId;
  // final int id;
  final String name;

  const User({
    // required this.userId,
    // required this.id,
     this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // userId: json['userId'],
      // id: json['id'],
      name: json['name'],
    );
  }
}

class _DiscussionInfoDetailState extends State<OneticketCloturer> {








 getDate() {
  //var data = "2021-12-15T11:10:01.521Z";

  DateTime dateTime = getFormattedDateFromFormattedString(
      value: widget.info['Datecreaation'],
      currentFormat: "yyyy-MM-ddTHH:mm:ssZ",
  //    desiredFormat: "yyyy-MM-dd HH:mm:ss");
   desiredFormat: "yyyy-MM-dd HH:mm");
  return dateTime;
  print(dateTime); //2021-12-15 11:10:01.000
}
 getDate2() {
  //var data = "2021-12-15T11:10:01.521Z";

  DateTime dateTime = getFormattedDateFromFormattedString(
      value: widget.info['Datecloturation'],
      currentFormat: "yyyy-MM-ddTHH:mm:ssZ",
  //    desiredFormat: "yyyy-MM-dd HH:mm:ss");
   desiredFormat: "yyyy-MM-dd HH:mm");
  return dateTime;
  print(dateTime); //2021-12-15 11:10:01.000
}
getFormattedDateFromFormattedString(
    { value,
     String currentFormat,
     String desiredFormat,
    isUtc = false}) {
  DateTime dateTime = DateTime.now();
  if (value != null || value.isNotEmpty) {
    try {
      dateTime = DateFormat(currentFormat).parse(value, isUtc).toLocal();
    } catch (e) {
      print("$e");
    }
  }
  return dateTime;
}
  
  //XFile
 




  



  deleteTicket() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

     String token = prefs.getString("token");
     String userId = prefs.getString("userId");
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
      "userId": userId,
    };
    //http://localhost:3000/api/tickets/${id}/deleteticket
    var uri = Uri.parse("http://localhost:3000/api/tickets/" +
        widget.info["_id"] +
        "/deleteticket");
        //http://localhost:3000/api/tickets/${id}/getTechtickets
   // var request = http.delete(uri, headers: headers);
    var request = http.delete(uri, headers: headers);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) =>AllusersAdmin() ));
  }
  // dynamic user;
  Color _primaryColor = HexColor('#0c297e');
  final ScrollController _firstController = ScrollController();
  var text="ha";
getcolor()  {
if(widget.info['priorite']=='Urgent'){
return red;
}
else if(widget.info['priorite']=='Moyenne'){
  return Colors.yellow;
}
else {
  return green;
}
}
 Future<User> futureAlbum;
  Future<User> futureAlbum2;

  @override
  void initState() {
    super.initState();
   // getGroupes();
    futureAlbum = fetchUser();
    futureAlbum2=fetchUser2();
  }
Future<User> fetchUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

     String token = prefs.getString("token");
     String userId = prefs.getString("userId");
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
      "userId": userId,
    };
  final response = await http
      .get(Uri.parse("http://localhost:3000/api/users/" +
         widget.info["demandeur"] +
         "/getUserName"), headers: headers);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}
Future<User> fetchUser2() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

     String token = prefs.getString("token");
     String userId = prefs.getString("userId");
    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
      "userId": userId,
    };
  final response = await http
      .get(Uri.parse("http://localhost:3000/api/users/" +
         widget.info["assignetech"] +
         "/getUserName"), headers: headers);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}

  
  






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
        
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                 Card(
                      shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
      
          color: getcolor().withOpacity(0.1),
          // borderRadius: BorderRadius.circular(10),

      child: Column(
       // crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(

            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            if( widget.info['priorite']=="Moyenne")
              SizedBox(width: 130),
              if( widget.info['priorite']!="Moyenne")
               SizedBox(width: 140),
               Text(
                widget.info['priorite'],
                 textAlign: TextAlign.center,
                style: TextStyle(
                  //color: textColor,
                  color:getcolor(),
                  fontSize: 20,
                  

                  //fontWeight: FontWeight.w900,
                  fontWeight: FontWeight. bold,
                ),
              ),
                 SizedBox(width: 120),
      
                    new IconButton(
        // icon: new Icon(Icons.more_vert_rounded),
        icon: new Icon(Icons.info),
        color: textColor.withOpacity(0.5),
        //size: 18,
        onPressed: (){
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ProfilePage() ));
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    
  elevation: 20,
  shape: RoundedRectangleBorder(
      side:  BorderSide(color:  HexColor('#008ea1'),width: 3),
      borderRadius: BorderRadius.all(Radius.circular(15))
  ),
  backgroundColor: HexColor('#f6f6f6'),
                    scrollable: true,
                   // title: Text('Cloturer '),
                   
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                                  ClipRRect(
       
            child: Image.asset(
              'images/cloturer.png',
              height: 142,
              width: 320,
             // fit: BoxFit.cover,
            ),
          ),
          
            SizedBox(height: 15), 
                  Text(
                     widget.info['description'],
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                   SizedBox(height: 15), 
                        Text(
                    "solution :"+ widget.info['note'],
                    style: TextStyle(
                      color: textColor,
                     fontSize: 18,
                  fontWeight: FontWeight.w400,
                  // backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15), 
                    FutureBuilder<User>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Demandeur :    '+snapshot.data.name);
                
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
            SizedBox(height: 15), 
          
                  //     Text(
                  //   'technicien :',
                  //   style: TextStyle(
                  //     color: textColor,
                  //     fontWeight: FontWeight.w600
                  //   ),
                  // ),
           FutureBuilder<User>(
            future: futureAlbum2,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Technicien :    ' +snapshot.data.name);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
 
                   
                      SizedBox(height: 15), 
                       Text(
              //  widget.info['Datecreaation'],
              'créer en : '+getDate().toString(),
                style: TextStyle(
                  color: textColor,
                    // backgroundColor: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),

  SizedBox(height: 15), 
   Text(
              //  widget.info['Datecreaation'],
               'cloturer en : '+getDate2().toString(),
                style: TextStyle(
                  color: textColor,
                    // backgroundColor: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
                SizedBox(height: 30), 
                
                  Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,

  children: <Widget>[
    new  FloatingActionButton.extended(
        onPressed: () {
     // deleteTicket();
          // Add your onPressed code here!
        },
        label: const Text('supprimer'),
        // icon: const Icon(Icons.plus_one_rounded),
        backgroundColor:   HexColor('#008ea1'),

      ), 
  
  ],
),

                          ],
                        ),
                      ),
                    ),
                    
                     actions: [
      

                    ],
                    
                  );
                });
        }
      ),
            ],
          ),
          Text(
            widget.info['description'],
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        SizedBox(height: 25),
     
     






   
         SizedBox(height: 15),  

  SizedBox(height: 15), 
   Text(
              //  widget.info['Datecreaation'],
               'Date de cloturation : '+getDate2().toString(),
                style: TextStyle(
                  color: textColor,
                  
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

 SizedBox(height: 15), 



        ],
      ),
      
    ) ,
                  
                ],
              ),
            ),
          ),
         // Icon(Icons.more_vert_rounded,color: textColor.withOpacity(0.5),size: 18,
        
          
        ],
      ),
        ))  );
  }
}


