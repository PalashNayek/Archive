import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/utils.dart';

class CommentxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // searchpagexQp (48:201)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfff7f7f7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupyulxgLp (PACKp1dgWDfykrWCkVYuLX)
              width: double.infinity,
              height: 73*fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle4Qnc (48:206)
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
                    // rectangle13UGg (48:207)
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
                    // rectangle14kjz (48:208)
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
                    // profileqmS (48:210)
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
                    // rectangle6XeG (48:216)
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
                    // rectangle47DGC (48:217)
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
                    // searchforferitiesvRW (48:218)
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
              // autogroupvciwzwA (PACLJFKdhnEPtoxJhwvCiw)
              padding: EdgeInsets.fromLTRB(17*fem, 2*fem, 21*fem, 11*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group158nU (48:272)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 15*fem),
                    width: 349*fem,
                    height: 779*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle12rCg (48:273)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 348*fem,
                              height: 779*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(5*fem),
                                  border: Border.all(color: Color(0x49000000)),
                                  color: Color(0xfff4f4f4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x146940f4),
                                      offset: Offset(3*fem, 4*fem),
                                      blurRadius: 22*fem,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // rectangle15W2L (48:274)
                          left: 0*fem,
                          top: 57.6633605957*fem,
                          child: Align(
                            child: SizedBox(
                              width: 348*fem,
                              height: 311.66*fem,
                              child: Image.asset(
                                'assets/page-1/images/rectangle-15-FdA.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // ellipse9cbA (48:275)
                          left: 2*fem,
                          top: 3*fem,
                          child: Align(
                            child: SizedBox(
                              width: 69*fem,
                              height: 68*fem,
                              child: Image.asset(
                                'assets/page-1/images/ellipse-9-Cyv.png',
                                width: 69*fem,
                                height: 68*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // kumarmrsharmaiu6 (48:276)
                          left: 84*fem,
                          top: 24.712890625*fem,
                          child: Align(
                            child: SizedBox(
                              width: 118*fem,
                              height: 18*fem,
                              child: Text(
                                'kumarmr sharma ',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2*ffem/fem,
                                  color: Color(0xc4080053),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // hagoRoW (48:277)
                          left: 305*fem,
                          top: 28.8316955566*fem,
                          child: Align(
                            child: SizedBox(
                              width: 35*fem,
                              height: 12*fem,
                              child: Text(
                                '22h ago',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 10*ffem,
                                  fontWeight: FontWeight.w300,
                                  height: 1.2*ffem/fem,
                                  color: Color(0x8c080053),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // sportscricketLfa (48:278)
                          left: 84*fem,
                          top: 42*fem,
                          child: Align(
                            child: SizedBox(
                              width: 63*fem,
                              height: 12*fem,
                              child: Text(
                                'Sports cricket ',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 10*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2*ffem/fem,
                                  color: Color(0x8c080053),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // simplyputloremipsumisdummytext (48:295)
                          left: 7*fem,
                          top: 382*fem,
                          child: Align(
                            child: SizedBox(
                              width: 342*fem,
                              height: 312*fem,
                              child: Text(
                                'Simply put, loremipsum is dummy text that occupies the space where the real content should be. If you are designing an online business such as a blog and you do not have content already, you use a lorem ipsum generator to create placeholder or dummy text to show you how the business will look once you add the real content.\nSimply put, loremipsum is dummy text that occupies the space where the real content should be. If you are designing an online business such as a blog and you do not have content already, you use a lorem ipsum generator to create placeholder or dummy text to show you how th ',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.6*ffem/fem,
                                  color: Color(0x8c080053),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // frame12shS (48:280)
                          left: 17*fem,
                          top: 746*fem,
                          child: Container(
                            width: 306*fem,
                            height: 14*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group11PQt (48:281)
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // M6p (48:282)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                        width: 14*fem,
                                        height: 14*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/-DFE.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        // kGja (48:283)
                                        '2.8K',
                                        style: SafeGoogleFont (
                                          'Lato',
                                          fontSize: 10*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2*ffem/fem,
                                          color: Color(0x8c080053),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 50*fem,
                                ),
                                Container(
                                  // group10zfa (48:285)
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // LzL (48:286)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                        width: 14*fem,
                                        height: 14*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/-JXz.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        // autogroupvggjgYQ (PACLppH2rC1veKsYWdvgGj)
                                        width: 21*fem,
                                        height: 13*fem,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // kbfN (48:287)
                                              left: 0*fem,
                                              top: 1*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 21*fem,
                                                  height: 12*fem,
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
                                              ),
                                            ),
                                            Positioned(
                                              // k3XN (48:294)
                                              left: 0*fem,
                                              top: 0*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 21*fem,
                                                  height: 12*fem,
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 50*fem,
                                ),
                                Opacity(
                                  // group9tnt (48:288)
                                  opacity: 0.3,
                                  child: Container(
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // SJc (48:289)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                          width: 14*fem,
                                          height: 14*fem,
                                          child: Image.asset(
                                            'assets/page-1/images/-fGt.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          // kBGC (48:290)
                                          '2.8K',
                                          style: SafeGoogleFont (
                                            'Lato',
                                            fontSize: 10*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2*ffem/fem,
                                            color: Color(0x8c080053),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50*fem,
                                ),
                                Opacity(
                                  // group8i1E (48:291)
                                  opacity: 0.3,
                                  child: Container(
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // FG4 (48:292)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                          width: 14*fem,
                                          height: 14*fem,
                                          child: Image.asset(
                                            'assets/page-1/images/-1Yc.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          // kyxk (48:293)
                                          '2.8K',
                                          style: SafeGoogleFont (
                                            'Lato',
                                            fontSize: 10*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2*ffem/fem,
                                            color: Color(0x8c080053),
                                          ),
                                        ),
                                      ],
                                    ),
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
                    // autogroupjkqfXzG (PACL7RJLp8Fem94thDJKQF)
                    margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
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
                          // shareyourcommentpTa (48:297)
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
                          // X76 (48:298)
                          margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                          width: 27*fem,
                          height: 27*fem,
                          child: Image.asset(
                            'assets/page-1/images/-75a.png',
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
          );
  }
}