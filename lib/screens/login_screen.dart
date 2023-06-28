import 'dart:io';

import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:device_info/device_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:s2w/screens/otp.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/utils.dart';
import 'package:s2w/widget/custom_snackbar.dart';

import '../utilities/app_common_helper.dart';
import '../utils/app_constants.dart';
import '../view_model/DeviceViewModel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> {
  TextEditingController mobileController = TextEditingController();
  bool term = true;
  bool internetConnection = true;
  PhoneNumber phoneNumber =
      PhoneNumber(countryISOCode: 'IN', countryCode: 'IN', number: '');
  FocusNode focusNodeMobile = FocusNode();

  @override
  void dispose() {
    mobileController
        .dispose(); // The framework will automatically dispose of the controller
    super.dispose();
  }

  /*Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId; // Use Android ID as the device ID
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor; // Use Identifier for Vendor as the device ID
    }
    return ''; // Return an empty string for unsupported platforms
  }*/


  @override
  Widget build(BuildContext context) {


    //DeviceInfoViewModel viewModel = Provider.of<DeviceInfoViewModel>(context);
    print("device id");
    //print(viewModel.deviceInfo?.deviceId ?? 'N/A');
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Container(
                padding: EdgeInsets.only(top: 7),
                width: double.infinity,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 17 * fem, 0 * fem, 35 * fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 10 * fem, 1 * fem, 30 * fem),
                                decoration: BoxDecoration(
                                  color: Color(0xff080053),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(38 * fem),
                                    bottomLeft: Radius.circular(38 * fem),
                                  ),
                                ),
                                width: AppCommonHelper.isTablet(context)
                                    ? width
                                    : 169 * fem,
                                height: 40 * fem,
                                child: Container(
                                  child: Image.asset(
                                    'assets/page-1/images/app_logo.png',
                                    fit: AppCommonHelper.isTablet(context)
                                        ? BoxFit.contain
                                        : BoxFit.cover,
                                  ),
                                )),
                            Container(
                                width: 326 * fem,
                                height: AppCommonHelper.isTablet(context)
                                    ? 300
                                    : 300 * fem,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    'assets/page-1/images/login_banner.png',
                                    fit: BoxFit.fill,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            21 * fem, 23 * fem, 10 * fem, 10 * fem),
                        width: double.infinity,
                        height:
                            AppCommonHelper.isTablet(context) ? 700 : 380 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffd0cbff)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(36 * fem),
                            topRight: Radius.circular(37 * fem),
                            bottomRight: Radius.circular(5 * fem),
                            bottomLeft: Radius.circular(5 * fem),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0 * fem, 4 * fem),
                              blurRadius: 2 * fem,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  5 * fem, 5 * fem, 20 * fem, 10 * fem),
                              child: Text(
                                'Welcome to Sporto'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 30 * ffem,
                                  fontWeight: FontWeight.w800,
                                  height: 1.2 * ffem / fem,
                                  color: primary,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  5 * fem, 0 * fem, 50 * fem, 13 * fem),
                              child: Text(
                                "Enter your phone number to get start".tr(),
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(
                                    10 * fem,
                                    0 * fem,
                                    10 * fem,
                                    AppCommonHelper.isTablet(context)
                                        ? 5 * fem
                                        : 15 * fem),
                                width: double.infinity,
                                height: 80 * fem,
                                child: IntlPhoneField(
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Color(0x59000000), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide:
                                          BorderSide(color: Color(0x59000000)),
                                    ),
                                  ),
                                  initialCountryCode: 'IN',
                                  onChanged: (phone) {
                                    phoneNumber = phone;
                                    print(phone.completeNumber);
                                  },
                                )),
                            Container(
                                margin: EdgeInsets.fromLTRB(
                                    5 * fem, 1 * fem, 1 * fem, 0 * fem),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          focusColor: Colors.lightBlue,
                                          activeColor: primary,
                                          value: term,
                                          onChanged: (newValue) {
                                            term = newValue!;
                                            setState(() {});
                                          }),
                                      /*GestureDetector(onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildAboutDialog(context),
                              );
                            },*/
                                      Text(
                                        'I agree with Terms & Conditions and privacy policy'
                                            .tr(),
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: AppCommonHelper.isTablet(
                                                    context)
                                                ? 14
                                                : 10),
                                      ),
                                    ])),
                            GestureDetector(
                                onTap: () async {
                                  InternetConnectionChecker()
                                      .hasConnection
                                      .then((value) => {
                                            internetConnection = value,
                                          });
                                  if (phoneNumber.number.length == 10) {
                                    if (internetConnection == false) {
                                      showCustomSnackBar(
                                          "no internet connection".tr(),
                                          context);
                                    } else if (!term) {
                                      showCustomSnackBar(
                                          "Please accept our Terms & Conditions"
                                              .tr(),
                                          context);
                                    } else {
                                      //CircularProgressIndicator();
                                      /* showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>

                                            _buildAboutDialog(context),
                                      );*/
                                      showDialogBox();
                                    }
                                  } else {
                                    showCustomSnackBar(
                                        "Enter 10 digit mobile no".tr(),
                                        context);
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      5 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  width: 346 * fem,
                                  height: 60 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xff080053),
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Get OTP",
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Lato',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  showDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text("Terms & Conditions"),
              content: Text(
                  "By accepting all terms and conditions for privacy and data security visit our link: https://way2success.team/userpolicy.html",
                  style: TextStyle(
                    fontSize: AppCommonHelper.isTablet(context) ? 30 : 12,
                  )),
              actions: [
                CupertinoButton.filled(
                  child: Text(
                    "Accept",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    showDialogBox2();
                    //checkInternet();
                  },
                )
              ],
            ));
  }

  showDialogBox2() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text("End User Licence Agreement"),
              content: Text(AppConstants.terms,
                  style: TextStyle(
                    fontSize: AppCommonHelper.isTablet(context) ? 30 : 15,
                  )),
              actions: [
                CupertinoButton.filled(
                    child: const Text(
                      "Agree",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      /*getDeviceId();
                      String deviceId = await getDeviceId();
                      print('Device ID: $deviceId');
                      print("device id");*/
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OTPScreen(phoneNumber.number.toString())));

                      //
                    }
                )
              ],
            ));
  }


}
