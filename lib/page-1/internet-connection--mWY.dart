import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/utils.dart';

class HomePageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return
      SingleChildScrollView (
        physics: ScrollPhysics(),
    child:
      Container(
      width: double.infinity,
      child: Container(
        // internetconnectionWde (61:918)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              // group2423tU (61:994)
              opacity: 0.99,
              child: Container(
                padding: EdgeInsets.fromLTRB(15*fem, 40*fem, 25*fem, 7*fem),
                width: double.infinity,
                height: 76*fem,
                decoration: BoxDecoration (
                  color: Color(0xff080053),
                  borderRadius: BorderRadius.only (
                    bottomRight: Radius.circular(38*fem),
                    bottomLeft: Radius.circular(38*fem),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // original67acc72cef7e760145952f (62:997)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 155*fem, 0*fem),
                      width: 126*fem,
                      height: 47*fem,
                      child: Image.asset(
                        'assets/page-1/images/original-67acc72cef7e760145952f7d454b343d-removebg-preview-1-CXJ.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // autogroupkcz91ip (PABf3HuHBJ1yAjpntWKcZ9)
                      margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 5*fem, 5*fem),
                      padding: EdgeInsets.fromLTRB(9*fem, 9*fem, 9*fem, 9*fem),
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xff0a0445),
                        borderRadius: BorderRadius.circular(16*fem),
                      ),
                      child: Center(
                        // idE (62:1009)
                        child: SizedBox(
                          width: 14*fem,
                          height: 14*fem,
                          child: Image.asset(
                            'assets/page-1/images/-hYL.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroup9w5deWt (PABfAsWz1416AJqyu29w5d)
                      margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 5*fem),
                      width: 32*fem,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xff0a0445),
                        borderRadius: BorderRadius.circular(16*fem),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // xGg (62:1010)
                            left: 9*fem,
                            top: 9*fem,
                            child: Align(
                              child: SizedBox(
                                width: 14*fem,
                                height: 14*fem,
                                child: Image.asset(
                                  'assets/page-1/images/-WyE.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // Tz8 (62:1011)
                            left: 9*fem,
                            top: 9*fem,
                            child: Align(
                              child: SizedBox(
                                width: 14*fem,
                                height: 14*fem,
                                child: Image.asset(
                                  'assets/page-1/images/-RbE.png',
                                  fit: BoxFit.cover,
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
            ),
            Container(
              // autogroupdfmuzDN (PABd3Ba5bcQN5E6yz1dFMu)
              padding: EdgeInsets.fromLTRB(6*fem, 6*fem, 4*fem, 0*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogrouphhabi9N (PABb2jv6t6L2c4bsPLhHaB)
                    margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 9*fem, 6*fem),
                    width: double.infinity,
                    height: 283*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // group2423SY (62:1012)
                          left: 5*fem,
                          top: 0*fem,
                          child: Opacity(
                            opacity: 0.99,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(160*fem, 138*fem, 154*fem, 4*fem),
                              width: 362*fem,
                              height: 151*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(5*fem),
                                image: DecorationImage (
                                  fit: BoxFit.cover,
                                  image: AssetImage (
                                    'assets/page-1/images/rectangle-1-bg.png',
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3f000000),
                                    offset: Offset(0*fem, 4*fem),
                                    blurRadius: 2*fem,
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // ellipse422ret (62:1019)
                                    width: 9*fem,
                                    height: 9*fem,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(4.5*fem),
                                      color: Color(0xff0a0445),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4*fem,
                                  ),
                                  Container(
                                    // ellipse421aat (62:1018)
                                    width: 9*fem,
                                    height: 9*fem,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(4.5*fem),
                                      color: Color(0xff0a0445),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4*fem,
                                  ),
                                  Container(
                                    // ellipse420trU (62:1017)
                                    width: 9*fem,
                                    height: 9*fem,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(4.5*fem),
                                      color: Color(0xffd6d6d6),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4*fem,
                                  ),
                                  Container(
                                    // ellipse419RbW (62:1016)
                                    width: 9*fem,
                                    height: 9*fem,
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(4.5*fem),
                                      color: Color(0xff0a0445),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // momentsaDW (63:2734)
                          left: 0*fem,
                          top: 143*fem,
                          child: Container(
                            width: 367*fem,
                            height: 140*fem,
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
                                  // bg4Pa (63:2735)
                                  left: 0*fem,
                                  top: 11.5791015625*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 367*fem,
                                      height: 128.42*fem,
                                      child: Container(
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(5*fem),
                                          border: Border.all(color: Color(0xffe7e7e7)),
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // momentscoverforyouN9N (63:2736)
                                  left: 16*fem,
                                  top: 17*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 124*fem,
                                      height: 15*fem,
                                      child: Text(
                                        'Moments cover for you',
                                        style: SafeGoogleFont (
                                          'Lato',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2*ffem/fem,
                                          color: Color(0xff404040),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // profile3mJ (63:2737)
                                  left: 16*fem,
                                  top: 44*fem,
                                  child: Container(
                                    width: 342*fem,
                                    height: 83*fem,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          // autogroup2zd1kQp (PABbWE8JXXMJQJYY2u2zd1)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                                          width: 60*fem,
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // autogroupgtipskL (PABbfoggAJ6odnFZCUGtiP)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                                                width: double.infinity,
                                                height: 60*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // ellipseCnc (63:2743)
                                                      left: 3*fem,
                                                      top: 3*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 54*fem,
                                                          height: 54*fem,
                                                          child: Container(
                                                            decoration: BoxDecoration (
                                                              borderRadius: BorderRadius.circular(27*fem),
                                                              color: Color(0xff080053),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // ellipse7Pn (63:2744)
                                                      left: 0*fem,
                                                      top: 0*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 60*fem,
                                                          height: 60*fem,
                                                          child: Image.asset(
                                                            'assets/page-1/images/ellipse-VWp.png',
                                                            width: 60*fem,
                                                            height: 60*fem,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // RfN (63:2757)
                                                      left: 9*fem,
                                                      top: 9*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 42*fem,
                                                          height: 42*fem,
                                                          child: TextButton(
                                                            onPressed: () {},
                                                            style: TextButton.styleFrom (
                                                              padding: EdgeInsets.zero,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/page-1/images/-faG.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Center(
                                                // post8Jt (63:2738)
                                                child: Text(
                                                  'POST',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont (
                                                    'Lato',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // autogroupwmrsfJp (PABbtDVfSfmX3J6fkYWMrs)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                                          width: 60*fem,
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // profileaRn (63:2745)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                                                width: double.infinity,
                                                height: 60*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // ellipseJcg (63:2746)
                                                      left: 3*fem,
                                                      top: 3*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 54*fem,
                                                          height: 54*fem,
                                                          child: Container(
                                                            decoration: BoxDecoration (
                                                              borderRadius: BorderRadius.circular(27*fem),
                                                              image: DecorationImage (
                                                                fit: BoxFit.cover,
                                                                image: AssetImage (
                                                                  'assets/page-1/images/ellipse-bg-UTS.png',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // ellipse1GC (63:2747)
                                                      left: 0*fem,
                                                      top: 0*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 60*fem,
                                                          height: 60*fem,
                                                          child: Image.asset(
                                                            'assets/page-1/images/ellipse-pBa.png',
                                                            width: 60*fem,
                                                            height: 60*fem,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Center(
                                                // tensejT6 (63:2739)
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
                                                  child: Text(
                                                    'Tense ',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont (
                                                      'Lato',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2*ffem/fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // autogroupt3jheKA (PABc4o2NUwuDPj9bzeT3jh)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                                          width: 62*fem,
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // profilenAU (63:2748)
                                                margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 1*fem, 6*fem),
                                                width: double.infinity,
                                                height: 60*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // ellipsevGg (63:2749)
                                                      left: 3*fem,
                                                      top: 3*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 54*fem,
                                                          height: 54*fem,
                                                          child: Container(
                                                            decoration: BoxDecoration (
                                                              borderRadius: BorderRadius.circular(27*fem),
                                                              image: DecorationImage (
                                                                fit: BoxFit.cover,
                                                                image: AssetImage (
                                                                  'assets/page-1/images/ellipse-bg-ScG.png',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // ellipseDma (63:2750)
                                                      left: 0*fem,
                                                      top: 0*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 60*fem,
                                                          height: 60*fem,
                                                          child: Image.asset(
                                                            'assets/page-1/images/ellipse-wMA.png',
                                                            width: 60*fem,
                                                            height: 60*fem,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Center(
                                                // swimmingM76 (63:2740)
                                                child: Text(
                                                  'swimming',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont (
                                                    'Lato',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2*ffem/fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // autogroupt6cbg9N (PABcKcvzzdQj1DQgKVt6CB)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 0*fem),
                                          width: 60*fem,
                                          height: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                // profilecHv (63:2751)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                                                width: double.infinity,
                                                height: 60*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // ellipse92x (63:2752)
                                                      left: 3*fem,
                                                      top: 3*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 54*fem,
                                                          height: 54*fem,
                                                          child: Container(
                                                            decoration: BoxDecoration (
                                                              borderRadius: BorderRadius.circular(27*fem),
                                                              image: DecorationImage (
                                                                fit: BoxFit.cover,
                                                                image: AssetImage (
                                                                  'assets/page-1/images/ellipse-bg.png',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // ellipseqwN (63:2753)
                                                      left: 0*fem,
                                                      top: 0*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 60*fem,
                                                          height: 60*fem,
                                                          child: Image.asset(
                                                            'assets/page-1/images/ellipse-BLL.png',
                                                            width: 60*fem,
                                                            height: 60*fem,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Center(
                                                // footballyGt (63:2741)
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Text(
                                                    'football',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont (
                                                      'Lato',
                                                      fontSize: 14*ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2*ffem/fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Center(
                                          // etcJpx (63:2742)
                                          child: Text(
                                            'etc',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Lato',
                                              fontSize: 14*ffem,
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
                                Positioned(
                                  // profileFEQ (63:2754)
                                  left: 319*fem,
                                  top: 44*fem,
                                  child: Container(
                                    width: 60*fem,
                                    height: 60*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // ellipseBdr (63:2755)
                                          left: 3*fem,
                                          top: 3*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 54*fem,
                                              height: 54*fem,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(27*fem),
                                                  image: DecorationImage (
                                                    fit: BoxFit.cover,
                                                    image: AssetImage (
                                                      'assets/page-1/images/ellipse-bg-7Ut.png',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // ellipse6kp (63:2756)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 60*fem,
                                              height: 60*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse-bxL.png',
                                                width: 60*fem,
                                                height: 60*fem,
                                              ),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group246DqS (63:2572)
                    margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 7*fem, 7*fem),
                    width: double.infinity,
                    height: 404*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // bginC (63:2573)
                          left: 3*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 364*fem,
                              height: 404*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(7*fem),
                                  border: Border.all(color: Color(0x99d6d6d6)),
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // bgpqE (63:2574)
                          left: 3*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 364*fem,
                              height: 404*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(7*fem),
                                  border: Border.all(color: Color(0x99d6d6d6)),
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // bgLoa (63:2575)
                          left: 3*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 364*fem,
                              height: 404*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(7*fem),
                                  border: Border.all(color: Color(0x99d6d6d6)),
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // autogroupdjyjrX2 (PA9auQkBnyLjyPT3p7dJYj)
                          left: 0*fem,
                          top: 1.970703125*fem,
                          child: Align(
                            child: SizedBox(
                              width: 367*fem,
                              height: 402.03*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-djyj.png',
                                width: 367*fem,
                                height: 402.03*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // iconchevrondown8De (63:2648)
                          left: 333*fem,
                          top: 21*fem,
                          child: Align(
                            child: SizedBox(
                              width: 12*fem,
                              height: 6*fem,
                              child: Image.asset(
                                'assets/page-1/images/icon-chevron-down-KTN.png',
                                width: 12*fem,
                                height: 6*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // avatardgC (63:2650)
                          left: 16*fem,
                          top: 17.7368164062*fem,
                          child: Align(
                            child: SizedBox(
                              width: 40*fem,
                              height: 39.41*fem,
                              child: Image.asset(
                                'assets/page-1/images/avatar-gh6.png',
                                width: 40*fem,
                                height: 39.41*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // avatar9Pe (63:2651)
                          left: 16*fem,
                          top: 17.7368164062*fem,
                          child: Align(
                            child: SizedBox(
                              width: 40*fem,
                              height: 39.41*fem,
                              child: Image.asset(
                                'assets/page-1/images/avatar.png',
                                width: 40*fem,
                                height: 39.41*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // avatars4k (63:2652)
                          left: 9*fem,
                          top: 6*fem,
                          child: Align(
                            child: SizedBox(
                              width: 57*fem,
                              height: 56*fem,
                              child: Image.asset(
                                'assets/page-1/images/avatar-wzg.png',
                                width: 57*fem,
                                height: 56*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // jeromesharedeventBr8 (63:2653)
                          left: 68*fem,
                          top: 17.5905761719*fem,
                          child: Align(
                            child: SizedBox(
                              width: 149*fem,
                              height: 20*fem,
                              child: RichText(
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
                                      text: 'Jerome ',
                                      style: SafeGoogleFont (
                                        'Lato',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'shared',
                                      style: SafeGoogleFont (
                                        'Lato',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2*ffem/fem,
                                        color: Color(0xff9597a1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' event',
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
                            ),
                          ),
                        ),
                        Positioned(
                          // jeromesharedeventRXW (63:2654)
                          left: 68*fem,
                          top: 17.5905761719*fem,
                          child: Align(
                            child: SizedBox(
                              width: 149*fem,
                              height: 20*fem,
                              child: RichText(
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
                                      text: 'Jerome ',
                                      style: SafeGoogleFont (
                                        'Lato',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'shared',
                                      style: SafeGoogleFont (
                                        'Lato',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2*ffem/fem,
                                        color: Color(0xff9597a1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' event',
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
                            ),
                          ),
                        ),
                        Positioned(
                          // jeromesharedeventFex (63:2655)
                          left: 68*fem,
                          top: 17.5905761719*fem,
                          child: Align(
                            child: SizedBox(
                              width: 149*fem,
                              height: 20*fem,
                              child: RichText(
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
                                      text: 'Jerome ',
                                      style: SafeGoogleFont (
                                        'Lato',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'shared',
                                      style: SafeGoogleFont (
                                        'Lato',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2*ffem/fem,
                                        color: Color(0xff9597a1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' event',
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
                            ),
                          ),
                        ),
                        Positioned(
                          // april2019at1047am74t (63:2656)
                          left: 72*fem,
                          top: 41.3046875*fem,
                          child: Align(
                            child: SizedBox(
                              width: 105*fem,
                              height: 11*fem,
                              child: Text(
                                '12 April 2019 at 10:47 AM',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 9*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2*ffem/fem,
                                  color: Color(0xff9496a1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // april2019at1047amCc8 (63:2657)
                          left: 72*fem,
                          top: 41.3046875*fem,
                          child: Align(
                            child: SizedBox(
                              width: 105*fem,
                              height: 11*fem,
                              child: Text(
                                '12 April 2019 at 10:47 AM',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 9*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2*ffem/fem,
                                  color: Color(0xff9496a1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // april2019at1047am6Sc (63:2658)
                          left: 72*fem,
                          top: 41.3046875*fem,
                          child: Align(
                            child: SizedBox(
                              width: 105*fem,
                              height: 11*fem,
                              child: Text(
                                '12 April 2019 at 10:47 AM',
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 9*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2*ffem/fem,
                                  color: Color(0xff9496a1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // kbuA (63:2659)
                          left: 167*fem,
                          top: 363.6000976562*fem,
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
                          // kJHn (63:2660)
                          left: 167*fem,
                          top: 363.6000976562*fem,
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
                          // kQ5v (63:2661)
                          left: 167*fem,
                          top: 363.6000976562*fem,
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
                          // avatarsuHa (63:2662)
                          left: 13*fem,
                          top: 306.4487304688*fem,
                          child: Container(
                            width: 104*fem,
                            height: 31.53*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // ellipsepfS (63:2663)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 31.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/ellipse-ZAp.png',
                                        width: 32*fem,
                                        height: 31.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // ellipseY5e (63:2664)
                                  left: 24*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 31.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/ellipse-fCL.png',
                                        width: 32*fem,
                                        height: 31.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // ellipse4Jt (63:2665)
                                  left: 48*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 31.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/ellipse-iek.png',
                                        width: 32*fem,
                                        height: 31.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // ellipseZmS (63:2666)
                                  left: 72*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 31.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/ellipse-zKS.png',
                                        width: 32*fem,
                                        height: 31.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // avatarsHhS (63:2667)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Container(
                                    width: 104*fem,
                                    height: 31.53*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // ellipseQXA (63:2668)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 32*fem,
                                              height: 31.53*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse-4M6.png',
                                                width: 32*fem,
                                                height: 31.53*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // ellipse8CG (63:2669)
                                          left: 24*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 32*fem,
                                              height: 31.53*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse-zs2.png',
                                                width: 32*fem,
                                                height: 31.53*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // ellipseeRW (63:2670)
                                          left: 48*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 32*fem,
                                              height: 31.53*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse-PKv.png',
                                                width: 32*fem,
                                                height: 31.53*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // ellipseyTn (63:2671)
                                          left: 72*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 32*fem,
                                              height: 31.53*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse.png',
                                                width: 32*fem,
                                                height: 31.53*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // avatars7K6 (63:2672)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Container(
                                            width: 104*fem,
                                            height: 31.53*fem,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  // ellipseeZv (63:2673)
                                                  left: 0*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 32*fem,
                                                      height: 31.53*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/ellipse-xqe.png',
                                                        width: 32*fem,
                                                        height: 31.53*fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // ellipseNkp (63:2674)
                                                  left: 24*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 32*fem,
                                                      height: 31.53*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/ellipse-qHS.png',
                                                        width: 32*fem,
                                                        height: 31.53*fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // ellipseW6L (63:2675)
                                                  left: 48*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 32*fem,
                                                      height: 31.53*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/ellipse-FDS.png',
                                                        width: 32*fem,
                                                        height: 31.53*fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // ellipse2aU (63:2676)
                                                  left: 72*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 32*fem,
                                                      height: 31.53*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/ellipse-5Nx.png',
                                                        width: 32*fem,
                                                        height: 31.53*fem,
                                                      ),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // avatarsZKW (63:2677)
                          left: 104*fem,
                          top: 306.4487304688*fem,
                          child: Container(
                            width: 123*fem,
                            height: 31.53*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // ellipsegf2 (63:2678)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 31.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/ellipse-BTN.png',
                                        width: 32*fem,
                                        height: 31.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // ellipsecHn (63:2679)
                                  left: 24*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 31.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/ellipse-hbn.png',
                                        width: 32*fem,
                                        height: 31.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // ellipsejdJ (63:2680)
                                  left: 48*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 31.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/ellipse-9Di.png',
                                        width: 32*fem,
                                        height: 31.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // ellipseTJQ (63:2681)
                                  left: 72*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 31.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/ellipse-wo6.png',
                                        width: 32*fem,
                                        height: 31.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // ellipseNwA (63:2682)
                                  left: 91*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 31.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/ellipse-ABa.png',
                                        width: 32*fem,
                                        height: 31.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // kuAQ (63:2683)
                                  left: 99*fem,
                                  top: 7.7729492188*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 16*fem,
                                      height: 15*fem,
                                      child: Text(
                                        '8K',
                                        style: SafeGoogleFont (
                                          'Lato',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // avatarsDRz (63:2684)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Container(
                                    width: 123*fem,
                                    height: 31.53*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // ellipse9Ke (63:2685)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 32*fem,
                                              height: 31.53*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse-RjW.png',
                                                width: 32*fem,
                                                height: 31.53*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // ellipserzk (63:2686)
                                          left: 24*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 32*fem,
                                              height: 31.53*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse-cGY.png',
                                                width: 32*fem,
                                                height: 31.53*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // ellipsez5N (63:2687)
                                          left: 48*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 32*fem,
                                              height: 31.53*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse-2zL.png',
                                                width: 32*fem,
                                                height: 31.53*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // ellipseKNY (63:2688)
                                          left: 72*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 32*fem,
                                              height: 31.53*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse-s84.png',
                                                width: 32*fem,
                                                height: 31.53*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // ellipser7a (63:2689)
                                          left: 91*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 32*fem,
                                              height: 31.53*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/ellipse-gCx.png',
                                                width: 32*fem,
                                                height: 31.53*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // k4De (63:2690)
                                          left: 99*fem,
                                          top: 7.7729492188*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 16*fem,
                                              height: 15*fem,
                                              child: Text(
                                                '8K',
                                                style: SafeGoogleFont (
                                                  'Lato',
                                                  fontSize: 12*ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2*ffem/fem,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // avatarskcG (63:2691)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Container(
                                            width: 123*fem,
                                            height: 31.53*fem,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  // ellipsefz8 (63:2692)
                                                  left: 0*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 32*fem,
                                                      height: 31.53*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/ellipse-eiC.png',
                                                        width: 32*fem,
                                                        height: 31.53*fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // ellipsearC (63:2693)
                                                  left: 24*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 32*fem,
                                                      height: 31.53*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/ellipse-JDN.png',
                                                        width: 32*fem,
                                                        height: 31.53*fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // ellipseiBi (63:2694)
                                                  left: 48*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 32*fem,
                                                      height: 31.53*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/ellipse-TAY.png',
                                                        width: 32*fem,
                                                        height: 31.53*fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // ellipseEQx (63:2695)
                                                  left: 72*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 32*fem,
                                                      height: 31.53*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/ellipse-oEQ.png',
                                                        width: 32*fem,
                                                        height: 31.53*fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // ellipseAZW (63:2696)
                                                  left: 91*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 32*fem,
                                                      height: 31.53*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/ellipse-qPN.png',
                                                        width: 32*fem,
                                                        height: 31.53*fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // k5wN (63:2697)
                                                  left: 99*fem,
                                                  top: 7.7729492188*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 16*fem,
                                                      height: 15*fem,
                                                      child: Text(
                                                        '8K',
                                                        style: SafeGoogleFont (
                                                          'Lato',
                                                          fontSize: 12*ffem,
                                                          fontWeight: FontWeight.w700,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // iconeyeQCx (63:2698)
                          left: 225*fem,
                          top: 360.6440429688*fem,
                          child: Align(
                            child: SizedBox(
                              width: 20*fem,
                              height: 16.87*fem,
                              child: Image.asset(
                                'assets/page-1/images/icon-eye.png',
                                width: 20*fem,
                                height: 16.87*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // iconeye77N (63:2702)
                          left: 225*fem,
                          top: 360.6440429688*fem,
                          child: Align(
                            child: SizedBox(
                              width: 20*fem,
                              height: 16.87*fem,
                              child: Image.asset(
                                'assets/page-1/images/icon-eye-HGL.png',
                                width: 20*fem,
                                height: 16.87*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // iconeyepGg (63:2706)
                          left: 225*fem,
                          top: 360.6440429688*fem,
                          child: Align(
                            child: SizedBox(
                              width: 20*fem,
                              height: 16.87*fem,
                              child: Image.asset(
                                'assets/page-1/images/icon-eye-1UL.png',
                                width: 20*fem,
                                height: 16.87*fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group244w6Q (63:2544)
                    width: double.infinity,
                    height: 84.98*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // group2434wi (63:2545)
                          left: 0*fem,
                          top: 16.984375*fem,
                          child: Align(
                            child: SizedBox(
                              width: 380*fem,
                              height: 68*fem,
                              child: Image.asset(
                                'assets/page-1/images/group-243.png',
                                width: 380*fem,
                                height: 68*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // groupZtU (63:2564)
                          left: 127.5*fem,
                          top: 53*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 26*fem,
                                height: 11*fem,
                                child: Text(
                                  'Group',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Lato',
                                    fontSize: 9*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // group2453Yk (63:2565)
                          left: 47*fem,
                          top: 0*fem,
                          child: Container(
                            width: 42*fem,
                            height: 42*fem,
                            decoration: BoxDecoration (
                              color: Color(0xff080053),
                              borderRadius: BorderRadius.circular(21*fem),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  // vectorMpL (63:2567)
                                  left: 11*fem,
                                  top: 10*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 20.59*fem,
                                      height: 18.02*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector.png',
                                        width: 20.59*fem,
                                        height: 18.02*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // homeTcU (63:2568)
                                  left: 10*fem,
                                  top: 27*fem,
                                  child: Center(
                                    child: Align(
                                      child: SizedBox(
                                        width: 24*fem,
                                        height: 11*fem,
                                        child: Text(
                                          'Home',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Lato',
                                            fontSize: 9*ffem,
                                            fontWeight: FontWeight.w400,
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
                          ),
                        ),
                        Positioned(
                          // messagex3S (63:2569)
                          left: 224*fem,
                          top: 53*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 35*fem,
                                height: 11*fem,
                                child: Text(
                                  'Message',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Lato',
                                    fontSize: 9*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // profileSUQ (63:2570)
                          left: 329.5*fem,
                          top: 53*fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 29*fem,
                                height: 11*fem,
                                child: Text(
                                  'Profile ',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Lato',
                                    fontSize: 9*ffem,
                                    fontWeight: FontWeight.w400,
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