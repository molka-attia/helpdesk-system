import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/user screens/user-components/analytic_cards.dart';
import 'package:responsive_admin_dashboard/user screens/user-components/custom_appbar.dart';

import 'package:http/http.dart' as http;
import 'package:responsive_admin_dashboard/user screens/user-components/oneticket.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';



class DashboardContent extends StatefulWidget {
  @override
  State<DashboardContent> createState() => _DashuserState();
}

class _DashuserState extends State<DashboardContent> {
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
var ticketnoncloturer2;
  var users;
  var users2;
  var ticketcloturer;
    var ticketcloturer2;
  
  
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
    var uri = Uri.parse("http://localhost:3000/api/tickets/"+
       userId +"/userticketsnumber");
        //http://localhost:3000/api/tickets/${id}/getTechtickets
    //var uri = Uri.parse(url);
    // var request = http.get(uri, headers: headers);
    var request = http.get(uri, headers: headers);
    var response = await request.timeout(Duration(seconds: 10));
    setState(() {
       users2 = jsonDecode(response.body);
        if( users2['tickets']!=null){
         users=users2['tickets'];
      }
      else {
        users=0;
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    });
  }


getticketcloturer()async {
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
       userId +"/userticketsnumbercloturer");
        //http://localhost:3000/api/tickets/${id}/getTechtickets
    //var uri = Uri.parse(url);
    // var request = http.get(uri, headers: headers);
    var request = http.get(uri, headers: headers);
    var response = await request.timeout(Duration(seconds: 10));
    setState(() {
      ticketcloturer2 = jsonDecode(response.body);
        if( ticketcloturer2['tickets']!=null){
         ticketcloturer=ticketcloturer2['tickets'];
      }
      else {
        ticketnoncloturer=0;
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    });}

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
    var uri = Uri.parse("http://localhost:3000/api/tickets/"+
       userId +"/userticketsnumbernoncloturer");
        //http://localhost:3000/api/tickets/${id}/getTechtickets
    //var uri = Uri.parse(url);
    // var request = http.get(uri, headers: headers);
    var request = http.get(uri, headers: headers);
    var response = await request.timeout(Duration(seconds: 10));
    setState(() {
       ticketnoncloturer2 = jsonDecode(response.body);
         if(ticketnoncloturer2['tickets']!=null){
        ticketnoncloturer=ticketnoncloturer2['tickets'];
      }
      else {
        ticketnoncloturer=0;
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    });
    
    
    }


  @override
  void initState() {
    super.initState();
    getUsers();
    getticketcloturer();
    getticketnoncloturer();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [
            CustomAppbar(),
            
            SizedBox(
              height: appPadding,
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          //AnalyticCards(),
                           Container(
                             width: 400,
                             height:100,
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               // "${info.count}",
                ticketnoncloturer.toString(),
               
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                padding: EdgeInsets.all(appPadding / 2),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                 // info.svgSrc!,
                 "assets/icons/Pages.svg",
                  color: Colors.blue,
                ),
              )
            ],
          ),
          Text(
            //info.title!,
           'Tickets non cloturé',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ), 
    
        SizedBox(height: 20),
                            Container(
                              width: 400,
                             height:100,
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               // "${info.count}",
                ticketcloturer.toString(),
               
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                padding: EdgeInsets.all(appPadding / 2),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                "assets/icons/Pages.svg",
                
                  color: Colors.green,
                ),
              )
            ],
          ),
          Text(
            //info.title!,
           'Tickets cloturé',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ),   SizedBox(height: 20),
                            Container(
                              width: 400,
                             height:100,
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               // "${info.count}",
                users.toString(),
               
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                padding: EdgeInsets.all(appPadding / 2),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                "assets/icons/Pages.svg",
                
                  color: Colors.blue,
                ),
              )
            ],
          ),
          Text(
            //info.title!,
           'Nombre total des tickets',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ),
                          SizedBox(
                            height: appPadding,
                          ),
                         
                          if (Responsive.isMobile(context))
                            SizedBox(
                              height: appPadding,
                            ),
                          // if (Responsive.isMobile(context)) Discussions(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(
                        width: appPadding,
                      ),
                 
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: appPadding,
                          ),
                          Row(
                            children: [
                            
                          
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        
                        
                    
                        ],
                      ),
                    ),
                  
                  
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
