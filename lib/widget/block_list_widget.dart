




import 'package:flutter/material.dart';
import 'package:s2w/models/block_list_model.dart';
import 'package:s2w/models/follower_list_model.dart';
import 'package:s2w/screens/chat/chat_screen.dart';

import '../models/following_list_model.dart';
import '../screens/other_account.dart';
import '../utils.dart';

class BlockListWidgetItem extends StatelessWidget
{
  BlockListWidgetItem({required this.user,this.callback});
  BlockListModel user;
  final VoidCallback ? callback;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return    Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 7*fem, 7*fem),
        width: double.infinity,
        height: 100*fem,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(7*fem),
          border: Border.all(color: Color(0x99d6d6d6)),
          color: Color(0xffffffff),
        ),
        child: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //header
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [

                 //user
                 Container(
                     margin: EdgeInsets.all(5.0),
                     child: ClipRRect(
                     borderRadius: BorderRadius.circular(30.0),
                     child: Image.network(user.account!.personalDetail!.elementAt(0).profile.toString(),
                       width: 57*fem,
                       height: 56*fem,
                       filterQuality: FilterQuality.low,
                       fit: BoxFit.cover,
                       loadingBuilder: (BuildContext context,
                           Widget child,
                           ImageChunkEvent? loadingProgress) {
                         if (loadingProgress == null)
                           return child;
                         return Center(
                           child: CircularProgressIndicator(
                             value: loadingProgress
                                 .expectedTotalBytes !=
                                 null
                                 ? loadingProgress
                                 .cumulativeBytesLoaded /
                                 loadingProgress
                                     .expectedTotalBytes!
                                 : null,
                           ),
                         );
                       },
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
                                 text:user.account!.personalDetail!.elementAt(0).firstName.toString() ,
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
                       Text(user.account!.personalDetail!.elementAt(0).lastName.toString(),
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
                    GestureDetector(onTap: callback, child:
                     Container(
                       width: 113*fem,
                       height: 40*fem,
                       margin: EdgeInsets.only(top: 10,right: 10),
                       decoration: BoxDecoration (
                         color: Color(0xff080053),
                         borderRadius: BorderRadius.circular(5*fem),
                       ),
                       child: Center(
                         child: Text("UnBlock",
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
        ),

      ),
    );
  }

}