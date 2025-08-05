import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';

import 'package:responsive_admin_dashboard/screens/components/referal_info_detail.dart';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TopReferals extends StatefulWidget {
  //const TopReferals({Key? key}) : super(key: key);
  @override
  State<TopReferals> createState() => _DashuserState();
}

// class Discussions extends StatefulWidget {
//   @override
//   State<Discussions> createState() => _DashuserState();
// }

class _DashuserState extends State<TopReferals> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  var users;
  getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString("token");
    // String userId = prefs.getString("userId");
    // String clubId = prefs.getString("club_id");
    // var headers = {
    //   "Content-Type": "application/json",
    //   "Accept": "application/json",
    //   "Authorization": "Bearer " + token,
    //   "userId": userId,
    // };
    var url = "http://localhost:3000/api/users";
    var uri = Uri.parse(url);
    // var request = http.get(uri, headers: headers);
    var request = http.get(uri);
    var response = await request.timeout(Duration(seconds: 10));
    setState(() {
      users = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Techniciens',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(
            height: appPadding,
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) => ReferalInfoDetail(
                info: users[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
