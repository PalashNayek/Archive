import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:s2w/screens/register_screen.dart';
import 'package:s2w/utils.dart';
import 'package:shimmer/shimmer.dart';

import '../presenter/auth_presenter.dart';
import '../screens/dashboard/fluid_nav_bar.dart';
import '../screens/login_screen.dart';
import '../utilities/app_local_data_util.dart';
import '../widget/custom_snackbar.dart';
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
    var duration = const Duration(seconds: 5);
    return Timer(duration, () async {
      await AppLocalDataUtil().getToken().then((value) {
        authPresenter.checkProfile().then((value) {
          if (!value) {
            /*Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));*/
            showCustomSnackBar(
                "please remove this msg".tr(),
                context);
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
              Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.red,
                child: const Text("Your profile is creating.",
                    style: TextStyle(fontSize: 25, color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Lottie.network(
                    "https://assets10.lottiefiles.com/packages/lf20_zfszhesy.json",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                "Please wait sometime...",
                style: TextStyle(fontSize: 18, color: Colors.black),
              )
            ],
          ),
        ));
  }
}
