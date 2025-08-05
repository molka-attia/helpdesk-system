import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/AllusersAdmin.dart';
// import 'package:responsive_admin_dashboard/screens/components/Allticketsadmin.dart';
import 'package:responsive_admin_dashboard/AllticketsAdmin.dart';
import 'package:responsive_admin_dashboard/main.dart';
import 'package:responsive_admin_dashboard/pages/login_page.dart';
import 'package:responsive_admin_dashboard/tech screens/tech-components/Ticket.dart';
import 'package:responsive_admin_dashboard/screens/components/drawer_list_tile.dart';

import 'package:flutter/cupertino.dart';


// import 'package:home_rental/singup.dart';
// import 'package:home_rental/clubForm.dart';



import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:responsive_admin_dashboard/ticketsTech%20copy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:responsive_admin_dashboard/mainDash.dart';

import '../../AllticketsTech.dart';
import '../../AllticketsUser.dart';
import '../../techmainDash.dart';
import '../../usermainDash.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<DrawerMenu> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  var type;
  getLoggedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tt = prefs.getString("type");
    setState(() {
      type = tt;
    });
    print(prefs.getString("type"));
  }

  @override
  void initState() {
    super.initState();
    getLoggedUser();
  }

  Logout() async {
    //clear shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginUiApp() ));
  }

  //const DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            height: 100,
            child: Image.asset("assets/images/cartecoloredlogo.png"),
          ),
           if (type == "technicien")
          DrawerListTile(
              title: 'Acceuil',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () { 
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>TechMainDash() ));
                               }
              ),
               if (type == "technicien")
               DrawerListTile(
              title: 'Tickets attribués', svgSrc: 'assets/icons/Pages.svg', tap: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ticketsTech() ));
              }),
          if (type == "technicien")
               DrawerListTile(
              title: 'Tickets', svgSrc: 'assets/icons/Pages.svg', tap: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AllticketsAdmin() ));
              }),
          // DrawerListTile(
          //     title: 'Message', svgSrc: 'assets/icons/Message.svg', tap: () {}),
           if (type == "technicien")
          DrawerListTile(
              title: 'Statistics',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {}),
            if (type == "admin")
          DrawerListTile(
              title: 'Acceuil',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () { 
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>MainDash() ));
                               }
              ),
                if (type == "admin")
          DrawerListTile(
              title: 'Utilisateurs',
              svgSrc: 'assets/icons/Subscribers.svg',
              tap: () {

                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AllusersAdmin() ));
              }),
               if (type == "admin")
               DrawerListTile(
              title: 'tickets', svgSrc: 'assets/icons/Pages.svg', tap: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AllticketsAdmin() ));
              }),
          // DrawerListTile(
          //     title: 'Message', svgSrc: 'assets/icons/Message.svg', tap: () {}),
           if (type == "admin")
          DrawerListTile(
              title: 'Statistics',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {}),
              if (type == "utilisateur")
              DrawerListTile(
              title: 'Acceuil',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () { 
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>userMainDash() ));
                               }
              ),
         if (type == "utilisateur")
               DrawerListTile(
              title: 'Tickets', svgSrc: 'assets/icons/Pages.svg', tap: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AllticketsUser() ));
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),

          DrawerListTile(
              title: 'Settings',
              svgSrc: 'assets/icons/Setting.svg',
              tap: () {}),
          DrawerListTile(
              title: 'Logout',
              svgSrc: 'assets/icons/Logout.svg',
              tap: () {
              Logout();

              }),
        ],
      ),
    );
  }
}
