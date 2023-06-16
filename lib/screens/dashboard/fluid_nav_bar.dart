

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:s2w/page-1/internet-connection-.dart';
import 'package:s2w/screens/notification.dart';
import 'package:s2w/screens/user_list.dart';
import 'package:s2w/socket/socket_manager.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/utilities/app_local_data_util.dart';

import '../../models/profile_model.dart';
import '../../presenter/auth_presenter.dart';
import '../account.dart';
import '../chat/conversion_list.dart';
import '../home.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State createState() {
    return _DashBoardScreen();
  }
}

class _DashBoardScreen extends State {
  Widget? _child;

  bool internetConnection=true;
  AuthPresenter authPresenter= AuthPresenter();
  ProfileModel profileModel=ProfileModel();
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  @override
  void initState() {
    _child = HomeContent();
    startSteaming();
    InternetConnectionChecker().hasConnection.then((value) {
      internetConnection=value;
      setState(() {

      });
      authPresenter.getProfile().then((value) {
        profileModel=value;

        AppLocalDataUtil().getToken().then((value) {
          initSocketManager(context, value.toString(),profileModel.user!.accountId.toString());
        });
      });


    });
    super.initState();
  }

  startSteaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;

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

  @override
  Widget build(context) {

    // Build a simple container that switches content based of off the selected navigation item
    return  WillPopScope(
      onWillPop: () async {
        // Call the exit method to exit the app
        SystemNavigator.pop();
        return false; // Return false to prevent default back button behavior
      },
      child: Scaffold(
          backgroundColor: background,
          extendBody: true,
          body:  internetConnection? _child: NoInternet(),
          bottomNavigationBar:
          Container(color: Colors.white, child:FluidNavBar(
            icons: [
              FluidNavBarIcon(
                  icon: Icons.home,
                  backgroundColor: primary,
                  extras: {"label": "home"}),
              FluidNavBarIcon(
                  icon: Icons.notifications,
                  backgroundColor: primary,
                  extras: {"label": "notification"}),

              FluidNavBarIcon(
                  icon: Icons.chat,
                  backgroundColor: primary,
                  extras: {"label": "chat"}),
              FluidNavBarIcon(
                  icon: Icons.account_circle,
                  backgroundColor: primary,
                  extras: {"label": "account"}),
            ],
            onChange: _handleNavigationChange,
            style: FluidNavBarStyle(
                barBackgroundColor: primary,
                iconBackgroundColor: Colors.white,
                iconSelectedForegroundColor: Colors.white,
                iconUnselectedForegroundColor: Colors.white),
            scaleFactor: 1.5,
            defaultIndex: 0,
            itemBuilder: (icon, item) => Semantics(
              label: icon.extras!["label"],
              child: item,
            ),
          ) ,)

      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeContent();
          break;
        case 1:
          _child = NotificationContent();
          break;
        case 2:
          _child=ConversationList();
         // _child =UserListContent(); //SettingsContent();
          break;
        case 3:
          _child = AccountContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
