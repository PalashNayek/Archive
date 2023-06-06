import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/screens/dashboard/fluid_nav_bar.dart';
import 'package:s2w/screens/inerest_list.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/utils.dart';
import 'package:s2w/widget/interest_item.dart';
import 'package:s2w/widget/notification_widget.dart';

class InterestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child:
            Container(

              margin: EdgeInsets.fromLTRB(109*fem, 10*fem, 29*fem, 6*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // original67acc72cef7e760145952f (60:655)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 48*fem, 0*fem),
                    width: 169*fem,
                    height: 63*fem,
                    child: Image.asset(
                      'assets/page-1/images/app_logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // skipuKe (63:3254)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                    child: Text(
                      'SKIP>>',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 10*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2*ffem/fem,
                        color: Color(0xffff0000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body:
      GestureDetector(
        onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context) =>DashBoardScreen()));
    },
    child:

      Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(1*fem, 17*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(

          children: [
            SizedBox(
                width: double.infinity,
                height: 332*fem,
                child: Image.asset(
                  'assets/page-1/images/-fmS.png',
                  fit: BoxFit.fill,
                ),
              ),
            Container(
              margin: EdgeInsets.only(top: 250),
              width: 390*fem,
              height: 450*fem,
              decoration: BoxDecoration (
                border: Border.all(color: Color(0xfcd0cbff)),
                color: Color(0xfcffffff),
                borderRadius: BorderRadius.only (
                  topLeft: Radius.circular(36*fem),
                  topRight: Radius.circular(37*fem),
                  bottomRight: Radius.circular(5*fem),
                  bottomLeft: Radius.circular(5*fem),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0*fem, 4*fem),
                    blurRadius: 2*fem,
                  ),
                ],
              ),
              child: Column(
                children: [

                  SizedBox(height: 30,),
                  Align(

                    child: SizedBox(

                      width: 197*fem,
                      height: 24*fem,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'know us your interest ',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Lato',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2*ffem/fem,
                            color: Color(0xff080053),
                          ),
                        ),
                      ),
                     ),
                   ),
                   Align(
                      child: SizedBox(
                        width: double.infinity,
                        height: 18*fem,
                        child: Text(
                          'select primary and secondary interest ',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Lato',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2*ffem/fem,
                            color: Color(0xff080053),
                          ),
                        ),
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16,left: 16,right: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search your interest...",
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.grey.shade100
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(9*fem, 7*fem, 3*fem, 4*fem),
                      width: 111*fem,
                      height: 45*fem,
                      decoration: BoxDecoration (
                        border: Border.all(color:Colors.white),
                        color: secondary,
                        borderRadius: BorderRadius.circular(5*fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // 4uv (60:752)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11.33*fem, 0*fem),
                            width: 34*fem,
                            height: 34*fem,
                            child: Image.asset(
                              'assets/page-1/images/category1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            // cricketBUk (60:751)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2.31*fem),
                            child: Text(
                              'Cricket ',
                              style: SafeGoogleFont (
                                'Lato',
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2*ffem/fem,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  Container(
                      height: 150,
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      child:InterestListWidget(),
                  ),

                  SizedBox(height: 20,),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 346*fem,
                      height: 50*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff080053),
                        borderRadius: BorderRadius.circular(5*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Lato',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2*ffem/fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      )));
  }
}