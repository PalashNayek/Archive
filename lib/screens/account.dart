import 'package:flutter/material.dart';
import 'package:s2w/models/profile_model.dart';
import 'package:s2w/presenter/auth_presenter.dart';
import 'package:s2w/presenter/post_presenter.dart';
import 'package:s2w/screens/edit_profile.dart';
import 'package:s2w/screens/follower_list.dart';
import 'package:s2w/screens/login_screen.dart';
import 'package:s2w/screens/my_follower_list.dart';
import 'package:s2w/screens/my_following_list.dart';
import 'package:s2w/theme/color.dart';
import 'package:shimmer/shimmer.dart';

import '../models/post_list_model.dart';
import '../utilities/app_common_helper.dart';
import '../utilities/app_local_data_util.dart';
import '../utils.dart';
import '../widget/my_post_widget.dart';
import '../widget/post_widget.dart';
import 'following_list.dart';
import 'setting_screen.dart';

class AccountContent extends StatefulWidget {
  @override
  _AccountContentState createState() => _AccountContentState();
}

class _AccountContentState extends State<AccountContent> {
  AuthPresenter authPresenter = AuthPresenter();
  PostPresenter postPresenter = PostPresenter();
  ProfileModel profileModel = ProfileModel();
  //bool load = false, load2 = false;
  PostListModel postListModel = PostListModel();
  bool load = false;
  int? resultLenth;

  @override
  void initState() {
    super.initState();
    setState(() {
    });
    getData();
  }

  void getData() {
    authPresenter.getProfile().then((value) {
      profileModel = value;
    });
    postPresenter.getMyPost().then((value) {
      postListModel = value;
      load = true;
      resultLenth = value.result?.length;
      if(value.result?.length==""){
        setState(() {});
      }else {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
            decoration: BoxDecoration(
              color: Color(0xfff7f7f7),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                    height: AppCommonHelper.isTablet(context) ? 1000 : 375,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        //cover Image
                        /*load
                            ?*/ Positioned(
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 390 * fem,
                                    height: AppCommonHelper.isTablet(context)
                                        ? 600
                                        : 363 * fem,
                                    child: profileModel.user!.cover == null
                                        ? Image.asset(
                                            'assets/page-1/images/bannerdefaultimage.png',
                                            fit: BoxFit.fill,
                                          )
                                        : Image.network(profileModel.user!.cover
                                            .toString()),
                                  ),
                                ),
                              )
                            /*: Container()*/,
                        Positioned(
                          left: 0 * fem,
                          top: 213 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 390 * fem,
                              height: AppCommonHelper.isTablet(context)
                                  ? 1486 * fem
                                  : 160,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50 * fem),
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //user Image
                        /*load
                            ?*/ Positioned(
                                left: 129 * fem,
                                top: 125 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 131 * fem,
                                    height: 131 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(65.5 * fem),
                                        border: Border.all(
                                            color: Color(0xffffffff)),
                                        image: profileModel.user!.profile ==
                                                null
                                            ? DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    profileModel.user!.gender ==
                                                            "Male"
                                                        ? AssetImage(
                                                            'assets/page-1/images/user_profile_male.png',
                                                          )
                                                        : AssetImage(
                                                            'assets/page-1/images/user_profile_female.png',
                                                          ),
                                              )
                                            : DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(profileModel
                                                    .user!.profile
                                                    .toString()),
                                              ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x3f000000),
                                            offset: Offset(0 * fem, 4 * fem),
                                            blurRadius: 2 * fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            /*: Container()*/,

                        //Full Name
                        /*load
                            ?*/ Positioned(
                                left: 94 * fem,
                                top: 267 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 203 * fem,
                                    height: 24 * fem,
                                    child: Text(
                                      profileModel.user!.firstName.toString(),
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Lato',
                                        fontSize: 25 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            /*: SizedBox()*/,
                        //username
                        /*load
                            ?*/ Positioned(
                                left: 133 * fem,
                                top: 291 * fem,
                                child: Container(
                                  width: 124 * fem,
                                  height: 18 * fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0 * fem,
                                        top: 0 * fem,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                            width: 124 * fem,
                                            height: 18 * fem,
                                            child: Text(
                                              profileModel.user!.emailId
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Lato',
                                                fontSize: 10 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.2 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            /*: Container()*/,

                        /* //post Header
                Positioned(
                  left: 24*fem,
                  top: 400*fem,
                  child: Container(
                    width: 342*fem,
                    height: 18*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 262*fem, 0*fem),
                          child: Text(
                            'Post',
                            style: SafeGoogleFont (
                              'Lato',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Text(
                          'view all',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Lato',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
                        //user Post,follower,following
                        Positioned(
                          left: 48.6691894531 * fem,
                          top: 324 * fem,
                          child: Container(
                            width: 300 * fem,
                            height: 50 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 65.83 * fem, 0 * fem),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Post',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Lato',
                                            fontSize: 15 * ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        /*load
                                            ?*/ Text(
                                                profileModel
                                                    .user!.account!.postCount
                                                    .toString(),
                                                style: SafeGoogleFont(
                                                  'Lato',
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2 * ffem / fem,
                                                  color: Color(0x8c080053),
                                                ),
                                              )
                                            /*: Container()*/,
                                      ],
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyFollowerListContent(
                                                    type: "my",
                                                    userId: profileModel
                                                        .user!.id
                                                        .toString(),
                                                  )));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 63.82 * fem, 0 * fem),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Followers',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Lato',
                                                fontSize: 15 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              profileModel.follower.toString(),
                                              style: SafeGoogleFont(
                                                'Lato',
                                                fontSize: 15 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2 * ffem / fem,
                                                color: Color(0x8c080053),
                                              ),
                                            ),
                                          ],
                                        ))),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyFollowingListContent(
                                                    type: "my",
                                                    userId: profileModel
                                                        .user!.id
                                                        .toString(),
                                                  )));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Following',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Lato',
                                                fontSize: 15 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              profileModel.following.toString(),
                                              style: SafeGoogleFont(
                                                'Lato',
                                                fontSize: 15 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2 * ffem / fem,
                                                color: Color(0x8c080053),
                                              ),
                                            ),
                                          ],
                                        ))),
                              ],
                            ),
                          ),
                        ),

                        //top Header
                        /* Positioned(
                  left: 56*fem,
                  top: 11*fem,
                  child: Align(
                    child: SizedBox(
                      width: 63*fem,
                      height: 24*fem,
                      child: Text(
                        'Profile ',
                        style: SafeGoogleFont (
                          'Lato',
                          fontSize: 20*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),*/

                        Positioned(
                          right: 15 * fem,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Center(
                                child: IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: primary,
                              ),
                              onPressed: () {
                                // Navigator.push(context,MaterialPageRoute(builder: (context) =>EditProfileScreen()));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingsPage()));
                              },
                            )),
                          ),
                        ),
                        /*  Positioned(
                  left: 20*fem,
                  top: 10*fem,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Center(
                        child: IconButton(icon: Icon(Icons.logout,color: primary,), onPressed: () {
                          showAlert();
                        },)
                    ),
                  ),
                ),*/
                      ],
                    )),
                  load? resultLenth! > 0 ? ListView.builder(
                        itemCount: postListModel.result!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return MyPostWidgetItem(
                              postListModel.result!.elementAt(i),
                              profileModel.user!.accountId.toString());
                        },
                      ):Center(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              5 * fem, 100 * fem, 0 * fem, 11 * fem),
                          child: Text('No post available',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2 * ffem / fem,
                              color: Color(0xff000000),
                            ),),
                        ),
                      ):CircularProgressIndicator()
              ],
            )));
  }
}
