




import 'package:flutter/material.dart';
import 'package:s2w/screens/chat/chat_screen.dart';

import '../models/following_list_model.dart';
import '../utils.dart';

class UserWidgetItem extends StatelessWidget
{
  UserWidgetItem(this.user);
  FollowingListModel user;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return
      Container(
      margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 7*fem, 7*fem),
      width: double.infinity,
      height: 70*fem,
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(7*fem),
        border: Border.all(color: Color(0x99d6d6d6)),
        color: Color(0xffffffff),
      ),
      child: Column(
        children: [
          //header
         Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [

             //user
             Container(
                 margin: EdgeInsets.all(5.0),
                 child: ClipRRect(
                 borderRadius: BorderRadius.circular(30.0),
                 child: Image.network(user.following!.personalDetail!.elementAt(0).profile.toString(),
                   width: 57*fem,
                   height: 56*fem,
                   fit: BoxFit.cover
               ),
             )),

             Expanded(child:CheckboxListTile(
               title: new Text(user.following!.personalDetail!.elementAt(0).firstName.toString()),
               value: false,
               activeColor: Colors.pink,
               checkColor: Colors.white,
               onChanged: (bool? value) {
                /* setState(() {

                 });*/
               },
             ))
             //username

           ],
         ),
        ],
      ),

    );
  }

}