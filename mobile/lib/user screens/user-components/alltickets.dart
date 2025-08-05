import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/pages/drawer.dart';
import 'package:responsive_admin_dashboard/user screens/user-components/Allticketsadmin.dart';
import 'package:responsive_admin_dashboard/user screens/user-components/analytic_cards.dart';
import 'package:responsive_admin_dashboard/user screens/user-components/custom_appbar.dart';

import 'package:responsive_admin_dashboard/user screens/user-components/drawer_menu.dart';




class Alltickets extends StatelessWidget {
  const Alltickets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      drawer: drawertest(),
   
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // if (Responsive.isDesktop(context)) Expanded(child:drawertest(),),
            Expanded(
              flex: 5,
              // child: DashboardContent(),
    //          child: Allusers(),
    child:Allticketsadmin(),
              
            )

          ],
        ),
      ),
    );
  }}