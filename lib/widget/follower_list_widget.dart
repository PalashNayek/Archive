




import 'package:flutter/material.dart';
import 'package:s2w/models/follower_list_model.dart';
import 'package:s2w/screens/chat/chat_screen.dart';

import '../models/following_list_model.dart';
import '../screens/other_account.dart';
import '../utils.dart';

class FollowerListWidgetItem extends StatelessWidget
{
  FollowerListWidgetItem(this.user);
  FollowerListModel user;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return    Container(
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
                   child:user.follower!.personalDetail!.elementAt(0).profile==null?Image.asset('assets/page-1/images/user.png',
                       width: 57*fem,
                       height: 56*fem,
                       fit: BoxFit.cover
                   ): Image.network(user.follower!.personalDetail!.elementAt(0).profile.toString(),
                       width: 57*fem,
                       height: 56*fem,
                       fit: BoxFit.cover
                   ),
                 )),


             Expanded(child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,

               children: [
                 Container(
                   margin: EdgeInsets.only(left: 10,top: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                   RichText(
                       text: TextSpan(
                         style: SafeGoogleFont (
                           'Netflix Sans',
                           fontSize: 16*ffem,
                           fontWeight: FontWeight.w500,
                           height: 1.171875*ffem/fem,
                           color: Color(0xff000000),
                         ),
                         children: [
                           TextSpan(
                             text:user.follower!.personalDetail!.elementAt(0).firstName.toString() ,
                             style: SafeGoogleFont (
                               'Lato',
                               fontSize: 16*ffem,
                               fontWeight: FontWeight.w700,
                               height: 1.2*ffem/fem,
                               color: Color(0xff000000),
                             ),
                           ),
                         ],
                       ),
                   ),
                   SizedBox(height: 5,),
                   Text(user.follower!.personalDetail!.elementAt(0).lastName.toString(),
                     style: SafeGoogleFont (
                       'Lato',
                       fontSize: 12*ffem,
                       fontWeight: FontWeight.w400,
                       height: 1.2*ffem/fem,
                       color: Color(0xff9496a1),
                     ),
                   ),
                 ],),),

                 //option/more icon
                GestureDetector(onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>OtherAccountContent(user.follower!.id.toString())));

                }, child:
                 Container(
                   width: 113*fem,
                   height: 40*fem,
                   margin: EdgeInsets.only(top: 10,right: 10),
                   decoration: BoxDecoration (
                     color: Color(0xff080053),
                     borderRadius: BorderRadius.circular(5*fem),
                   ),
                   child: Center(
                     child: Text("View",
                       style: SafeGoogleFont (
                         'Lato',
                         fontSize: 15*ffem,
                         fontWeight: FontWeight.w700,
                         height: 1.2*ffem/fem,
                         color: Color(0xffffffff),
                       ),
                     ),
                   ),
                 ),)
             ],))
             //username

           ],
         ),
        ],
      ),

    );
  }

}