import 'package:flutter/material.dart';
import 'package:s2w/presenter/chat_presenter.dart';
import 'package:s2w/widget/notification_widget.dart';

import '../models/following_list_model.dart';
import '../models/group_member_list.dart';
import '../presenter/post_presenter.dart';
import '../utils.dart';
import '../widget/user_widget.dart';

class GroupMemberListContent extends StatefulWidget {
  String roomId;
  GroupMemberListContent(this.roomId);
  @override
  _GroupMemberListContentState createState() => _GroupMemberListContentState();
}

class _GroupMemberListContentState extends State<GroupMemberListContent> {
  ChatPresenter postPresenter= ChatPresenter();
  bool load=false;
  List<GroupMemberList> groupMemberList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  var tmpArray = [];
  void getData(){

      postPresenter.getAllGroupMember(widget.roomId,20,0).then((value) {
        groupMemberList = value;
        load = true;
        /*followingList.forEach((value) {
          //if (value == true) {
            tmpArray.add(value.following!.id.toString());
         // }
        });*/
        setState(() {

        });
      });

  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return
     Scaffold(body: Container(
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
                    /*Icon(Icons.search,color: Colors.white,size: 24,)
*/
                  ],
                ),
              ),
            ),
            load?  ListView.builder(itemCount: groupMemberList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return   Container(
                  margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 7*fem, 7*fem),
                  width: double.infinity,
                  height: 70*fem,
                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.circular(7*fem),
                    border: Border.all(color: Color(0x99d6d6d6)),
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    children: [
                      //header
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          //user
                          Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child:groupMemberList.elementAt(i).account!.personalDetail!.elementAt(0).profile==null?Image.asset('assets/page-1/images/user.png',
                                    width: 57*fem,
                                    height: 56*fem,
                                    fit: BoxFit.cover
                                ): Image.network(groupMemberList.elementAt(i).account!.personalDetail!.elementAt(0).profile.toString(),
                                    width: 57*fem,
                                    height: 56*fem,
                                    fit: BoxFit.cover
                                ),
                              )),
                         /* Expanded(child:CheckboxListTile(
                            title: Text(groupMemberList.elementAt(i).account!.personalDetail!.elementAt(0).firstName.toString()),
                            value: false,
                            activeColor: Colors.pink,
                            checkColor: Colors.white,
                            onChanged: (bool? value) {
                               setState(() {

                             });
                            },
                          ))
                        */  //username

                        ],
                      ),
                    ],
                  ),

                );
              },):CircularProgressIndicator()
          ],
        ),
      ),
    ));
  }
}
