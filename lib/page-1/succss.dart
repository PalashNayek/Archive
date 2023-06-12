import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:s2w/screens/register_screen.dart';
import 'package:s2w/utils.dart';

import '../presenter/auth_presenter.dart';
import '../screens/dashboard/fluid_nav_bar.dart';
import '../screens/login_screen.dart';
import '../utilities/app_local_data_util.dart';
import 'succss-Qmn.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  AuthPresenter authPresenter = AuthPresenter();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 5);
    return Timer(duration, () async {
      await AppLocalDataUtil().getToken().then((value) {
        authPresenter.checkProfile().then((value) {
          print(value.toString());
          if (!value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DashBoardScreen()));
          }
        }).catchError(() {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        });
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your profile is created.",
                  style: TextStyle(fontSize: 25, color: Colors.black)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Lottie.network(
                        "https://assets10.lottiefiles.com/packages/lf20_zfszhesy.json"),),
              ),
              Text(
                "Please wait sometime...",
                style: TextStyle(fontSize: 18, color: Colors.black),
              )
            ],
          ),
        )

        /*Column(
        children: [
          Center(
            child: Column(
              children: [
                Center(
                    child: Lottie.network(
                        "https://assets10.lottiefiles.com/packages/lf20_zfszhesy.json")),
                Text("Please wait...", style: TextStyle(fontSize: 20, color: Colors.black),)
              ],
            ),
          ),
        ],
      ),*/
        ); //"https://assets10.lottiefiles.com/packages/lf20_zfszhesy.json"

    /*return Scaffold(
        body: Container(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 17 * fem, 0 * fem, 0 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 1 * fem, 48 * fem),
                    width: 169 * fem,
                    height: 63 * fem,
                    child: Image.asset(
                      'assets/page-1/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 650 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 14 * fem,
                          top: 6 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 362 * fem,
                              height: 426 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14 * fem),
                                  border: Border.all(color: Color(0x19000000)),
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                      offset: Offset(34 * fem, 33 * fem),
                                      blurRadius: 22 * fem,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 55 * fem,
                          top: 234 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 270 * fem,
                              height: 30 * fem,
                              child: Text(
                                'OTP has been verified',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Lato',
                                  fontSize: 25 * ffem,
                                  fontWeight: FontWeight.w800,
                                  height: 1.2 * ffem / fem,
                                  color: Color(0xff080053),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 14 * fem,
                          top: 278 * fem,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                  50.5 * fem, 0 * fem, 50.5 * fem, 0 * fem),
                              width: 359 * fem,
                              height: 122 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5 * fem),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 34 * fem),
                                    constraints: BoxConstraints(
                                      maxWidth: 258 * fem,
                                    ),
                                    child: Text(
                                      'Enjoy the new experience of social media with friend & Family ',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Lato',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff080053),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(35.5 * fem,
                                        0 * fem, 40.5 * fem, 0 * fem),
                                    width: double.infinity,
                                    height: 52 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xff080053),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'GOT IT',
                                        style: SafeGoogleFont(
                                          'Lato',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2 * ffem / fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 108 * fem,
                          top: 45 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 150 * fem,
                              height: 150 * fem,
                              child: Image.asset(
                                'assets/page-1/images/verified.png',
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
            )));*/
  }
}
