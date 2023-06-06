import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/utils.dart';

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(body: Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfff7f7f7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 73*fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 365*fem,
                    top: 30*fem,
                    child: Align(
                      child: SizedBox(
                        width: 4*fem,
                        height: 4*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(90*fem),
                            color: Color(0x75ffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x5e6940f4),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 25*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                     left: 365*fem,
                    top: 25*fem,
                    child: Align(
                      child: SizedBox(
                        width: 4*fem,
                        height: 4*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(90*fem),
                            color: Color(0x75ffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x5e6940f4),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 25*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 365*fem,
                    top: 20*fem,
                    child: Align(
                      child: SizedBox(
                        width: 4*fem,
                        height: 4*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(90*fem),
                            color: Color(0x75ffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x5e6940f4),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 25*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 56*fem,
                    top: 11*fem,
                    child: Align(
                      child: SizedBox(
                        width: 63*fem,
                        height: 24*fem,
                        child: Text(
                          'Profile ',
                          style: SafeGoogleFont (
                            'Lato',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2*ffem/fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 409*fem,
                        height: 73*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(5*fem),
                            color: Color(0xfff1f1f1),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x5e6940f4),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 25*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                     left: 21*fem,
                    top: 15*fem,
                    child: Align(
                      child: SizedBox(
                        width: 305*fem,
                        height: 32*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(16*fem),
                            border: Border.all(color: Color(0x33000000)),
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 54*fem,
                    top: 22*fem,
                    child: Align(
                      child: SizedBox(
                        width: 119*fem,
                        height: 18*fem,
                        child: Text(
                          'search for ferities ',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Lato',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w400,
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
            Container(
              padding: EdgeInsets.fromLTRB(21*fem, 21*fem, 21*fem, 11*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 425*fem),
                    width: double.infinity,
                    height: 302*fem,
                    decoration: BoxDecoration (
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x0f2c3039),
                          offset: Offset(0*fem, 24*fem),
                          blurRadius: 32*fem,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 378.45*fem,
                              height: 302*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 76*fem,
                          top: 184*fem,
                          child: Container(
                            width: 203*fem,
                            height: 24*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                   margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                  width: 24*fem,
                                  height: 24*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(12*fem),
                                    image: DecorationImage (
                                      fit: BoxFit.cover,
                                      image: AssetImage (
                                        'assets/page-1/images/ellipse-bg-Jpp.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                  child: Text(
                                    'Elsa Hosk',
                                    style: SafeGoogleFont (
                                      'Netflix Sans',
                                      fontSize: 12*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2575*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                     'Took a trip to LA last...',
                                  style: SafeGoogleFont (
                                    'Netflix Sans',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2575*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 76*fem,
                          top: 216*fem,
                          child: Container(
                            width: 208*fem,
                            height: 24*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                  width: 24*fem,
                                  height: 24*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(12*fem),
                                    image: const DecorationImage (
                                      fit: BoxFit.cover,
                                      image: AssetImage (
                                        'assets/page-1/images/ellipse-bg-VBN.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                   margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                                  child: Text(
                                    'Virgil Abloh',
                                    style: SafeGoogleFont (
                                      'Netflix Sans',
                                      fontSize: 12*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2575*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                   'I don’t think there’s...',
                                  style: SafeGoogleFont (
                                    'Netflix Sans',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2575*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // comment35cL (48:453)
                          left: 76*fem,
                          top: 248*fem,
                          child: Container(
                            width: 164*fem,
                            height: 24*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                  width: 24*fem,
                                  height: 24*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(12*fem),
                                    image: DecorationImage (
                                      fit: BoxFit.cover,
                                      image: AssetImage (
                                        'assets/page-1/images/ellipse-bg-xTz.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                                  child: Text(
                                    'Mark Anthony',
                                    style: SafeGoogleFont (
                                      'Netflix Sans',
                                      fontSize: 12*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2575*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                   'Love you!',
                                  style: SafeGoogleFont (
                                    'Netflix Sans',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2575*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 76*fem,
                          top: 134*fem,
                          child: Container(
                            width: 127*fem,
                            height: 16*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12*fem, 0*fem),
                                  child: Text(
                                    'Reply',
                                    style: SafeGoogleFont (
                                      'Netflix Sans',
                                      fontSize: 12*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2575*ffem/fem,
                                      color: Color(0xff9597a1),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                                  child: Text(
                                    'React',
                                    style: SafeGoogleFont (
                                      'Netflix Sans',
                                      fontSize: 12*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2575*ffem/fem,
                                      color: Color(0xff9597a1),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                  child: Text(
                                    '47 min ago',
                                    style: SafeGoogleFont (
                                      'Netflix Sans',
                                      fontSize: 10*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2575*ffem/fem,
                                      color: Color(0xff9597a1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // show37morerepliesS7S (48:458)
                          left: 76*fem,
                          top: 158*fem,
                          child: Align(
                            child: SizedBox(
                              width: 108*fem,
                              height: 16*fem,
                              child: Text(
                                'Show 37 more replies',
                                style: SafeGoogleFont (
                                  'Netflix Sans',
                                  fontSize: 12*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2575*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // commentX8t (48:461)
                          left: 16*fem,
                          top: 16*fem,
                          child: Container(
                            width: 288*fem,
                            height: 110*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                  width: 40*fem,
                                  height: 40*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(20*fem),
                                    image: DecorationImage (
                                      image: AssetImage (
                                        'assets/page-1/images/avatar-bg.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(12*fem, 10*fem, 12*fem, 14*fem),
                                  width: 240*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    color: Color(0x199597a1),
                                    borderRadius: BorderRadius.circular(16*fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                        child: Text(
                                          'Shawn Carter',
                                          style: SafeGoogleFont (
                                            'Netflix Sans',
                                            fontSize: 14*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2575*ffem/fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                           constraints: BoxConstraints (
                                          maxWidth: 195*fem,
                                        ),
                                        child: Text(
                                          'Also understand that, as humans, design can be emotional and stimulate the playful brain.',
                                          style: SafeGoogleFont (
                                            'Netflix Sans',
                                            fontSize: 14*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.509*ffem/fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 87*fem, 36*fem),
                    child: Text(
                      '2.8K',
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 10*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2*ffem/fem,
                        color: Color(0x8c080053),
                      ),
                    ),
                  ),
                  Container(
                     padding: EdgeInsets.fromLTRB(14.5*fem, 13*fem, 12*fem, 7*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0x33000000)),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(16*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                           margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 156.5*fem, 10*fem),
                          child: Text(
                            'share your comment ',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Lato',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                          width: 27*fem,
                          height: 27*fem,
                          child: Image.asset(
                            'assets/page-1/images/-9Di.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}