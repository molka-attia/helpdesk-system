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




class Oneticket extends StatefulWidget {
  
  final dynamic info;
 Oneticket({this.info});

  @override
  State<Oneticket> createState() => _DiscussionInfoDetailState();
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

class _DiscussionInfoDetailState extends State<Oneticket> {



  ClotureTicket(String note) async {
 
   SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId");
     String token = prefs.getString("token");
   var body = {
      "note":note
    };
   var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
      "userId": userId,
    };
    var uri = Uri.parse("http://localhost:3000/api/tickets/" +
        widget.info["_id"] +
        "/clotureticket");
        var request = http.put(uri,  body: json.encode(body), headers: headers);
   // var request = new http.MultipartRequest("POST", uri);
    
    //request.fields['description'] = description;
    ///request.fields['priorite'] = email;
 
  }
  
TextEditingController _noteController = TextEditingController();
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
    // 
    // http://localhost:3000/api/tickets/${id}/deleteticket
    var uri = Uri.parse("http://localhost:3000/api/tickets/" +
        widget.info["_id"] +
        "/deleteticket");
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
 getDate3() {
  //var data = "2021-12-15T11:10:01.521Z";

  DateTime dateTime = getFormattedDateFromFormattedString(
      value: widget.info['Dateaffectation'],
      currentFormat: "yyyy-MM-ddTHH:mm:ssZ",
  //    desiredFormat: "yyyy-MM-dd HH:mm:ss");
   desiredFormat: "yyyy-MM-dd HH:mm");
    if ( widget.info['Dateaffectation']!= null) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return dateTime;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  } 
  //return dateTime;
  print(dateTime); //2021-12-15 11:10:01.000
}
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
  

  // getUser() async {
  //   //SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // String token = prefs.getString("token");
  //   // String userId = prefs.getString("userId");
  //   // var headers = {
  //   //   "Content-Type": "application/json",
  //   //   "Accept": "application/json",
  //   //   "Authorization": "Bearer " + token,
  //   //   "userId": userId,
  //   // };
    // var uri = Uri.parse("http://localhost:3000/api/users/" +
    //     widget.info["demandeur"] +
    //     "/getuserName");
  //  // var request = http.delete(uri, headers: headers);
  //   //var request = http.get(uri);
  //   // Navigator.push(
  //   //     context, MaterialPageRoute(builder: (context) =>AllusersAdmin() ));
     
  //   // var request = http.get(uri, headers: headers);
  //   var request = http.get(uri);
  //   var response = await request.timeout(Duration(seconds: 10));
  //   setState(() {
  //     user = jsonDecode(response.body);
  //   });
    
  // }
  

// class DiscussionInfoDetail extends StatelessWidget {
//   const DiscussionInfoDetail({Key? key, required this.info}) : super(key: key);

//   final DiscussionInfoModel info;

 






//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: appPadding),
//       padding: EdgeInsets.all(appPadding / 2),
//       child: Expanded(
            
//           //contains a single child which is scrollable
//           child: SingleChildScrollView(
//       child: Row(
//         children: [
//           // ClipRRect(
//           //   borderRadius: BorderRadius.circular(40),
//           //   child: Image.asset(
//           //     'images/'+ widget.info['user_img'],
//           //     height: 42,
//           //     width: 42,
//           //     fit: BoxFit.cover,
//           //   ),
//           // ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: appPadding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //    Text(
//                   //    getcolor(),
//                   //   style: TextStyle(
//                   //     color: textColor,
//                   //     fontWeight: FontWeight.w600
//                   //   ),

//                   // ), 
//                   // Text(
//                   //    widget.info['description'],
//                   //   style: TextStyle(
//                   //     color: textColor,
//                   //     fontWeight: FontWeight.w600
//                   //   ),

//                   // ), 
                
        
//             //       FutureBuilder<User>(
//             // future: futureAlbum,
//             // builder: (context, snapshot) {
//             //   if (snapshot.hasData) {
//             //     return Text(snapshot.data!.title);
//             //   } else if (snapshot.hasError) {
//             //     return Text('${snapshot.error}');
//             //   }

//                   //  Text(
//                   //  '${user}',
//                   //   style: TextStyle(
//                   //     color: textColor,
//                   //     fontWeight: FontWeight.w600
//                   //   ),

//                   // ), 
//                   //  ListView.builder(
//                   //   controller: _firstController,
//                   //    itemCount: user.length, 
//                   //   itemBuilder:(context, index) =>  user[index],
//                   //   // (BuildContext context, int index) {
//                   //     // return Padding(
//                   //     //   padding: const EdgeInsets.all(8.0),
//                   //     //   child: Text('Scrollable 1 : Index $index'),
//                   //     // );
//                   //  // }
//                   //   ),

//                   // Text(
//                   //  widget.info['priorite'],
//                   //   style: TextStyle(
//                   //       color: textColor.withOpacity(0.5),
//                   //     fontSize: 13,
//                   //   ),
                    
//                   // ),
//                   Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: appPadding,
//         vertical: appPadding / 2,
//       ),
//       decoration: BoxDecoration(
//          // color: secondaryColor,
//           color: getcolor().withOpacity(0.1),
//            borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
           
//                Text(
//                 widget.info['priorite'],
//                 style: TextStyle(
//                   color: textColor,
//                   fontSize: 20,
//                   //fontWeight: FontWeight.w900,
//                   fontWeight: FontWeight. bold,
//                 ),
//               ),
//       //          FloatingActionButton.extended(
//       //   onPressed: () {
//       //  deleteTicket();
//       //     // Add your onPressed code here!
//       //   },
//       //   label: const Text('delete'),
//       //   // icon: const Icon(Icons.plus_one_rounded),
//       //   backgroundColor: Colors.red.withOpacity(0.6),

//       // ),
      
           

      
//               // Container(
//               //   padding: EdgeInsets.all(appPadding / 2),
//               //   height: 40,
//               //   width: 40,
//               //   decoration: BoxDecoration(
//               //       color: getcolor().withOpacity(0.1),
//               //       shape: BoxShape.circle),
//               //   // child: SvgPicture.asset(
//               //   //   info.svgSrc!,
//               //   //   color: Colors.blue,
//               //   // ),
//               // )
//                     new IconButton(
//         // icon: new Icon(Icons.more_vert_rounded),
//         icon: new Icon(Icons.info),
//         color: textColor.withOpacity(0.5),
//         //size: 18,
//         onPressed: (){
//             //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ProfilePage() ));
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     scrollable: true,
//                     title: Text('Ticket info :'),
//                     content: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Form(
//                         child: Column(
//                           children: <Widget>[
//           //                     ClipRRect(
//           //   borderRadius: BorderRadius.circular(40),
//           //   child: Image.asset(
//           //     'images/'+ widget.info['user_img'],
//           //     height: 52,
//           //     width: 52,
//           //     fit: BoxFit.cover,
//           //   ),
//           // ),
//                     FutureBuilder<User>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text('Demandeur :    '+snapshot.data.name);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
          
//                   //     Text(
//                   //   'technicien :',
//                   //   style: TextStyle(
//                   //     color: textColor,
//                   //     fontWeight: FontWeight.w600
//                   //   ),
//                   // ),
//            FutureBuilder<User>(
//             future: futureAlbum2,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text('Technicien :    ' +snapshot.data.name);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
 
                   
//                             Text(
//                      widget.info['description'],
//                     style: TextStyle(
//                       color: textColor,
//                       fontWeight: FontWeight.w400
//                     ),
//                   ),
//                   //     Text(
//                   //   'demandeur:',
//                   //   style: TextStyle(
//                   //     color: textColor,
//                   //     fontWeight: FontWeight.w600
//                   //   ),
//                   // ),
 
//                   // Text(
//                   //    widget.info['type'],
//                   //   style: TextStyle(
//                   //       color: textColor.withOpacity(0.5),
//                   //     fontSize: 13,
//                   //   ),
//                   //  ),
//                   //    Text(
//                   //    widget.info['email'],
//                   //   style: TextStyle(
//                   //       color: textColor.withOpacity(0.5),
//                   //     fontSize: 13,
//                   //   ),
//                    //),
//                           ],
//                         ),
//                       ),
//                     ),
//                      actions: [
//                       // RaisedButton(
//                       //     child: Text("edit"),
//         //                   FloatingActionButton.extended(
       
//         // label: const Text('affecter'),
//         // // icon: const Icon(Icons.plus_one_rounded),
//         // backgroundColor: _primaryColor,

      
//         //                   onPressed: () {
//         //                     // your code
//         //                       showDialog(
//         //         context: context,
//         //         builder: (BuildContext context) {
//         //           return AlertDialog(
//         //             scrollable: true,
//         //             title: Text('Ticket affecté'),
//         //             content: Padding(
//         //               padding: const EdgeInsets.all(8.0),
//         //               child: Form(
//         //                 child: Column(
//         //                   children: <Widget>[
                            
//         //                     // TextFormField(
//         //                     //   decoration: InputDecoration(
//         //                     //     labelText: 'Name',
//         //                     //     icon: Icon(Icons.account_box),
//         //                     //   ),
//         //                     // ),
                           
//         //                   ],
//         //                 ),
//         //               ),
//         //             ),
//         //          //    actions: [
//         // //            FloatingActionButton.extended(
       
//         // // label: const Text('affecter'),
//         // // // icon: const Icon(Icons.plus_one_rounded),
//         // // backgroundColor: _primaryColor,
//         // //                   onPressed: () {
//         // //                     // your code
                            
//         // //                   }),
                        
                          
//         //           //  ],
                    
//         //           );
//         //         });
//         //                   }),
                        
//                              FloatingActionButton.extended(
//         onPressed: () {
//       ClotureTicket();
//           // Add your onPressed code here!
//         },
//         label: const Text('cloturer'),
//         // icon: const Icon(Icons.plus_one_rounded),
//         backgroundColor: Colors.red,

//       ),                  
//                     ],
//                   );
//                 });
//         }
//       ),
//             ],
//           ),
//           Text(
//             widget.info['description'],
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               color: textColor,
//               fontSize: 15,
//               fontWeight: FontWeight.w600,
               
//             ),
//           ),
//         SizedBox(height: 25),
//         Row(
// children: List.generate(150~/10, (index) => Expanded(
//  child: Container(
//   color: index%2==0?Colors.transparent
//   :Colors.grey,
//   height: 2,
//  ),
//  )),
// ),
// //  Text(
// //             widget.info['Datecreaation'].toString(),
// //             maxLines: 2,
// //             overflow: TextOverflow.ellipsis,
// //             style: TextStyle(
// //               color: textColor,
// //               fontSize: 15,
// //               fontWeight: FontWeight.w600,
// //             ),
// //           ),
        
//          SizedBox(height: 15),  

//   Text(
//                'Etat :  '+ widget.info['etat'],
//                 style: TextStyle(
//                   color: textColor,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),

//   SizedBox(height: 15), 






//       //     FloatingActionButton.extended(
//       //   onPressed: () {
//       //         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>RegistrationPage() ));
//       //     // Add your onPressed code here!
//       //   },
        
//       //   label: const Text('view more'),
//       //   // icon: const Icon(Icons.plus_one_rounded),
//       //   backgroundColor: Colors.blue,

//       // ),
//         ],
//       ),
      
//     ) ,
                  
//                 ],
//               ),
//             ),
//           ),
//          // Icon(Icons.more_vert_rounded,color: textColor.withOpacity(0.5),size: 18,
        
          
//         ],
//       ),
//         ))  );
//   }
// }
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
                  //    Text(
                  //    getcolor(),
                  //   style: TextStyle(
                  //     color: textColor,
                  //     fontWeight: FontWeight.w600
                  //   ),

                  // ), 
                  // Text(
                  //    widget.info['description'],
                  //   style: TextStyle(
                  //     color: textColor,
                  //     fontWeight: FontWeight.w600
                  //   ),

                  // ), 
                
        
            //       FutureBuilder<User>(
            // future: futureAlbum,
            // builder: (context, snapshot) {
            //   if (snapshot.hasData) {
            //     return Text(snapshot.data!.title);
            //   } else if (snapshot.hasError) {
            //     return Text('${snapshot.error}');
            //   }

                  //  Text(
                  //  '${user}',
                  //   style: TextStyle(
                  //     color: textColor,
                  //     fontWeight: FontWeight.w600
                  //   ),

                  // ), 
                  //  ListView.builder(
                  //   controller: _firstController,
                  //    itemCount: user.length, 
                  //   itemBuilder:(context, index) =>  user[index],
                  //   // (BuildContext context, int index) {
                  //     // return Padding(
                  //     //   padding: const EdgeInsets.all(8.0),
                  //     //   child: Text('Scrollable 1 : Index $index'),
                  //     // );
                  //  // }
                  //   ),

                  // Text(
                  //  widget.info['priorite'],
                  //   style: TextStyle(
                  //       color: textColor.withOpacity(0.5),
                  //     fontSize: 13,
                  //   ),
                    
                  // ),
                 Card(
                      shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
      // padding: EdgeInsets.symmetric(
      //   horizontal: appPadding,
      //   vertical: appPadding / 2,
      // ),
     // decoration: BoxDecoration(
         // color: secondaryColor,
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
      //          FloatingActionButton.extended(
      //   onPressed: () {
      //  deleteTicket();
      //     // Add your onPressed code here!
      //   },
      //   label: const Text('delete'),
      //   // icon: const Icon(Icons.plus_one_rounded),
      //   backgroundColor: Colors.red.withOpacity(0.6),

      // ),
      
           

      
              // Container(
              //   padding: EdgeInsets.all(appPadding / 2),
              //   height: 40,
              //   width: 40,
              //   decoration: BoxDecoration(
              //       color: getcolor().withOpacity(0.1),
              //       shape: BoxShape.circle),
              //   // child: SvgPicture.asset(
              //   //   info.svgSrc!,
              //   //   color: Colors.blue,
              //   // ),
              // )


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
              'images/ticket.png',
              height: 142,
              width: 360,
             // fit: BoxFit.cover,
            ),
          ),
          //                     ClipRRect(
          //   borderRadius: BorderRadius.circular(40),
          //   child: Image.asset(
          //     'images/'+ widget.info['user_img'],
          //     height: 52,
          //     width: 52,
          //     fit: BoxFit.cover,
          //   ),
          // ),
            //  Text(
            //        'cloturer',
            //           textAlign: TextAlign.center,
            //         style: TextStyle(
            //           //color: textColor,
            //           fontSize: 20,
            //           fontWeight: FontWeight.w800,
            //           color:  HexColor('#008ea1'),
                   
            //         ),
            //       ),
          
            SizedBox(height: 15), 
            
                  Text(
                     widget.info['description'],
                       textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                   SizedBox(height: 15), 
                  //       Text(
                  //   "solution :"+ widget.info['note'],
                  //   style: TextStyle(
                  //     color: textColor,
                  //    fontSize: 18,
                  // fontWeight: FontWeight.w400,
                  // // backgroundColor: Colors.white,
                  //   ),
                  // ),
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
              if ((widget.info['Datecreaation'] != widget.info['Dateaffectation'])&&(widget.info['Dateaffectation']!=null))
                 
                       Text(
              //  widget.info['Datecreaation'],
              'réaffecter le : '+getDate3().toString(),
                style: TextStyle(
                  color: textColor,
                    // backgroundColor: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),

  // SizedBox(height: 15), 
  //  Text(
  //             //  widget.info['Datecreaation'],
  //              'cloturer en : '+getDate2().toString(),
  //               style: TextStyle(
  //                 color: textColor,
  //                   // backgroundColor: Colors.white,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w400,
  //               ),
  //             ),
                SizedBox(height: 30), 
               
               
                 Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  
  children: <Widget>[
    new Container(
      width:350,
      child: FloatingActionButton.extended(
        onPressed: () {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
{
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
          //                         ClipRRect(
       
          //   child: Image.asset(
          //     'images/ticket.png',
          //     height: 142,
          //     width: 360,
          //    // fit: BoxFit.cover,
          //   ),
          // ),
               TextField(
                      controller: _noteController,
                      decoration: InputDecoration(
                        hintText: "Comment le problème a été resolu ?",
                        hintStyle: TextStyle(color: CupertinoColors.activeBlue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 20,
                    ),
           
               
               
                 Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  
  children: <Widget>[
    new Container(
      width:350,
      child: FloatingActionButton.extended(
        onPressed: () {
    

 ClotureTicket(_noteController.text);


        },
        label: const Text('cloturer'),
        // icon: const Icon(Icons.plus_one_rounded),
        backgroundColor:   HexColor('#00a5bb'),
  shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.zero
     ),
      ), 
    )
  ],
),
      

                          ],
                       
              
                        ),
                      ),
                    ),
                    
                     actions: [
                        
                            
  
      //  FloatingActionButton.extended(
      //   onPressed: () {
      //         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>RegistrationPage() ));
      //     // Add your onPressed code here!
      //      showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return AlertDialog(
      //               scrollable: true,
      //               title: Text('Modifier ticket'),
      //               content: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Form(
      //                   child: Column(
      //                     children: <Widget>[
                         
                   
                
      //               SizedBox(
      //                 height: 20,
      //               ),
      //                           TextField(
      //                 controller: _descriptionController,
      //                 decoration: InputDecoration(
      //                   hintText: "le problème",
      //                   hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                 ),
      //               ),
      //                SizedBox(
      //                 height: 20,
      //               ),
                    
      //           DropdownButton(
      // value: selectedValue,
      // dropdownColor:CupertinoColors.activeBlue,
      // isExpanded:true,
      // onChanged: (String newValue){
      //   setState(() {
      //     selectedValue = newValue;
      //   });
      // },
      // items: dropdownItems
      // ),
      //    SizedBox(
      //                 height: 20,
      //               ),
                    
      //   DropdownButton(
      // value: selectedValue2,
      // dropdownColor:CupertinoColors.activeBlue,
      // isExpanded:true,
      // onChanged: (String newValue){
      //   setState(() {
      //     selectedValue2 = newValue;
      //   });
      // },
      // items: dropdownItems2
      // ),
      //               // TextField(
      //               //   controller: _descriptionController,
      //               //   decoration: InputDecoration(
      //               //     hintText: "le problème",
      //               //     hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //               //     border: OutlineInputBorder(
      //               //       borderRadius: BorderRadius.circular(10),
      //               //     ),
      //               //   ),
      //               // ),
      //               //  SizedBox(
      //               //   height: 20,
      //               // ),
                   
                    
      //               // TextField(
      //               //   controller: _prioriteController,
      //               //   decoration: InputDecoration(
      //               //     hintText: "priorité : (faible/moyenne/urgent)",
      //               //     hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //               //     border: OutlineInputBorder(
      //               //       borderRadius: BorderRadius.circular(10),
      //               //     ),
      //               //   ),
      //               // ),
      //               // SizedBox(
      //               //   height: 20,
      //               // ),
              
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //                actions: [
    
      //                   ElevatedButton(
              
      //              onPressed: () async{
                  
      //               await EditTicket(
      //                   );
      //               //Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashuser()));
      //             },
      //               //Navigator.push(context, MaterialPageRoute(builder: (context)=>AllusersAdmin()));
      //            // },
      //             child: Text('modifier')) 
                          
      //               ],
      //             );
      //           });


          
      //   },
      //   label: const Text('modifier'),
      //   // icon: const Icon(Icons.plus_one_rounded),
      //   backgroundColor: Colors.blue,

      // ),
                          
                    ],
                    
                  );
                });
        }
 //ClotureTicket();


        },
        label: const Text('cloturer'),
        // icon: const Icon(Icons.plus_one_rounded),
        backgroundColor:   HexColor('#00a5bb'),
  shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.zero
     ),
      ), 
    )
  ],
),
//                   Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children:<Widget>[
//     new Container(
//       width:350,
//       child: FloatingActionButton.extended(
    
//         onPressed: () {
//       deleteTicket();
//           // Add your onPressed code here!
//         },
//         label: const Text('supprimer'),
//         // icon: const Icon(Icons.plus_one_rounded),
//         backgroundColor:   HexColor('#008ea1'),
//          shape: BeveledRectangleBorder(
//           borderRadius: BorderRadius.zero
//      ),
//       )
//       ), 
  
//   ],
// ),

                  //     Text(
                  //   'demandeur:',
                  //   style: TextStyle(
                  //     color: textColor,
                  //     fontWeight: FontWeight.w600
                  //   ),
                  // ),
 
                  // Text(
                  //    widget.info['type'],
                  //   style: TextStyle(
                  //       color: textColor.withOpacity(0.5),
                  //     fontSize: 13,
                  //   ),
                  //  ),
                  //    Text(
                  //    widget.info['email'],
                  //   style: TextStyle(
                  //       color: textColor.withOpacity(0.5),
                  //     fontSize: 13,
                  //   ),
                   //),
                          ],
                       
              
                        ),
                      ),
                    ),
                    
                     actions: [
                      // RaisedButton(
                      //     child: Text("edit"),
        //                   FloatingActionButton.extended(
       
        // label: const Text('affecter'),
        // // icon: const Icon(Icons.plus_one_rounded),
        // backgroundColor: _primaryColor,

      
        //                   onPressed: () {
        //                     // your code
        //                       showDialog(
        //         context: context,
        //         builder: (BuildContext context) {
        //           return AlertDialog(
        //             scrollable: true,
        //             title: Text('Ticket affecté'),
        //             content: Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Form(
        //                 child: Column(
        //                   children: <Widget>[
                            
        //                     // TextFormField(
        //                     //   decoration: InputDecoration(
        //                     //     labelText: 'Name',
        //                     //     icon: Icon(Icons.account_box),
        //                     //   ),
        //                     // ),
                           
        //                   ],
        //                 ),
        //               ),
        //             ),
        //          //    actions: [
        // //            FloatingActionButton.extended(
       
        // // label: const Text('affecter'),
        // // // icon: const Icon(Icons.plus_one_rounded),
        // // backgroundColor: _primaryColor,
        // //                   onPressed: () {
        // //                     // your code
                            
        // //                   }),
                        
                          
        //           //  ],
                    
        //           );
        //         });
        //                   }),
                        
                            
  
      //  FloatingActionButton.extended(
      //   onPressed: () {
      //         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>RegistrationPage() ));
      //     // Add your onPressed code here!
      //      showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return AlertDialog(
      //               scrollable: true,
      //               title: Text('Modifier ticket'),
      //               content: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Form(
      //                   child: Column(
      //                     children: <Widget>[
                         
                   
                
      //               SizedBox(
      //                 height: 20,
      //               ),
      //                           TextField(
      //                 controller: _descriptionController,
      //                 decoration: InputDecoration(
      //                   hintText: "le problème",
      //                   hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                 ),
      //               ),
      //                SizedBox(
      //                 height: 20,
      //               ),
                    
      //           DropdownButton(
      // value: selectedValue,
      // dropdownColor:CupertinoColors.activeBlue,
      // isExpanded:true,
      // onChanged: (String newValue){
      //   setState(() {
      //     selectedValue = newValue;
      //   });
      // },
      // items: dropdownItems
      // ),
      //    SizedBox(
      //                 height: 20,
      //               ),
                    
      //   DropdownButton(
      // value: selectedValue2,
      // dropdownColor:CupertinoColors.activeBlue,
      // isExpanded:true,
      // onChanged: (String newValue){
      //   setState(() {
      //     selectedValue2 = newValue;
      //   });
      // },
      // items: dropdownItems2
      // ),
      //               // TextField(
      //               //   controller: _descriptionController,
      //               //   decoration: InputDecoration(
      //               //     hintText: "le problème",
      //               //     hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //               //     border: OutlineInputBorder(
      //               //       borderRadius: BorderRadius.circular(10),
      //               //     ),
      //               //   ),
      //               // ),
      //               //  SizedBox(
      //               //   height: 20,
      //               // ),
                   
                    
      //               // TextField(
      //               //   controller: _prioriteController,
      //               //   decoration: InputDecoration(
      //               //     hintText: "priorité : (faible/moyenne/urgent)",
      //               //     hintStyle: TextStyle(color: CupertinoColors.activeBlue),
      //               //     border: OutlineInputBorder(
      //               //       borderRadius: BorderRadius.circular(10),
      //               //     ),
      //               //   ),
      //               // ),
      //               // SizedBox(
      //               //   height: 20,
      //               // ),
              
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //                actions: [
    
      //                   ElevatedButton(
              
      //              onPressed: () async{
                  
      //               await EditTicket(
      //                   );
      //               //Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashuser()));
      //             },
      //               //Navigator.push(context, MaterialPageRoute(builder: (context)=>AllusersAdmin()));
      //            // },
      //             child: Text('modifier')) 
                          
      //               ],
      //             );
      //           });


          
      //   },
      //   label: const Text('modifier'),
      //   // icon: const Icon(Icons.plus_one_rounded),
      //   backgroundColor: Colors.blue,

      // ),
                          
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
     
     
//         Row(
// children: List.generate(150~/10, (index) => Expanded(
//  child: Container(
//   color: index%2==0?Colors.transparent
//   :Colors.grey,
//   height: 2,
//  ),
//  )),
// ),









//  Text(
//             widget.info['Datecreaation'].toString(),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               color: textColor,
//               fontSize: 15,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
        
         SizedBox(height: 15),  

  // Text(
  //              'Etat :  '+ widget.info['etat'],
  //               style: TextStyle(
  //                 color: textColor,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w800,
  //               ),
  //             ),
                Text(
              //  widget.info['Datecreaation'],
              'Date de création : '+getDate().toString(),
                style: TextStyle(
                  color: textColor,
                  
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

 // SizedBox(height: 15), 
  //  Text(
  //             //  widget.info['Datecreaation'],
  //              'Date de cloturation : '+getDate2().toString(),
  //               style: TextStyle(
  //                 color: textColor,
                  
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w800,
  //               ),
  //             ),

 SizedBox(height: 15), 



      //     FloatingActionButton.extended(
      //   onPressed: () {
      //         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>RegistrationPage() ));
      //     // Add your onPressed code here!
      //   },
        
      //   label: const Text('view more'),
      //   // icon: const Icon(Icons.plus_one_rounded),
      //   backgroundColor: Colors.blue,

      // ),
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
