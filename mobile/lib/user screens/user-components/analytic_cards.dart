import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/data/data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'analytic_info_card.dart';

class AnalyticCards extends StatelessWidget {
  const AnalyticCards({Key key}) : super(key: key);

  @override
 Widget build(BuildContext context) {

  //  Size size = MediaQuery.of(context).size;

     return Container(
      child: Responsive(
        mobile: AnalyticInfoCardGridView(
        // dAspectRatio: size.width < 650 ? 2 : 1.5, crossAxisCount: size.width < 650 ? 2 : 4,
         // chil
        ),
    //     tablet: AnalyticInfoCardGridView(),
    //     desktop: AnalyticInfoCardGridView(
    //       childAspectRatio: size.width < 1400 ? 1.5 : 2.1,
    //     ),
       ),
     );
  }
}

class AnalyticInfoCardGridView extends StatefulWidget {
  @override
  State< AnalyticInfoCardGridView> createState() => _AnalyticInfoCardGridView();
}

class _AnalyticInfoCardGridView extends State< AnalyticInfoCardGridView> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  var users;
  
  getUsers() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //    String token = prefs.getString("token");
  //    String userId = prefs.getString("userId");
  //   String clubId = prefs.getString("club_id");
  //   var headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer " + token,
  //     "userId": userId,
  //   };
  //  // var url = "http://localhost:3000/api/users/tickets";
  //  // };http://localhost:3000/api/tickets/${id}/deleteticket
  //   var uri = Uri.parse("http://localhost:3000/api/tickets/" +
  //      userId +
  //       "/getUserticketscloturer");
  //       //http://localhost:3000/api/tickets/${id}/getTechtickets
  //   //var uri = Uri.parse(url);
  //   // var request = http.get(uri, headers: headers);
  //   var request = http.get(uri, headers: headers);
  //   var response = await request.timeout(Duration(seconds: 10));
  //   setState(() {
  //     users = jsonDecode(response.body);
  //   });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

   AnalyticInfoCardGridView(
    //Key key
  //crossAxisCount = 4,
 // childAspectRatio = 1.4,
  
  ) 
{}
  //int crossAxisCount;
  //double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 70.0,
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
              //  '50',
              users[0]["name"],
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                padding: EdgeInsets.all(appPadding / 2),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                 // info.svgSrc!,
                 "assets/icons/Subscribers.svg",
                  color: Colors.blue,
                ),
              )
            ],
          ),
          Text(
            //info.title!,
            'hi',
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
    ),  Container(
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
               '50',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                padding: EdgeInsets.all(appPadding / 2),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                 // info.svgSrc!,
                 "assets/icons/Subscribers.svg",
                  color: Colors.blue,
                ),
              )
            ],
          ),
          Text(
            //info.title!,
            'hi',
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
],);
        //info: analyticData[index],

  }
}
