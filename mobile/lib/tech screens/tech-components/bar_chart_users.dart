import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/tech screens/tech-components/analytic_cards.dart';
import 'package:responsive_admin_dashboard/tech screens/tech-components/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:responsive_admin_dashboard/tech screens/tech-components/viewers.dart';
import 'package:responsive_admin_dashboard/tech%20screens/tech-components/users.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;


class BarChartUsers extends StatefulWidget {
  @override
  State<BarChartUsers> createState() => _DashuserState();
}

class _DashuserState extends State<BarChartUsers> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
   String selectedValue = "Urgent";
List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Urgent"),value: "Urgent"),
    DropdownMenuItem(child: Text("Moyenne"),value: "Moyenne"),
    DropdownMenuItem(child: Text("faible"),value: "Faible"),
 
  ];
  return menuItems;
}
var ticketnoncloturer;
  var ticketattribues;
  var demande;
  var demandeenv;
  var ticketnoncloturer2;
  var ticketattribues2;
  var demande2;
  var demandeenv2;
  Color c1= const Color(0xFF001E6C);
   Color c3= const Color(0xFFE8630A);
    Color c4= const Color(0xFFFCD900);
  
  getTicketattribue() async {
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
    var uri = Uri.parse("http://localhost:3000/api/tickets/"+
       userId +"/statstechtickets");
        //http://localhost:3000/api/tickets/${id}/getTechtickets
    //var uri = Uri.parse(url);
    // var request = http.get(uri, headers: headers);
    var request = http.get(uri, headers: headers);
    var response = await request.timeout(Duration(seconds: 10));
    setState(() {
       setState(() {
      //  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
   // return 
      //ticketattribues = jsonDecode(response.body);
      ticketattribues2 = jsonDecode(response.body);
         if(ticketattribues2['tickets']!=null){
        ticketattribues=ticketattribues2['tickets'];
      }
      else {
        ticketattribues=0;
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    });
    });
  }


getticketnoncloturer()async {
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
    var uri = Uri.parse("http://localhost:3000/api/tickets/statsalltickets");
        //http://localhost:3000/api/tickets/${id}/getTechtickets
    //var uri = Uri.parse(url);
    // var request = http.get(uri, headers: headers);
    var request = http.get(uri, headers: headers);
    var response = await request.timeout(Duration(seconds: 10));
    setState(() {
      ticketnoncloturer = jsonDecode(response.body);
      
      
    });}

getdemande()async {
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
    var uri = Uri.parse("http://localhost:3000/api/demande/"+
       userId +"/statsdemande");
        //http://localhost:3000/api/tickets/${id}/getTechtickets
    //var uri = Uri.parse(url);
    // var request = http.get(uri, headers: headers);
    var request = http.get(uri, headers: headers);
    var response = await request.timeout(Duration(seconds: 10));
    setState(() {
     // demande = jsonDecode(response.body);
      demande2 = jsonDecode(response.body);
         if(demande2['demandes']!=null){
        demande=demande2['demandes'];
      }
      else {
        demande=0;
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    });}


getdemandeenv()async {
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
    var uri = Uri.parse("http://localhost:3000/api/demande/"+
       userId +"/Statsemetteur");
        //http://localhost:3000/api/tickets/${id}/getTechtickets
    //var uri = Uri.parse(url);
    // var request = http.get(uri, headers: headers);
    var request = http.get(uri, headers: headers);
    var response = await request.timeout(Duration(seconds: 10));
    setState(() {
     // demandeenv = jsonDecode(response.body);
         demandeenv2 = jsonDecode(response.body);
         if( demandeenv2['demandes']!=null){
        demandeenv=demandeenv2['demandes'];
      }
      else {
        demande=0;
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    });}

  @override
  void initState() {
    super.initState();
    getTicketattribue();
    getdemande();
    getticketnoncloturer();
    getdemandeenv();
  }
  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        borderData: FlBorderData(border: Border.all(width: 0)),
        groupsSpace: 15,
        titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
                showTitles: true,
                // getTextStyles: (value) => const TextStyle(
                //       color: lightTextColor,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 12,
                //     ),
                margin: appPadding,
                getTitles: (double value) {
                  if (value == 2) {
                    return 'Tickets attribués';
                  }
                  //  if (value == 4) {
                  //   return 'jan 8';
                  // }
                  if (value == 5) {
                    return 'Tickets ';
                  } 
                  // if (value == 8) {
                  //   return 'jan 12';
                  // }
                  if (value == 9) {
                    return 'Demandes reçues';
                  }
                  // if (value == 12) {
                  //   return 'jan 16';
                  // }
                  if (value == 13) {
                    return 'Demandes envoyées';
                  }
                  else {
                    return '';
                  }
                }),
          leftTitles: SideTitles(
              showTitles: true,
              // getTextStyles: (value) => const TextStyle(
              //   color: lightTextColor,
              //   fontWeight: FontWeight.bold,
              //   fontSize: 12,
              // ),
              margin: appPadding,
              getTitles: (double value) {
                if (value == 2) {
                  return '2';
                } if (value == 5) {
                  return '5';
                } if (value == 10) {
                  return '10';
                }if (value == 15) {
                  return '15';
                }else {
                  return '';
                }
              })
        ),
        barGroups: [
          // BarChartGroupData(x: 1, barRods: [
          //   BarChartRodData(
          //     y: 10,
          //     width: 20,
          //     colors: [primaryColor],
          //     borderRadius: BorderRadius.circular(5)
          //   )
          // ]),
         // if(ticketattribues["tickets"]!=null)
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
                y: ticketattribues,
              // y:5,
                width: 80,
                colors: [c1],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
                y: 0,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
                y: 0,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
                y: ticketnoncloturer["tickets"],
                width: 80,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
                y: 0,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(
                y: 0,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 8, barRods: [
            BarChartRodData(
                y: 0,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 9, barRods: [
           if(demande==null)
            BarChartRodData(
                y: 0,
                width: 80,
                colors: [c3],
                borderRadius: BorderRadius.circular(5)
            )
            else if(demande!=null)
             BarChartRodData(
                y: demande,
                width: 80,
                colors: [c3],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 10, barRods: [
            BarChartRodData(
                y: 0,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 11, barRods: [
            BarChartRodData(
                y: 0,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 12, barRods: [
            if(demandeenv==null)
            BarChartRodData(
                y: 0,
                width: 80,
                colors: [c4],
                borderRadius: BorderRadius.circular(5)
            )
             else if(demandeenv!=null)
             BarChartRodData(
                y: demandeenv,
                width: 80,
                colors: [c4],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 13, barRods: [
            BarChartRodData(
                y: 0,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          BarChartGroupData(x: 14, barRods: [
            BarChartRodData(
                y: 0,
                width: 20,
                colors: [primaryColor],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
        ]));
  }
}
