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
  bool load = false;
  int? resultLenth;
  var coverImg;
  var userProfile;
  var userGender;
  var postCount;
  var itemCountLen;
  var postListResult;

  @override
  void initState() {
    authPresenter = AuthPresenter();
    postPresenter = PostPresenter();
    profileModel = ProfileModel();
    super.initState();
    if (mounted) {
      setState(() {
        getData();
      });
    }
  }

  void getData() {
    try{
      load = true;
      postCount = profileModel.user!.account!.postCount;
      authPresenter.getProfile().then((value) {
        profileModel = value;
        userProfile = profileModel.user!.profile;
        userGender = profileModel.user!.gender;

        postListResult = postListModel.result!;
        itemCountLen = postListModel.result!.length;


        if(itemCountLen){
          itemCountLen = postListModel.result!.length;
        }else{
          itemCountLen = 0;
          //len = 0; //return value if str is null
        }

        /*setState(() {
        String userResponse = profileModel.user! as String;
      });*/
      });
      postPresenter.getMyPost().then((value) {
        postListModel = value;

        resultLenth = value.result?.length;
        coverImg = profileModel.user!.cover;
        if (value.result?.length == "") {
          setState(() {});
        } else {
          setState(() {});
        }
      });
    }catch (error) {
      load = false;
    }

  }

  @override
  void dispose() {
    coverImg.cancel();
    userProfile.cancel();
    userGender.cancel();
    postCount.cancel();
    itemCountLen.cancel();
    postListResult.cancel();
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
            child: Center(
              child: Container(
                  child: Column(
                children: [
                  Container(
                      height: 360,
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
                                child: profileModel.user!.cover == null
                                    ? Image.asset(
                                    'assets/page-1/images/bannerdefaultimage.png',
                                    fit: BoxFit.cover)
                                    : Image.network(
                                  profileModel.user!.cover.toString(),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,
                                  loadingBuilder: (BuildContext context, Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          Positioned(
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
                          ),

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
                                    border:
                                        Border.all(color: Color(0xffffffff)),
                                    image: profileModel.user!.profile == null
                                        ? DecorationImage(
                                      fit: BoxFit.cover,

                                      filterQuality: FilterQuality.low,
                                      image: profileModel.user!.gender ==
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
                                      /*loadingBuilder: (BuildContext context, Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },*/
                                      filterQuality: FilterQuality.low,
                                      image: NetworkImage(
                                        userProfile
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
                          /*Positioned(
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
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),*/

                          //username
                          /*Positioned(
                            // group2JDn (12:2527)
                            left: 133 * fem,
                            top: 291 * fem,
                            child: Container(
                              width: 224 * fem,
                              height: 18 * fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0 * fem,
                                    top: 0 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 124 * fem,
                                        height: 18 * fem,
                                        child: Text(
                                          '@' +
                                              profileModel.user!.lastName
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Lato',
                                            fontSize: 15 * ffem,
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
                          ),*/

                          //user Post,follower,following
                          Positioned(
                            left: 48.6691894531 * fem,
                            top: 324 * fem,
                            child: Container(
                              width: 295.65 * fem,
                              height: 50 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                     Text(userGender.toString(),
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
                                        // Navigator.push(context,MaterialPageRoute(builder: (context) =>FollowerListContent()));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyFollowerListContent(
                                                      type: "other",
                                                      userId: profileModel
                                                          .user!.accountId
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
                                                profileModel.follower
                                                    .toString(),
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
                                                      type: "other",
                                                      userId: profileModel
                                                          .user!.accountId
                                                          .toString(),
                                                    )));
                                      },
                                      child: Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 1.82 * fem, 0 * fem),
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
                                                profileModel.following
                                                    .toString(),
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
                      )),
                  ListView.builder(
                          itemCount: postListModel.result!.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return MyPostWidgetItem(
                                postListModel.result!.elementAt(i),
                                profileModel.user!.accountId.toString());
                          },
                        )
                ],
              )),
            )));
  }
}
