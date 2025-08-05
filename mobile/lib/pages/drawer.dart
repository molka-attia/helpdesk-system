
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_admin_dashboard/common%20screens/components/custom_appbar.dart';
import 'package:responsive_admin_dashboard/pages/profile_page.dart';
import 'package:responsive_admin_dashboard/pages/login_page.dart';
import 'package:responsive_admin_dashboard/pages/splash_screen.dart';
import 'package:responsive_admin_dashboard/pages/widgets/header_widget.dart';
import 'package:responsive_admin_dashboard/user%20screens/user-components/allticketscloturer.dart';

import '../AllticketsUsercloturer.dart';
import '../Allticketscloturer.dart';
import 'forgot_password_page.dart';
import 'forgot_password_verification_page.dart';
import 'registration_page.dart';
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


class drawertest extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
     return _drawer();
  }
}

class _drawer extends State<drawertest>{

  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
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
  @override
  Widget build(BuildContext context) {
    return 
   
      
  
     
      
       Drawer(
    //     child: Container(
    //       decoration:BoxDecoration(
    //           gradient: LinearGradient(
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight,
    //               stops: [0.0, 1.0],
    //               colors: [
    //                 Theme.of(context).primaryColor.withOpacity(0.2),
    //                 Theme.of(context).accentColor.withOpacity(0.5),
    //               ]
    //           )
    //       ) ,
    //       child: ListView(
    //         children: [
    //           DrawerHeader(
    //             decoration: BoxDecoration(
    //               color: Theme.of(context).primaryColor,
    //               gradient: LinearGradient(
    //                 begin: Alignment.topLeft,
    //                 end: Alignment.bottomRight,
    //                 stops: [0.0, 1.0],
    //                 colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
    //               ),
    //             ),
    //             child: Container(
    //               alignment: Alignment.bottomLeft,
    //               child: Text("FlutterTutorial.Net",
    //                 style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //           ),
    //           ListTile(
    //             leading: Icon(Icons.screen_lock_landscape_rounded, size: _drawerIconSize, color: Theme.of(context).accentColor,),
    //             title: Text('Splash Screen', style: TextStyle(fontSize: 17, color: Theme.of(context).accentColor),),
    //             onTap: (){
    //               Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: "Splash Screen")));
    //             },
    //           ),
    //           ListTile(
    //             leading: Icon(Icons.login_rounded,size: _drawerIconSize,color: Theme.of(context).accentColor),
    //             title: Text('Login Page', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).accentColor),
    //             ),
    //             onTap: () {
    //               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
    //             },
    //           ),
    //           Divider(color: Theme.of(context).primaryColor, height: 1,),
    //           ListTile(
    //             leading: Icon(Icons.person_add_alt_1, size: _drawerIconSize,color: Theme.of(context).accentColor),
    //             title: Text('Registration Page',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
    //             onTap: () {
    //              // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()),);
    //             },
    //           ),
    //           Divider(color: Theme.of(context).primaryColor, height: 1,),
    //           ListTile(
    //             leading: Icon(Icons.password_rounded, size: _drawerIconSize,color: Theme.of(context).accentColor,),
    //             title: Text('Forgot Password Page',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
    //             onTap: () {
    //               Navigator.push( context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()),);
    //             },
    //           ),
    //           Divider(color: Theme.of(context).primaryColor, height: 1,),
    //           ListTile(
    //             leading: Icon(Icons.verified_user_sharp, size: _drawerIconSize,color: Theme.of(context).accentColor,),
    //             title: Text('Verification Page',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
    //             onTap: () {
    //               Navigator.push( context, MaterialPageRoute(builder: (context) => ForgotPasswordVerificationPage()), );
    //             },
    //           ),
    //           Divider(color: Theme.of(context).primaryColor, height: 1,),
    //           ListTile(
    //             leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Theme.of(context).accentColor,),
    //             title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
    //             onTap: () {
    //               SystemNavigator.pop();
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
 
    // );
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
          //  if (type == "technicien")
          // DrawerListTile(
          //     title: 'Statistics',
          //     svgSrc: 'assets/icons/Statistics.svg',
          //     tap: () {}),
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
          //       if (type == "admin")
          // DrawerListTile(
          //     title: 'Utilisateurs',
          //     svgSrc: 'assets/icons/Subscribers.svg',
          //     tap: () {

          //        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AllusersAdmin() ));
          //     }),
               if (type == "admin")
               DrawerListTile(
              title: 'tickets', svgSrc: 'assets/icons/Pages.svg', tap: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AllticketsAdmin() ));
              }),
          // DrawerListTile(
          //     title: 'Message', svgSrc: 'assets/icons/Message.svg', tap: () {}),
           if (type == "admin")
           DrawerListTile(
              title: 'Tickets cloturé', svgSrc: 'assets/icons/Pages.svg', tap: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AllticketsCloturer() ));
              }),
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
               if (type == "utilisateur")
               DrawerListTile(
              title: 'Tickets cloturé', svgSrc: 'assets/icons/Pages.svg', tap: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AllticketsUserCloturer() ));
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),

          // DrawerListTile(
          //     title: 'Settings',
          //     svgSrc: 'assets/icons/Setting.svg',
          //     tap: () {}),
               DrawerListTile(
              title: 'Profile',
              svgSrc: 'assets/icons/Setting.svg',
              tap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ProfilePage() ));
              }),
          DrawerListTile(
              title: 'Logout',
              svgSrc: 'assets/icons/Logout.svg',
              tap: () {
              Logout();

              }),
              //
        ],
      ),
    );
  }

}