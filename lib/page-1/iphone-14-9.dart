import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/utils.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iphone149X7v (57:12)
        padding: EdgeInsets.fromLTRB(9*fem, 65*fem, 5*fem, 124*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // colormoodboardcfA (57:14)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 38*fem),
              child: Text(
                'color mood board ',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Lato',
                  fontSize: 20*ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2*ffem/fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // autogrouperyhJH6 (PABGugH6wStkSK7GrAeryh)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // ellipse2pWL (57:29)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                    width: 84*fem,
                    height: 84*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(42*fem),
                      color: Color(0xff080053),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // ellipse1ibi (57:26)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                    width: 84*fem,
                    height: 84*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(42*fem),
                      color: Color(0xff6940f4),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // ellipse3DYU (57:27)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                    width: 84*fem,
                    height: 84*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(42*fem),
                      color: Color(0xffbaa6fd),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // ellipse4uw6 (57:28)
                    width: 84*fem,
                    height: 84*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(42*fem),
                      color: Color(0xffeaeaea),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroup2im1qJx (PABH91EELsKyNNMUZE2im1)
              margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 7.5*fem, 55*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // MHJ (57:19)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 49*fem, 0*fem),
                    child: Text(
                      '#080053',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // f4fYt (57:18)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 46*fem, 0*fem),
                    child: Text(
                      '#6940F4',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // baa6fePDz (57:17)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 48.5*fem, 0*fem),
                    child: Text(
                      '#BAA6FE',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Text(
                    // eaeaeaW3i (57:16)
                    '#EAEAEA',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupnzcjEkQ (PABHMahcCAE3xi6ExPNzCj)
              margin: EdgeInsets.fromLTRB(78.5*fem, 0*fem, 61*fem, 16*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // fontfamilylatoxwJ (57:13)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 56.5*fem, 0*fem),
                    child: Text(
                      'font family  LATO',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Text(
                    // 5FE (57:15)
                    '15',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupv6wf2AU (PABHWAHeRRbN5ETM3Rv6Wf)
              margin: EdgeInsets.fromLTRB(53.5*fem, 0*fem, 61*fem, 28*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // fontfamilyboldlato9kt (57:23)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 32.5*fem, 0*fem),
                    child: Text(
                      'font family Bold   LATO',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.2*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Text(
                    // Tma (57:20)
                    '20',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroup9zc3Cz4 (PABHfjr24CLsJiAND19zc3)
              margin: EdgeInsets.fromLTRB(57.5*fem, 0*fem, 61*fem, 32*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // fontfamilylightlatojUC (57:24)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 35.5*fem, 0*fem),
                    child: Text(
                      'font family Light   LATO',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.2*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Text(
                    // qGL (57:21)
                    '10',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupajcjytL (PABHp9mfiYUpEQdpSxaJcj)
              margin: EdgeInsets.fromLTRB(41*fem, 0*fem, 61*fem, 65*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // fontfamilyregularlato7zY (57:25)
                    margin: EdgeInsets.fromLTRB(0*fem, 4*fem, 19*fem, 0*fem),
                    child: Text(
                      'font family Regular    LATO',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // q9r (57:22)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                    child: Text(
                      '12',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Lato',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupm1x9knc (PABHy4gV5eJrianEEBM1X9)
              margin: EdgeInsets.fromLTRB(41*fem, 0*fem, 84*fem, 59*fem),
              width: double.infinity,
              height: 77*fem,
              decoration: BoxDecoration (
                color: Color(0xff080053),
                borderRadius: BorderRadius.circular(5*fem),
              ),
              child: Center(
                child: Text(
                  'Radius 50px',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont (
                    'Lato',
                    fontSize: 12*ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.2*ffem/fem,
                    color: Color(0xfffdfdfd),
                  ),
                ),
              ),
            ),
            Container(
              // marginleftrigt30cZv (57:32)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 0*fem),
              child: Text(
                'Margin  left & Rigt  30 ',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Lato',
                  fontSize: 12*ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2*ffem/fem,
                  color: Color(0xff6f6f6f),
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}