import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/utils.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(32*fem, 182*fem, 41*fem, 135*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(52*fem, 0*fem, 43*fem, 11*fem),
              width: double.infinity,
              height: 222*fem,
              decoration: BoxDecoration (
                color: Color(0x33a9ffb1),
                borderRadius: BorderRadius.circular(111*fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0*fem, 4*fem),
                    blurRadius: 2*fem,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    // ellipse4Tsv (61:848)
                    left: 38*fem,
                    top: 37*fem,
                    child: Align(
                      child: SizedBox(
                        width: 144*fem,
                        height: 144*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(72*fem),
                            color: Color(0x33a9ffb1),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // xJt (61:849)
                    left: 39*fem,
                    top: 43*fem,
                    child: Align(
                      child: SizedBox(
                        width: 143*fem,
                        height: 143*fem,
                        child: Image.asset(
                          'assets/page-1/images/-BpC.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(32*fem, 0*fem, 0*fem, 3*fem),
              width: 169*fem,
              height: 63*fem,
              child: Image.asset(
                'assets/page-1/images/original-67acc72cef7e760145952f7d454b343d-removebg-preview-1-yEp.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // nointernetconnectionAvk (61:866)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
              child: Text(
                'No internet connection ',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Lato',
                  fontSize: 30*ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.2*ffem/fem,
                  color: Color(0xff080053),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 0*fem, 32*fem),
              constraints: BoxConstraints (
                maxWidth: 258*fem,
              ),
              child: Text(
                'Enjoy the new expricne of socico media \nwith friend & Family ',
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
            Container(
              margin: EdgeInsets.fromLTRB(41*fem, 0*fem, 25*fem, 0*fem),
              width: double.infinity,
              height: 72*fem,
              decoration: BoxDecoration (
                color: Color(0xff080053),
                borderRadius: BorderRadius.circular(5*fem),
              ),
              child: Center(
                child: Text(
                  'back to home',
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
          ],
        ),
      ),
          );
  }
}