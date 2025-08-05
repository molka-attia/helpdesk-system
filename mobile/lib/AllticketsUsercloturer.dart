import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_admin_dashboard/controllers/controller.dart';
import 'package:responsive_admin_dashboard/screens/dash_board_screen%20copy.dart';
import 'package:responsive_admin_dashboard/user screens/user_dash_board_screen tickets.dart';
import 'package:responsive_admin_dashboard/user%20screens/user-dash-ticketscloturer.dart';



class AllticketsUserCloturer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Admin Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Controller(),)
        ],
        child: DashBoardticketscloturer(),
      ),
    );
  }
}

