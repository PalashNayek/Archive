import 'package:flutter/material.dart';
import 'package:s2w/models/notification_model.dart';
import 'package:s2w/widget/notification_widget.dart';

import '../presenter/auth_presenter.dart';
import '../presenter/post_presenter.dart';
import '../utils.dart';


class NotificationContent extends StatefulWidget {
  @override
  _NotificationContentState createState() => _NotificationContentState();
}

class _NotificationContentState extends State<NotificationContent> {
  AuthPresenter authPresenter= AuthPresenter();
  PostPresenter postPresenter= PostPresenter();
  TextEditingController messageTextController= new TextEditingController();
  bool load=false;
  List<NotificationModel> notificationModel=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotification();
  }
  void getNotification(){
    postPresenter.getNotification().then((value) {
      if(value.length>0) {
        notificationModel = value;
        load = true;
        setState(() {

        });
      }else{
        notificationModel = [];
        load = true;
        setState(() {

        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return
      Container(
      width: double.infinity,
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: 873*fem,
        decoration: BoxDecoration (
          color: Color(0xfff7f7f7),
        ),
        child: Column(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // original67acc72cef7e760145952f (62:997)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 155*fem, 0*fem),
                      width: 126*fem,
                      height: 47*fem,
                      child: Image.asset(
                        'assets/page-1/images/app_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                   /* Icon(Icons.search,color: Colors.white,size: 24,)
*/
                  ],
                ),
              ),
            ),
          load? notificationModel.length>0? ListView.builder(itemCount: notificationModel.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return NotificationWidgetItem(notificationModel.elementAt(i));
              },):
             Center(child: Container(
                margin: EdgeInsets.fromLTRB(5*fem, 100*fem, 0*fem, 11*fem),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    'assets/page-1/images/nonotification.png',
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'No Notification found At this moment',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Lato',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.2*ffem/fem,
                      color: Colors.grey,
                    ),
                  ),
                ],),

              )):Center(child:Container(
              margin: EdgeInsets.fromLTRB(5*fem, 100*fem, 0*fem, 11*fem),
               child: CircularProgressIndicator()),)
          ],
        ),
      ),
    );
  }
}
