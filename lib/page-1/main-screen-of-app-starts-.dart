import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/utils.dart';

import '../screens/login_screen.dart';

class MainScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(body:
        Container(
         width: double.infinity,
         child: Container(
          padding: EdgeInsets.fromLTRB(0*fem, 17*fem, 0*fem, 48*fem),
          width: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 74*fem),
              width: double.infinity,
              height: 450*fem,
              child: Stack(
                children: [
                  Positioned(
                     left: 110*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 169*fem,
                        height: 63*fem,
                        child: Image.asset(
                          'assets/page-1/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                     left: 101*fem,
                    top: 168*fem,
                    child: Align(
                      child: SizedBox(
                        width: 177*fem,
                        height: 177*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(88.5*fem),
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
                    // ellipse5zwz (58:425)
                    left: 298*fem,
                    top: 345*fem,
                    child: Align(
                      child: SizedBox(
                        width: 148*fem,
                        height: 148*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(74*fem),
                            color: Color(0x1c080053),
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
                    left: 0*fem,
                    top: 314*fem,
                    child: Align(
                      child: SizedBox(
                        width: 179*fem,
                        height: 179*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(89.5*fem),
                            color: Color(0x33baa6fd),
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
                    left: 0*fem,
                    top: 16*fem,
                    child: Align(
                      child: SizedBox(
                        width: 179*fem,
                        height: 179*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(89.5*fem),
                            color: Color(0x33baa6fd),
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
                    left: 267*fem,
                    top: 47*fem,
                    child: Align(
                      child: SizedBox(
                        width: 179*fem,
                        height: 179*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(89.5*fem),
                            color: Color(0x33ffdbba),
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
                    left: 117*fem,
                    top: 184*fem,
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
                    left: 311*fem,
                    top: 358*fem,
                    child: Align(
                      child: SizedBox(
                        width: 121*fem,
                        height: 121*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(60.5*fem),
                            color: Color(0x1c080053),
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
                    left: 326*fem,
                    top: 375*fem,
                    child: Align(
                      child: SizedBox(
                        width: 92*fem,
                        height: 92*fem,
                        child: Image.asset(
                          'assets/page-1/images/-48G.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0*fem,
                    top: 330*fem,
                    child: Align(
                      child: SizedBox(
                        width: 146*fem,
                        height: 146*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(73*fem),
                            color: Color(0x33baa6fd),
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
                    left: 0*fem,
                    top: 32*fem,
                    child: Align(
                      child: SizedBox(
                        width: 146*fem,
                        height: 146*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(73*fem),
                            color: Color(0x33baa6fd),
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
                    left: 283*fem,
                    top: 63*fem,
                    child: Align(
                      child: SizedBox(
                        width: 146*fem,
                        height: 146*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(73*fem),
                            color: Color(0x33ffdbba),
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
                    left: 298*fem,
                    top: 80*fem,
                    child: Align(
                      child: SizedBox(
                        width: 115*fem,
                        height: 115*fem,
                        child: Image.asset(
                          'assets/page-1/images/-3bW.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0*fem,
                    top: 48*fem,
                    child: Align(
                      child: SizedBox(
                        width: 115*fem,
                        height: 115*fem,
                        child: Image.asset(
                          'assets/page-1/images/-dBn.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 132*fem,
                    top: 202*fem,
                    child: Align(
                      child: SizedBox(
                        width: 114*fem,
                        height: 114*fem,
                        child: Image.asset(
                          'assets/page-1/images/-7Qc.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0*fem,
                    top: 353*fem,
                    child: Align(
                      child: SizedBox(
                        width: 114*fem,
                        height: 114*fem,
                        child: Image.asset(
                          'assets/page-1/images/-zDv.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(17*fem, 0*fem, 0*fem, 8*fem),
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
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 27*fem),
              child: Text(
                'Right Post to Right Person',
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
              margin: EdgeInsets.fromLTRB(69*fem, 0*fem, 70*fem, 0*fem),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginScreen()));

                },
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: double.infinity,
                  height: 60*fem,
                  decoration: BoxDecoration (
                    color: Color(0xff080053),
                    borderRadius: BorderRadius.circular(5*fem),
                  ),
                  child: Center(
                    child: Text(
                      'Lets Start ',
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
            ),
          ],
          ),
          )));
  }
}