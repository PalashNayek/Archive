import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:s2w/presenter/chat_presenter.dart';
import 'package:s2w/widget/notification_widget.dart';

import '../models/following_list_model.dart';
import '../models/group_member_list.dart';
import '../presenter/post_presenter.dart';
import '../theme/color.dart';
import '../utils.dart';
import '../widget/user_widget.dart';
import 'dashboard/fluid_nav_bar.dart';

class UserListContent extends StatefulWidget {
  String groupId;
  UserListContent(this.groupId);
  @override
  _UserListContentState createState() => _UserListContentState();
}

class _UserListContentState extends State<UserListContent> {
  PostPresenter postPresenter= PostPresenter();
  ChatPresenter chatPresenter= ChatPresenter();
  bool load=false;
  List<FollowingListModel> followingList=[];
  List<GroupMemberList> groupMemberList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  var tmpArray = [];
  List multipleSelected = [];
  List checkListItems = [

  ];
  void getData(){
    chatPresenter.getAllGroupMember(widget.groupId,20,0).then((value) {
      groupMemberList = value;
      postPresenter.getMyFollowing().then((value) {
        followingList = value;
        load = true;
        followingList.forEach((value) {
         /* groupMemberList.forEach((element) {

          });*/

          checkListItems.add({
            "userId": value.following!.id.toString(),
            "value": false,
            "title": value.following!.personalDetail!.elementAt(0).firstName.toString(),
          });
        });
        setState(() {

        });
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
                      // original67acc72cef7e760145952f (62:997)
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
            load?  ListView.builder(itemCount: followingList.length,
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
                                child:followingList.elementAt(i).following!.personalDetail!.elementAt(0).profile==null?Image.asset('assets/page-1/images/user.png',
                                    width: 57*fem,
                                    height: 56*fem,
                                    fit: BoxFit.cover
                                ): Image.network(followingList.elementAt(i).following!.personalDetail!.elementAt(0).profile.toString(),
                                    width: 57*fem,
                                    height: 56*fem,
                                    fit: BoxFit.cover
                                ),
                              )),


                          Expanded(child:CheckboxListTile(
                            title: Text(checkListItems.elementAt(i)["title"]),
                            value: checkListItems.elementAt(i)["value"],
                            activeColor: Colors.pink,
                            checkColor: Colors.white,
                            onChanged: (bool? value) {
                               setState(() {
                                 checkListItems[i]["value"] = value;
                                 if (multipleSelected.contains(checkListItems[i])) {
                                   multipleSelected.remove(checkListItems[i]);
                                 } else {
                                   multipleSelected.add(checkListItems[i]);
                                 }
                             });
                            },
                          ))
                          //username

                        ],
                      ),
                    ],
                  ),

                );
              },):CircularProgressIndicator()
          ],
        ),
      ),
    ),  bottomNavigationBar: Padding(
       padding: const EdgeInsets.all(20.0),
       child: ElevatedButton(
         style: ElevatedButton.styleFrom(
           primary: primary,
           padding: const EdgeInsets.only(top: 8, bottom: 8),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10.0),
             side: BorderSide(
               color:primary,
             ),
           ),
         ),
         onPressed: () async {

           if(multipleSelected.length>0) {

             chatPresenter.addGroupMember(widget.groupId, multipleSelected).then((value) {
               SnackBar snack = SnackBar(
                 content: Text(
                   'Member Added successfully',
                   style: TextStyle(color: Colors.white),
                 ).tr(),
                 duration: const Duration(seconds: 2),
                 backgroundColor: Colors.black,
               );
               ScaffoldMessenger.of(context).showSnackBar(snack);
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => DashBoardScreen()));

             });
                 }
         },
         child: Text(
           'Save'.tr(),
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.white,
           ),
         ),
       ),
     ),);
  }
}
