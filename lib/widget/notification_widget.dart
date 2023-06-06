import 'package:flutter/material.dart';
import 'package:s2w/models/notification_model.dart';

import '../utilities/app_common_helper.dart';
import '../utils.dart';

class NotificationWidgetItem extends StatelessWidget
{
  NotificationWidgetItem(this.user);
  NotificationModel user;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return   Container(
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
                 child: Image.asset("assets/page-1/images/user.png",
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
                             text: user.title.toString(),
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
                   Text(user.desc.toString(),
                     style: SafeGoogleFont (
                       'Lato',
                       fontSize: 12*ffem,
                       fontWeight: FontWeight.w400,
                       height: 1.2*ffem/fem,
                       color: Color(0xff9496a1),
                     ),
                   ),
                 ],),),

                 Text(AppCommonHelper.timeAgoCustom(user.createdAt.toString()),
                   style: SafeGoogleFont (
                     'Lato',
                     fontSize: 9*ffem,
                     fontWeight: FontWeight.w400,
                     height: 1.2*ffem/fem,
                     color: Color(0xff9496a1),
                   ),
                 ),
                 SizedBox(width: 5,)
                 //option/more icon
              /*  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Image.asset(
                     'assets/page-1/images/icon-chevron-down-KTN.png',
                     width: 12*fem,
                     height: 6*fem,
                   )
                )*/
             ],))
             //username

           ],
         ),
        ],
      ),
    );
  }

}