import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:s2w/models/auth_model.dart';
import 'package:s2w/utils.dart';
import 'package:s2w/widget/custom_snackbar.dart';

import '../page-1/succss.dart';
import '../presenter/auth_presenter.dart';
import '../utilities/app_common_helper.dart';
import '../widget/otp_input.dart';
import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';

class OTPScreen extends StatefulWidget{
  String mobileNo;
  OTPScreen(this.mobileNo);
  @override
  _OTPScreenState createState() => _OTPScreenState();

}

  class _OTPScreenState extends State<OTPScreen> {
    final TextEditingController _fieldOne = TextEditingController();
    final TextEditingController _fieldTwo = TextEditingController();
    final TextEditingController _fieldThree = TextEditingController();
    final TextEditingController _fieldFour = TextEditingController();
    AuthPresenter _authPresenter = AuthPresenter();
    AuthInfo authInfo= AuthInfo();
    FocusNode focusNodeOTP= FocusNode();
    String message="";
    Timer? countdownTimer;
    Duration myDuration = Duration(seconds: 30);
    bool click=true;
    bool load=false;

    @override
    void initState() {
      super.initState();

      getData();
    }
    void startTimer() {
      click=true;
      countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    }
    // Step 4
    void stopTimer() {
      setState(() => countdownTimer!.cancel());
    }
    // Step 5
    void resetTimer() {
      stopTimer();
      setState(() => myDuration = Duration(seconds: 30));
    }
    // Step 6
    void setCountDown() {
      final reduceSecondsBy = 1;
      setState(() {
        final seconds = myDuration.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          click=false;
          countdownTimer!.cancel();
        } else {
          myDuration = Duration(seconds: seconds);
        }
      });
    }
    void getData(){
      startTimer();
      _authPresenter.sendOtp(widget.mobileNo, context).then((value) {
        authInfo=value;
        bool load=true;
        setState(() {

          message=authInfo.message!;
          //print("MyOTPPalash"+message);
        });
      });
    }

    @override
    Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(resizeToAvoidBottomInset:true,
        body: SingleChildScrollView(child: Center(
          child: /*load?*/ Container(
            padding: EdgeInsets.only(top: 7),
             width: double.infinity,
             child: Container(
           width: double.infinity,
           decoration: BoxDecoration (
           color: Color(0xffffffff),
            ),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0*fem, 17*fem, 0*fem, 35*fem),
                width: double.infinity,
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Container(
                   padding:EdgeInsets.all(10),
                   margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 1*fem, 30*fem),
                   decoration: BoxDecoration (
                     color: Color(0xff080053),
                     borderRadius: BorderRadius.only (
                       bottomRight: Radius.circular(38*fem),
                       bottomLeft: Radius.circular(38*fem),
                     ),
                   ),
                   width:AppCommonHelper.isTablet(context)?width: 169*fem,
                   height: 40*fem,
                  child: Image.asset(
                  'assets/page-1/images/app_logo.png',
                    fit: AppCommonHelper.isTablet(context)?BoxFit.contain:BoxFit.cover,
                  ),
                  ),
                 Container(
                  width: 326*fem,
                   height:AppCommonHelper.isTablet(context)?300: 300*fem,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                  'assets/page-1/images/otp_banner.png',
                  fit: BoxFit.fill,
                  )),
                  ),
                 ],
                ),
                ),
            ),
            Container(
              width: width,
              height: AppCommonHelper.isTablet(context)?700:380*fem,
              decoration: BoxDecoration (
              border: Border.all(color: Color(0xffd0cbff)),
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only (
              topLeft: Radius.circular(36*fem),
              topRight: Radius.circular(37*fem),
              bottomRight: Radius.circular(5*fem),
              bottomLeft: Radius.circular(5*fem),
              ),
              boxShadow: [
              BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0*fem, 4*fem),
              blurRadius: 2*fem,
              ),
              ],
              ),
              child: Stack(
               children: [
               Positioned(
                  left:30*fem,
                  top: AppCommonHelper.isTablet(context)?230:109*fem,
                  child: Container(
                   width: AppCommonHelper.isTablet(context)?width:500*fem,
                   height: 60*fem,
                   decoration: BoxDecoration (
                   borderRadius: BorderRadius.circular(5*fem),
                   ),
                  child: Container(
                   width: double.infinity,
                   height: double.infinity,
                   decoration: BoxDecoration (
                   borderRadius: BorderRadius.circular(5*fem),
                   ),
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OtpInput(_fieldOne, true),
                    SizedBox(width: AppCommonHelper.isTablet(context)?30: 20,),// auto focus
                    OtpInput(_fieldTwo, false),
                    SizedBox(width: AppCommonHelper.isTablet(context)?30:20,),
                    OtpInput(_fieldThree, false),
                    SizedBox(width: AppCommonHelper.isTablet(context)?30:20,),
                    OtpInput(_fieldFour, false)
                       ],
                      ),
                     ),
                    ),
                  ),
               Positioned(

                left: 30*fem,
                top:AppCommonHelper.isTablet(context)?150: 66*fem,
                child: Align(
                  child: SizedBox(
                    width: 314*fem,
                    height: 18*fem,
                    child: Text(message,
                    style: SafeGoogleFont (
                    'Lato',
                    fontSize: 15*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2*ffem/fem,
                    color: Color(0xff1c1b1b),
                    ),
                    ),
                    ),
                  ),
                ),
               Positioned(

                  left: 41*fem,
                  top:AppCommonHelper.isTablet(context)?400: 185*fem,
                  child: Container(
                   width: 203*fem,
                   height: 18*fem,
                   child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                    width: 18*fem,
                    height: 18*fem,
                     child: Image.asset(
                    'assets/page-1/images/clock-1-1e8.png',
                     fit: BoxFit.cover,
                    ),
                    ),
                   GestureDetector(
                     onTap: (){
                       if(!click){
                         showCustomSnackBar("OTP Resent Successfully".tr(),context,isError: false);

                         getData();
                       }
                     },
                     child: RichText(

                    text: TextSpan(
                    style: SafeGoogleFont (
                    'Lato',
                    fontSize: 15*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2*ffem/fem,
                    color: Color(0xff1c1b1b),
                    ),
                    children: [
                        TextSpan(
                        text: myDuration.inSeconds.toString()+'  Resend OTP ',
                        ),
                        TextSpan(
                        text: 'click Here ',
                        style: SafeGoogleFont (
                        'Lato',
                        fontSize: 15*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2*ffem/fem,
                        color: Color(0xff1c1b1b),
                        ),
                        ),
                        ],
                        ),
                        ),)
                        ],
                   ),
                  ),
                ),
                Positioned(
                  left: 22*fem,
                  top:AppCommonHelper.isTablet(context)?500: 219*fem,
                  child: TextButton(
                  onPressed: () {
                    if(_fieldOne.text.isEmpty){
                     showCustomSnackBar("OTP Required".tr(),context);

                    }else if(_fieldTwo.text.isEmpty){
                      showCustomSnackBar("OTP Required".tr(),context);

                    }else if(_fieldThree.text.isEmpty){
                      showCustomSnackBar("OTP Required".tr(),context);

                    }else if(_fieldFour.text.isEmpty){
                      showCustomSnackBar("OTP Required".tr(),context);

                    }else {
                      String otp=_fieldOne.text+_fieldTwo.text+_fieldThree.text+_fieldFour.text;
                      _authPresenter.verifyOtp(widget.mobileNo, otp, context).then((value) {
                        if(value) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SuccessScreen()));
                        }
                      });
                       }
                     },
                    style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                    ),
                   child: Container(
                      width: 346*fem,
                      height: 64*fem,
                      decoration: BoxDecoration (
                      color: Color(0xff080053),
                      borderRadius: BorderRadius.circular(5*fem),
                      ),
                       child: Center(
                       child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                          'Lato',
                          fontSize: 20*ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.2*ffem/fem,
                          color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      ),
                  ),
                  ),
                Positioned(
                    left: 21.5*fem,
                    top: 20*fem,
                    child: Align(
                    child: SizedBox(
                    width: 253*fem,
                    height: 36*fem,
                    child: Text(
                    'OTP has been sent '.tr(),
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                    'Lato',
                    fontSize: 30*ffem,
                    fontWeight: FontWeight.w800,
                    height: 1.2*ffem/fem,
                    color: Color(0xff080053),
                    ),
                    ),
                    ),
                    ),
                    ),
               ],
               ),
               ),
              ],
              )
             ),
           )/*: Center(child:Container(
            //alignment: Alignment(),
              child: CircularProgressIndicator(),
            ),),*/
        )
        ));
    }

}