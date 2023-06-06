import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/screens/dashboard/fluid_nav_bar.dart';
import 'package:s2w/utils.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return
      GestureDetector(
        onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) =>DashBoardScreen()));
       },
       child:  Center(child:
      Container(
        // beforeloadingtohomepageSyW (61:762)
        padding: EdgeInsets.fromLTRB(20*fem, 200*fem, 20*fem, 20*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroup7yab97E (PABYceGsaFXpdee6c97yaB)
              margin: EdgeInsets.fromLTRB(69.5*fem, 0*fem, 68.5*fem, 35*fem),
              width: double.infinity,
              height: 300*fem,
              child: Stack(
                children: [
                  Positioned(
                    // original67acc72cef7e760145952f (61:765)
                    left: 0*fem,
                    top: 169*fem,
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
                    // ellipse3wYt (61:838)
                    left: 0*fem,
                    top: 0*fem,
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
                    // ellipse424Y (61:839)
                    left: 16*fem,
                    top: 16*fem,
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
                    // JXr (61:840)
                    left: 31*fem,
                    top: 34*fem,
                    child: Align(
                      child: SizedBox(
                        width: 114*fem,
                        height: 114*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/-yL4.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // wearecustomizingyourdashboardo (61:841)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
              child: Text(
                'we are customizing your dashboard',
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
            Container(
              // takinglongerthenexpectedVsE (61:842)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
              child: Text(
                'taking longer then expected ',
                textAlign: TextAlign.center,
                style: TextStyle (
                  fontSize: 15*ffem,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff080053),
                ),
              ),
            ),
          ],
        ),
      )));
  }
}