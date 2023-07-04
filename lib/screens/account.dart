import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:s2w/utils/images.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../models/post_list_model.dart';
import '../socket/socket_constants.dart';
import '../socket/socket_manager.dart';
import '../utilities/app_common_helper.dart';
import '../utilities/app_local_data_util.dart';
import '../utils.dart';
import '../widget/custom_snackbar.dart';
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

  PostListModel postListModel = PostListModel();

  bool isLoaded = false;
  int? myCount;
  bool moreLoadPostCircleProgressbar = false;
  bool loader = false;

  @override
  void initState() {
    super.initState();
    loader = true;
    Future.delayed(const Duration(seconds: 3000), () {
      isLoaded = true;
    });
    getData();
    // }
  }

  void getData() {
    authPresenter.getProfile().then((value) {
      profileModel = value;
      setState(() {
        if (profileModel.user!.firstName != null) {
          loader = false;
        }
        myCount = profileModel.user!.account?.postCount!;
      });
    });

    postPresenter.getMyPost().then((value) {
      postListModel = value;
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: loader
                ? Center(
                    child: Padding(
                    padding: EdgeInsets.only(top: 250),
                    child: CircularProgressIndicator(),
                  ))
                : Center(
                    child: Column(
                      children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                          height: 380,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              //cover Image
                              Positioned(
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 390 * fem,
                                    height: 280 * fem,
                                    child: profileModel.user?.cover == null
                                        ? Image.asset(
                                            'assets/page-1/images/bannerdefaultimage.png',
                                            fit: BoxFit.cover)
                                        : Image.network(
                                            profileModel.user!.cover
                                                .toString(),
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                ),
                              ),

                              /*Positioned(
                                left: 0 * fem,
                                top: 213 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 390 * fem,
                                    height: 1486 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50 * fem),
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),*/

                              //user Image
                              Positioned(
                                left: 129 * fem,
                                top: 180 * fem,
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
                                        image: profileModel.user?.profile ==
                                                null
                                            ? DecorationImage(
                                                fit: BoxFit.cover,
                                                filterQuality:
                                                    FilterQuality.low,
                                                image: profileModel
                                                            .user?.gender ==
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
                                                filterQuality:
                                                    FilterQuality.low,
                                                image: NetworkImage(
                                                  profileModel.user!.profile
                                                      .toString(),
                                                ),


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
                              ),

                              //Full Name
                              Positioned(
                                left: 133 * fem,
                                top: 311 * fem,
                                child: Container(
                                  width: 204 * fem,
                                  height: 38 * fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0 * fem,
                                        top: 0 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 124 * fem,
                                            height: 28 * fem,
                                            child: Text(
                                              profileModel.user!.firstName
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Lato',
                                                fontSize: 25 * ffem,
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
                              ),

                              //user Post,follower,following
                              Positioned(
                                left: 48.6691894531 * fem,
                                top: 344 * fem,
                                child: Container(
                                  width: 300 * fem,
                                  height: 50 * fem,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 65.83 * fem, 0 * fem),
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
                                              Text(
                                                myCount.toString(),
                                                style: SafeGoogleFont(
                                                  'Lato',
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2 * ffem / fem,
                                                  color: Color(0x8c080053),
                                                ),
                                              ),
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
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  63.82 * fem,
                                                  0 * fem),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Followers',
                                                    textAlign:
                                                        TextAlign.center,
                                                    style: SafeGoogleFont(
                                                      'Lato',
                                                      fontSize: 15 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.2 * ffem / fem,
                                                      color:
                                                          Color(0xff000000),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    profileModel.follower
                                                        .toString(),
                                                    style: SafeGoogleFont(
                                                      'Lato',
                                                      fontSize: 15 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.2 * ffem / fem,
                                                      color:
                                                          Color(0x8c080053),
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
                                                  0 * fem,
                                                  0 * fem,
                                                  0 * fem,
                                                  0 * fem),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Following',
                                                    textAlign:
                                                        TextAlign.center,
                                                    style: SafeGoogleFont(
                                                      'Lato',
                                                      fontSize: 15 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.2 * ffem / fem,
                                                      color:
                                                          Color(0xff000000),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    profileModel.following
                                                        .toString(),
                                                    style: SafeGoogleFont(
                                                      'Lato',
                                                      fontSize: 15 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.2 * ffem / fem,
                                                      color:
                                                          Color(0x8c080053),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ),
                              ),

                              //edit icon section......
                              Positioned(
                                right: 20 * fem,
                                top: 40 * fem,
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
                                              builder: (context) =>
                                                  SettingsPage()));
                                    },
                                  )),
                                ),
                              ),

                            ],
                          )
                      ),
                    ),
                    isLoaded
                        ? myCount == 0
                            ? Center(
                                child: Text(
                                  'No post',
                                  style: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2 * ffem / fem,
                                    color: Color(0xff404040),
                                  ),
                                ))
                            : ListView.builder(
                                itemCount: postListModel.result!.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return MyPostWidgetItem(
                                      postListModel.result!.elementAt(i),
                                      profileModel.user!.accountId
                                          .toString());
                                },
                              )
                        : getShimmerLoading()
                      ],
                    ),
                  )));
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 18.0,
                      color: Colors.white,
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!);
  }
}
