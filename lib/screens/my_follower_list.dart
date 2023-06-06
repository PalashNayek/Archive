import 'package:flutter/material.dart';
import 'package:s2w/models/follower_list_model.dart';
import 'package:s2w/widget/follower_list_widget.dart';
import 'package:s2w/widget/notification_widget.dart';

import '../presenter/post_presenter.dart';
import '../utils.dart';
import '../widget/user_widget.dart';

class MyFollowerListContent extends StatefulWidget {
  MyFollowerListContent({required this.type,required this.userId});
  String type;
  String userId;
  @override
  _MyFollowerListContentState createState() => _MyFollowerListContentState();
}

class _MyFollowerListContentState extends State<MyFollowerListContent> {

  PostPresenter postPresenter= PostPresenter();
  bool load=false;
  List<FollowerListModel> followerList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  void getData(){

    if(widget.type=="my") {
      postPresenter.getMyFollower().then((value) {
        followerList = value;
        load = true;
        setState(() {

        });
      });
    }else{
      postPresenter.getUserFollower(widget.userId).then((value) {
        followerList = value;
        load = true;
        setState(() {

        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return
    Scaffold(body:  Container(
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
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 155*fem, 0*fem),
                      width: 126*fem,
                      height: 47*fem,
                      child: Image.asset(
                        'assets/page-1/images/app_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Icon(Icons.search,color: Colors.white,size: 24,)

                  ],
                ),
              ),
            ),
           load? ListView.builder(itemCount: followerList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return FollowerListWidgetItem(followerList.elementAt(i));
              },):CircularProgressIndicator()
          ],
        ),
      ),)
    );
  }
}
