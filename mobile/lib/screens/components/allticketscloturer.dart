import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/pages/drawer.dart';
import 'package:responsive_admin_dashboard/screens/components/Allticketsadmincloturer.dart';

import 'Allticketsadmincloturer.dart';
import 'Allticketsadmincloturer.dart';






class Allticketscloturer extends StatelessWidget {
  const Allticketscloturer({Key key}) : super(key: key);

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
    child:Allticketsadmincloturer(),
              
            )

          ],
        ),
      ),
    );
  }}