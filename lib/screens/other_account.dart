import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:s2w/models/profile_model.dart';
import 'package:s2w/presenter/auth_presenter.dart';
import 'package:s2w/presenter/post_presenter.dart';
import 'package:s2w/screens/dashboard/fluid_nav_bar.dart';
import 'package:s2w/screens/edit_profile.dart';
import 'package:s2w/screens/follower_list.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/widget/my_post_widget.dart';

import '../models/other_profile_model.dart';
import '../models/post_list_model.dart';
import '../socket/socket_constants.dart';
import '../socket/socket_manager.dart';
import '../utils.dart';
import '../widget/custom_snackbar.dart';
import '../widget/post_widget.dart';
import 'chat/chat_screen.dart';
import 'following_list.dart';
import 'my_follower_list.dart';
import 'my_following_list.dart';

class OtherAccountContent extends StatefulWidget {
  String id;
  OtherAccountContent(this.id);
  @override
  _OtherAccountContentState createState() => _OtherAccountContentState();
}

class _OtherAccountContentState extends State<OtherAccountContent> {

  AuthPresenter authPresenter= AuthPresenter();
  PostPresenter postPresenter= PostPresenter();
  OtherProfileModel profileModel=OtherProfileModel();
  bool load=false, load2=false;
  PostListModel postListModel=new PostListModel();
  String followData="";
  String accountId="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  void getData(){
    authPresenter.getOtherProfile(widget.id).then((value) {
      profileModel=value;
      followData= profileModel.user!.account!.userFollow!.length>0?"Following": 'Follow Now';
      load=true;
      accountId=profileModel.user!.accountId.toString();
      setState(() {

      });
    });
    postPresenter.getOtherPost(widget.id).then((value) {
      postListModel=value;
      load2=true;
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(body:
      SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Center(
            child: Container(
             decoration: BoxDecoration (
             color: Color(0xfff7f7f7),
             ),
             child:Column(children: [
             load? Container(
                  height: 490,
                  width: double.infinity,
                  child:Stack(
                  children: [
                  //cover Image
                  Positioned(
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 390*fem,
                        height: 280*fem,
                        child:  profileModel.user!.cover==null?   Image.asset (
                          'assets/page-1/images/cover2.png',fit: BoxFit.cover
                        ): Image.network(profileModel.user!.cover.toString(),fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0*fem,
                    top: 213*fem,
                    child: Align(
                      child: SizedBox(
                        width: 390*fem,
                        height: 1486*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(50*fem),
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //user Image
                  Positioned(
                    left: 129*fem,
                    top: 180*fem,
                    child: Align(
                      child: SizedBox(
                        width: 131*fem,
                        height: 131*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(65.5*fem),
                            border: Border.all(color: Color(0xffffffff)),
                            image: profileModel.user!.profile==null?  DecorationImage (
                              fit: BoxFit.cover,
                              image: profileModel.user!.gender=="Male"? AssetImage (
                                'assets/page-1/images/user_profile_male.png',
                              ):AssetImage (
                                'assets/page-1/images/user_profile_female.png',
                              ),
                            ):DecorationImage (
                              fit: BoxFit.cover,
                              image: NetworkImage(profileModel.user!.profile.toString(), ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Full Name
                 load? Positioned(
                    left: 94*fem,
                    top: 267*fem,
                    child: Align(
                      child: SizedBox(
                        width: 203*fem,
                        height: 24*fem,
                        child: Text(profileModel.user!.firstName.toString(),
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Lato',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ):SizedBox(),
                  //username
                  Positioned(
                    // group2JDn (12:2527)
                    left: 133*fem,
                    top: 291*fem,
                    child: Container(
                      width: 224*fem,
                      height: 18*fem,
                      child: Stack(
                        children: [

                          Positioned(
                             left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 124*fem,
                                height: 18*fem,
                                child: Text(
                                  '@'+profileModel.user!.lastName.toString(),
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Lato',
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //post Header
                  Positioned(
                    left: 24*fem,
                    top: 450*fem,
                    child: Container(
                      width: 342*fem,
                      height: 18*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 262*fem, 0*fem),
                            child: Text(
                              'All Post'.tr(),
                              style: SafeGoogleFont (
                                'Lato',
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                         /* Text(
                            'view all',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Lato',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                  //user Post,follower,following
                  Positioned(
                    left: 48.6691894531*fem,
                    top: 324*fem,
                    child: Container(
                      width: 295.65*fem,
                      height: 50*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 65.83*fem, 0*fem),
                            child:
                            Column(children: [
                              Text(
                                'Post',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(profileModel.user!.account!.postCount.toString(),
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2*ffem/fem,
                                  color: Color(0x8c080053),
                                ),
                              ),
                            ],)

                          ),
                         GestureDetector(
                          onTap: (){
                           // Navigator.push(context,MaterialPageRoute(builder: (context) =>FollowerListContent()));
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>MyFollowerListContent(type: "other",userId: profileModel.user!.accountId.toString(),)));

                          },
                         child: Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 63.82*fem, 0*fem),
                            child:
                            Column(children: [
                              Text(
                                'Followers',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(profileModel.follower.toString(),
                                style: SafeGoogleFont (
                                  'Lato',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2*ffem/fem,
                                  color: Color(0x8c080053),
                                ),
                              ),
                            ],)
                          )),
                         GestureDetector(
                             onTap: (){
                               Navigator.push(context,MaterialPageRoute(builder: (context) =>MyFollowingListContent(type: "other",userId: profileModel.user!.accountId.toString(),)));

                             },
                             child:Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.82*fem, 0*fem),
                              child:
                              Column(children: [
                                Text(
                                  'Following',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Lato',
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(profileModel.following.toString(),
                                  style: SafeGoogleFont (
                                    'Lato',
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2*ffem/fem,
                                    color: Color(0x8c080053),
                                  ),
                                ),
                              ],)
                          )),
                        ],
                      ),
                    ),
                  ),

                  //follow header
                  Positioned(
                    left: 21*fem,
                    top: 387*fem,
                    child: Align(
                      child: SizedBox(
                        width: 266*fem,
                        height: 53*fem,
                        child: GestureDetector(
                        onTap: (){
                          if(profileModel.user!.account!.userFollow!.length>0) {

                            authPresenter.unFollow(profileModel.user!.accountId.toString()).then((value) {

                              showCustomSnackBar( "User UnFollowed",context);

                              getData();
                            });
                          }else{
                            authPresenter.follow(profileModel.user!.accountId.toString()).then((
                                value) {
                              showCustomSnackBar("User Followed",context,isError: false);
                              getData();
                            });
                          }

                        },
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(5*fem),
                            border: Border.all(color: Color(0xff080053)),
                            color: Color(0xfff1f1f1),

                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(followData
                             ,
                            style: SafeGoogleFont (
                              'Lato',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2*ffem/fem,
                              color: Color(0xff080053),
                            ),
                          ),)
                        ),
                        )
                      ),
                    ),
                  ),
                 Positioned(
                    left: 313*fem,
                    top: 387*fem,
                    child: Align(
                      child: SizedBox(
                        width: 56*fem,
                        height: 53*fem,
                        child: GestureDetector(onTap: (){
                          emit2(SocketConstants.createPrivateRoom,widget.id.toString() );
                         // Navigator.push(context,MaterialPageRoute(builder: (context) =>ChatScreen(name:profileModel.user!.firstName.toString(),roomId: profileModel.user!.primaryInetrestId.toString(),)));

                        }, child: Container(padding: EdgeInsets.all(10),
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(5*fem),
                            color: Color(0xff080053),
                          ),
                          child: Image.asset(
                            'assets/page-1/images/-6LY.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Positioned(
                    left: 20*fem,
                    top: 60*fem,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Center(
                          child: IconButton(icon: Icon(Icons.arrow_back,color: primary,), onPressed: () {
                           // Navigator.push(context,MaterialPageRoute(builder: (context) =>DashBoardScreen()));
                            Navigator.pop(context);
                          },)
                      ),
                    ),
                  ),
                 /* Positioned(
                    right: 20*fem,
                    top: 10*fem,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Center(
                        child: IconButton(icon: Icon(Icons.edit,color: primary,), onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>EditProfileScreen()));

                        },)
                      ),
                    ),
                  ),*/

                ],
              ) ):CircularProgressIndicator() ,
            load2? ListView.builder(itemCount: postListModel.result!.length,
               physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               itemBuilder: (context, i) {
                 return MyPostWidgetItem(postListModel.result!.elementAt(i),accountId);
               },):Container()
         ],)
    ),
          )));
  }
}
