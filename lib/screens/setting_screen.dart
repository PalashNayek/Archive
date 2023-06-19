import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:s2w/screens/block_list.dart';
import 'package:s2w/screens/html_page.dart';
import 'package:s2w/screens/language_choose_screen.dart';
import 'package:s2w/utils/app_constants.dart';
//import 'package:share_plus/share_plus.dart';

import '../theme/color.dart';
import '../utilities/app_local_data_util.dart';
import '../widget/custom_snackbar.dart';
import '../widget/item_card.dart';
import 'edit_profile.dart';
import 'login_screen.dart';
import 'package:quickalert/quickalert.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingstContentState createState() => _SettingstContentState();
}

class _SettingstContentState extends State<SettingsPage> {


  Widget _arrow() {
    return Icon(
      Icons.arrow_forward_ios,
      size: 20.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          'Settings'.tr(),
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        color:Color(0xFFF7F7F7),// (brightness == Brightness.light) ? Color(0xFFF7F7F7) : Color(0xFF000000),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                color:Color(0xFFF7F7F7),// (brightness == Brightness.light) ? Color(0xFFF7F7F7) : Color(0xFF000000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'profile_setting'.tr(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF999999)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ItemCard(
                      textColor: Colors.black,
                      title: 'edit_profile'.tr(),
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Icon(Icons.edit,color: primary,),
                      callback: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>EditProfileScreen()));
                      },
                    ),

                    ItemCard(
                      textColor: Colors.black,
                      title: 'language_setting'.tr(),
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Icon(Icons.language,color: primary,),
                      callback: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>LanguageChooseScreen(isContainer: false)));
                      },
                    ),

                    ItemCard(
                      textColor: Colors.black,
                      title: "block_list".tr(),
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Icon(Icons.block,color: primary,),
                      callback: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>BlockUserListContent()));
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'About_app'.tr(),
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF999999)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ItemCard(
                      title: 'privacy_policy'.tr(),
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: _arrow(),
                      callback: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>HTMLPage(2, "Privacy Policy")));
                      },
                      textColor: Colors.black,
                    ),
                    ItemCard(
                      title: 'terms_conditions'.tr(),
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: _arrow(),
                      callback: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>HTMLPage(1, "Terms & Conditions")));

                      },
                      textColor: Colors.black,
                    ),
                    ItemCard(
                      title: 'About_us'.tr(),
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: _arrow(),
                      callback: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>HTMLPage(3, "About Us")));

                      },
                      textColor: Colors.black,
                    ),
                   /* ItemCard(
                      title: 'Settings Item 05',
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Container(),
                      callback: () {
                        print('Tap Settings Item 05');
                      },
                      textColor: Colors.black,
                    ),
                    ItemCard(
                      title: 'Settings Item 06',
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Container(),
                      callback: () {
                        print('Tap Settings Item 06');
                      },
                      textColor: Colors.black,
                    ),
                    ItemCard(
                      title: 'Settings Item 07',
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Container(),
                      callback: () {
                        print('Tap Settings Item 07');
                      },
                      textColor: Colors.black,
                    ),*/
                    SizedBox(
                      height: 40,
                    ),
                    ItemCard(
                      title: 'share_our_app'.tr(),
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Icon(Icons.share,color: primary,),
                      callback: () {
                       // Share.share('check out my website https://example.com', subject: 'Look what I made!');
                        print('Tap Settings Item 08');
                      },
                      textColor: Colors.black,
                    ),
                    ItemCard(
                      title: 'rate_our_app'.tr(),
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Icon(Icons.rate_review_sharp,color: primary,),
                      callback: () {
                        print('Tap Settings Item 08');
                      },
                      textColor: Colors.black,
                    ),
                    ItemCard(
                      title: 'app_version'.tr(),
                      textColor: Colors.black,
                      color: (brightness == Brightness.light) ? Colors.white  : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Center(
                        child: Text('1.0.0',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            )
                        ),
                      ),
                      callback: () {},
                    ),
                    ItemCard(
                      title: 'delete_account'.tr(),
                      color: (brightness == Brightness.light) ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                      rightWidget: Icon(Icons.delete,color: red,),
                      callback: () {
                        deleteAlert();
                      },
                      textColor: Colors.black,
                    ),
                    ItemCard(
                      title: 'logout'.tr(),
                      color: (brightness == Brightness.light) ? Colors.white  : Theme.of(context).scaffoldBackgroundColor,
                      callback: () {
                        showAlert();
                      },
                      rightWidget:Icon(Icons.logout,color: primary,),
                      textColor: Colors.red,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  showAlert(){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: 'Are you sure want to logout?',
      confirmBtnText: 'Yes',
      onConfirmBtnTap: () async {
        Navigator.of(context).pop();
        await AppLocalDataUtil().removeToken().then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      },
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
    );
  }
  /*showAlert(){
    showDialog(context: context, builder: (_) =>
        AlertDialog(
          title:  Text("Logout Alert!".tr()),
          content: Text("Are you sure want to logout?".tr()),
          actions: <Widget>[
            TextButton(
              child:  Text("Yes".tr()),
              onPressed: () async {
                Navigator.of(context).pop();
                await AppLocalDataUtil().removeToken().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
            ),
            TextButton(
              child:  Text("No".tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }*/
  deleteAlert(){
    showDialog(context: context, builder: (_) =>
        AlertDialog(
          title: const Text("Account Delete Alert!"),
          content: Text("Are you sure want to delete your account?"),

          actions: <Widget>[
            TextButton(
              child: const Text("Yes"),
              onPressed: () async {

                Navigator.of(context).pop();
                showCustomSnackBar("Your Account will reviewed and deleted within 7 Working days",context );
                await AppLocalDataUtil().removeToken().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}