import 'dart:async';
import 'dart:ffi';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:s2w/presenter/auth_presenter.dart';
import 'package:s2w/screens/dashboard/fluid_nav_bar.dart';
import 'package:s2w/screens/login_screen.dart';
import 'dart:ui';
import 'package:s2w/screens/onboard/onboard_screen.dart';
import 'package:s2w/screens/register_screen.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/utils.dart';

import '../utilities/app_common_helper.dart';
import '../utilities/app_local_data_util.dart';
import '../widget/custom_snackbar.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  AuthPresenter authPresenter = AuthPresenter();
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  @override
  void initState() {
    startSteaming();
    //print("PKNayek->$isConnected");
    super.initState();

    setState(() {
      startSteaming();
    });
  }

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
      /*const CircularProgressIndicator();
      */
      getData();
    } else {
      isConnected = false;

      /*showCustomSnackBar(
          "No internet connection".tr(),
          context);*/
      showDialogBox();
    }
    setState(() {});
  }

  showDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text("No internet connection"),
              content: const Text("Please check your internet connection"),
              actions: [
                CupertinoButton.filled(
                    child: const Text("Retry"),
                    onPressed: () {
                      Navigator.pop(context);
                      checkInternet();
                    })
              ],
            ));
  }

  startSteaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }

  Future<void> getData() async {
    await AppLocalDataUtil().getToken().then((value) async {
      if (value == null) {
        await AppLocalDataUtil().getOnBoard().then((value) {
          if (value == null) {
            Timer(
                Duration(seconds: 3),
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => OnBoardScreen())));
          } else {
            Timer(
                Duration(seconds: 3),
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen())));
          }
        });
      } else {
        authPresenter.checkProfile().then((value) {
          if (!value) {
            Timer(
                Duration(seconds: 3),
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen())));
          } else {
            Timer(
                Duration(seconds: 3),
                () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashBoardScreen())));
          }
        }).catchError(() {
          Timer(
              Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen())));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: AppCommonHelper.isTablet(context) ? height : 811 * fem,
        decoration: BoxDecoration(
          color: primary,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 60 * fem,
              top: AppCommonHelper.isTablet(context) ? 300 : 356 * fem,
              child: Align(
                child: SizedBox(
                  width: 270 * fem,
                  height: 150 * fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      'assets/page-1/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 80 * fem,
              top: AppCommonHelper.isTablet(context) ? height - 100 : 540 * fem,
              child: Align(
                child: SizedBox(
                  width: 212 * fem,
                  height: 50 * fem,
                  child: Text(
                    'SPORTO',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Lato',
                      fontSize: 30 * ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.2 * ffem / fem,
                      color: Color(0xffc5c5c5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 80 * fem,
              top: AppCommonHelper.isTablet(context) ? height - 100 : 580 * fem,
              child: Align(
                child: SizedBox(
                  width: 212 * fem,
                  height: 24 * fem,
                  child: Text(
                    'Sports Media App',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Lato',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2 * ffem / fem,
                      color: Color(0xffc5c5c5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 164 * fem,
              top: AppCommonHelper.isTablet(context) ? height - 150 : 680 * fem,
              child: Align(
                child: SizedBox(
                  width: 60 * fem,
                  height: 80 * fem,
                  child: Column(
                    children: [
                      const CircularProgressIndicator(strokeWidth: 3,color: Colors.white, ),
                      SizedBox(
                        width: 10 * fem,
                        height: 10 * fem,
                      ),
                      Text(
                        'Beta V',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Lato',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2 * ffem / fem,
                          color: Color(0xffc5c5c5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /* Positioned(
              left: 183*fem,
              top: AppCommonHelper.isTablet(context)?height-230 :697*fem,
              child: Align(
                child: SizedBox(
                  width: 22*fem,
                  height: 22*fem,
                  child: Image.asset(
                    'assets/page-1/images/india.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
