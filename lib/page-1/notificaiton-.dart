import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return

      Container(
      width: double.infinity,
      child: Container(
        // notificaitonBha (15:3121)
        width: double.infinity,
        height: 873*fem,
        decoration: BoxDecoration (
          color: Color(0xfff7f7f7),
        ),
        child: Stack(
          children: [
            Positioned(
              // screenshot20230324at5211WE4 (17:3131)
              left: 0*fem,
              top: 0*fem,
              child: Align(
                child: SizedBox(
                  width: 390*fem,
                  height: 634*fem,
                  child: Image.asset(
                    'assets/page-1/images/screenshot-2023-03-24-at-521-1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // group17zf2 (17:3167)
              left: 264*fem,
              top: 451*fem,
              child: Container(
                width: 113*fem,
                height: 48*fem,
                decoration: BoxDecoration (
                  color: Color(0xff080053),
                  borderRadius: BorderRadius.circular(5*fem),
                ),
                child: Center(
                  child: Text(
                    'Following',
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 15*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // interest1Smv (17:3135)
              left: 95*fem,
              top: 82*fem,
              child: Align(
                child: SizedBox(
                  width: 87*fem,
                  height: 24*fem,
                  child: Text(
                    'interest 1',
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2*ffem/fem,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle42k1v (17:3132)
              left: 70*fem,
              top: 0*fem,
              child: Align(
                child: SizedBox(
                  width: 258*fem,
                  height: 41*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle434HW (17:3133)
              left: 39*fem,
              top: 63*fem,
              child: Align(
                child: SizedBox(
                  width: 146*fem,
                  height: 34*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // notificationb2Y (17:3137)
              left: 156*fem,
              top: 60*fem,
              child: Align(
                child: SizedBox(
                  width: 108*fem,
                  height: 24*fem,
                  child: Text(
                    'Notification',
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle446jz (17:3134)
              left: 241*fem,
              top: 57*fem,
              child: Align(
                child: SizedBox(
                  width: 126*fem,
                  height: 40*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle45Qkg (17:3141)
              left: 0*fem,
              top: 102*fem,
              child: Align(
                child: SizedBox(
                  width: 390*fem,
                  height: 4*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // notificationwVi (17:3146)
              left: 156*fem,
              top: 60*fem,
              child: Align(
                child: SizedBox(
                  width: 108*fem,
                  height: 24*fem,
                  child: Text(
                    'Notification',
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // notificationShN (17:3147)
              left: 23*fem,
              top: 14*fem,
              child: Align(
                child: SizedBox(
                  width: 65*fem,
                  height: 15*fem,
                  child: Text(
                    'Notification',
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2*ffem/fem,
                      color: Color(0xff000000),
                    ),
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