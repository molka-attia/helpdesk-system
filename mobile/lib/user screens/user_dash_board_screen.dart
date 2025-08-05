import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/controllers/controller.dart';
import 'package:responsive_admin_dashboard/pages/drawer.dart';

import 'package:responsive_admin_dashboard/user screens/user-components/dashboard_content.dart';

import 'user-components/drawer_menu.dart';
import 'package:provider/provider.dart';

class UserDashBoardScreen extends StatelessWidget {
  const UserDashBoardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: drawertest(),
      key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: drawertest(),),
            Expanded(
              flex: 5,
               child: DashboardContent(),
              //child: Allusers(),
            )
          ],
        ),
      ),
    );
  }
}
