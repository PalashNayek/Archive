import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/screens/interest_screen.dart';
import 'package:s2w/utils.dart';

class Register1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return
      GestureDetector(
        onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) =>InterestScreen()));
      },
      child:Scaffold(body: Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(0*fem, 17*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // original67acc72cef7e760145952f (59:582)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 64*fem),
              width: 169*fem,
              height: 63*fem,
              child: Image.asset(
                'assets/page-1/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // autogroup3xy3FiQ (PABTTNhryV45pHFLe93xY3)
              width: double.infinity,
              height: 650*fem,
              child: Stack(
                children: [
                  Positioned(
                    // aVn (60:630)
                    left: 25*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 341*fem,
                        height: 332*fem,
                        child: Image.asset(
                          'assets/page-1/images/-hZ2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle6szg (60:631)
                    left: 0*fem,
                    top: 220*fem,
                    child: Align(
                      child: SizedBox(
                        width: 390*fem,
                        height: 518*fem,
                        child: Container(
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
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // enjoythenewexpricneofsocicomed (60:632)
                    left: 70.5*fem,
                    top: 292*fem,
                    child: Align(
                      child: SizedBox(
                        width: 258*fem,
                        height: 36*fem,
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
                    ),
                  ),
                  Positioned(
                    // group221xue (60:633)
                    left: 22*fem,
                    top: 564*fem,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 346*fem,
                        height: 64*fem,
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
                  ),
                  Positioned(
                    // enteryourbasicdetailbxc (60:636)
                    left: 95*fem,
                    top: 262*fem,
                    child: Align(
                      child: SizedBox(
                        width: 209*fem,
                        height: 24*fem,
                        child: Text(
                          'Enter your Basic Detail ',
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
                  Positioned(
                    // group1UmW (60:637)
                    left: 21*fem,
                    top: 332*fem,
                    child: Opacity(
                      opacity: 0.45,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13*fem, 13*fem, 189*fem, 14*fem),
                        width: 347*fem,
                        height: 60*fem,
                        decoration: BoxDecoration (
                          border: Border.all(color: Color(0x59000000)),
                          color: Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(5*fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // clock1XUt (60:641)
                              margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 8*fem, 0*fem),
                              width: 31*fem,
                              height: 31*fem,
                              child: Image.asset(
                                'assets/page-1/images/clock-1-kfa.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // rectangle6pyn (60:640)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                              width: 1*fem,
                              height: 33*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(5*fem),
                                color: Color(0x87a1a1a1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x5e6940f4),
                                    offset: Offset(0*fem, 4*fem),
                                    blurRadius: 25*fem,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // username8Ug (60:639)
                              margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                              child: Text(
                                'user name ',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group22SkG (60:642)
                    left: 21*fem,
                    top: 408*fem,
                    child: Opacity(
                      opacity: 0.45,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13*fem, 13*fem, 227*fem, 14*fem),
                        width: 347*fem,
                        height: 60*fem,
                        decoration: BoxDecoration (
                          border: Border.all(color: Color(0x59000000)),
                          color: Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(5*fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // clock1tcG (60:646)
                              margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 8*fem, 0*fem),
                              width: 31*fem,
                              height: 31*fem,
                              child: Image.asset(
                                'assets/page-1/images/clock-1-AKa.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // rectangle6oz8 (60:645)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                              width: 1*fem,
                              height: 33*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(5*fem),
                                color: Color(0x87a1a1a1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x5e6940f4),
                                    offset: Offset(0*fem, 4*fem),
                                    blurRadius: 25*fem,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // nameKSg (60:644)
                              margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                              child: Text(
                                'Name ',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group243da (60:647)
                    left: 21*fem,
                    top: 490*fem,
                    child: Opacity(
                      opacity: 0.45,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13*fem, 13*fem, 165*fem, 14*fem),
                        width: 347*fem,
                        height: 60*fem,
                        decoration: BoxDecoration (
                          border: Border.all(color: Color(0x59000000)),
                          color: Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(5*fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // clock1hy2 (60:651)
                              margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 8*fem, 0*fem),
                              width: 31*fem,
                              height: 31*fem,
                              child: Image.asset(
                                'assets/page-1/images/clock-1-ynQ.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // rectangle631J (60:650)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                              width: 1*fem,
                              height: 33*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(5*fem),
                                color: Color(0x87a1a1a1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x5e6940f4),
                                    offset: Offset(0*fem, 4*fem),
                                    blurRadius: 25*fem,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // dateofbirthLFJ (60:649)
                              margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                              child: Text(
                                'Date Of Birth',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
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
      )  ));
  }
}