import 'package:flutter/material.dart';

import 'package:responsive_admin_dashboard/constants/constants.dart';


// class DiscussionInfoDetail extends StatefulWidget {
//   final dynamic info;
//  DiscussionInfoDetail({this.info});

//   @override
//   State<DiscussionInfoDetail> createState() => _DiscussionInfoDetailState();
// }

// class _DiscussionInfoDetailState extends State<DiscussionInfoDetail> {
//   deleteUser() async {
//     //SharedPreferences prefs = await SharedPreferences.getInstance();

//     // String token = prefs.getString("token");
//     // String userId = prefs.getString("userId");
//     // var headers = {
//     //   "Content-Type": "application/json",
//     //   "Accept": "application/json",
//     //   "Authorization": "Bearer " + token,
//     //   "userId": userId,
//     // };
//     var uri = Uri.parse("http://localhost:3000/api/users/" +
//         widget.info["_id"] +
//         "/deleteuser");
//    // var request = http.delete(uri, headers: headers);
//     var request = http.delete(uri);
//     // Navigator.push(
//     //     context, MaterialPageRoute(builder: (context) =>AllusersAdmin() ));
//   }
  

class ReferalInfoDetail extends StatefulWidget {
  final dynamic info;
  ReferalInfoDetail({this.info});
 //ReferalInfoDetail({this.info}); {
  //const ReferalInfoDetail({Key? key, required this.info}) : super(key: key);

  //final ReferalInfoModel info;

  @override
  State<ReferalInfoDetail> createState() => _DiscussionInfoDetailState();
}

class _DiscussionInfoDetailState extends State<ReferalInfoDetail> {

  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: appPadding),
      padding: EdgeInsets.all(appPadding / 2),
      child: Row(
        children: [
          // Container(
          //   padding: EdgeInsets.all(appPadding / 1.5),
          //   height: 40,
          //   width: 40,
          //   decoration: BoxDecoration(
          //     color: info.color!.withOpacity(0.1),
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          //   child: SvgPicture.asset(
          //     info.svgSrc!,
          //     color: info.color!,
          //   ),
          // ),
          //  ClipRRect(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.info['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  // Text(
                  //   '${info.count!}',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: textColor,
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
