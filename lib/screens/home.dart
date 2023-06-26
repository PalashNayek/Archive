import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:s2w/presenter/shared_presenter.dart';
import 'package:s2w/screens/searchPageScreen.dart';
import 'package:s2w/widget/category_item.dart';
import 'package:s2w/widget/post_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../models/banner_model.dart';
import '../models/post_list_model.dart';
import '../models/profile_model.dart';
import '../presenter/auth_presenter.dart';
import '../presenter/post_presenter.dart';
import '../utilities/app_common_helper.dart';
import '../utils.dart';
import '../widget/banner_item.dart';
import 'create_post.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  SharedPresenter sharedPresenter = SharedPresenter();
  List<BannerModel> bannerList = [];
  AuthPresenter authPresenter = AuthPresenter();
  ProfileModel profileModel = ProfileModel();

  PostPresenter postPresenter = PostPresenter();
  PostListModel postListModel = PostListModel();
  List<PostModelData> postListData = [];
  int perPage = 10; //default- perPage = 10;
  int offset = 0; //default- offset = 0;
  int present = 0;
  bool moreLoadPostCircleProgressbar = false;

  bool isLoaded = false;
  bool internetConnection = true;
  int totalPostLength = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3000), () {
      isLoaded = true;
    });

    setState(() {
      getData();
      getPostDat(offset);
    });
  }

  void getPostDat(int off) {
    postPresenter.getAllPost("", perPage, off).then((value) {
      postListModel = value;
      postListData.addAll(value.result as Iterable<PostModelData>);
      totalPostLength = postListData.length.toInt();
      print("postTotal->$totalPostLength");
      setState(() {
        isLoaded = true;
      });
    });
  }

  void getData() {
    sharedPresenter.getBanner().then((value) {
      bannerList = value;
      setState(() {
        //if
      });
    });
    authPresenter.getProfile().then((value) {
      profileModel = value;
      isLoaded = true;
      setState(() {});
    });
  }

  @override
  Widget build(context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.99,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          15 * fem, 40 * fem, 25 * fem, 7 * fem),
                      width: double.infinity,
                      height: 76 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xff080053),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(38 * fem),
                          bottomLeft: Radius.circular(38 * fem),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 155 * fem, 0 * fem),
                            width: 126 * fem,
                            height: 47 * fem,
                            child: Image.asset(
                              'assets/page-1/images/app_logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchPage()));
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size:
                                    AppCommonHelper.isTablet(context) ? 40 : 24,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.fromLTRB(6 * fem, 6 * fem, 4 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              4 * fem, 0 * fem, 9 * fem, 6 * fem),
                          width: double.infinity,
                          height: 283 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 5 * fem,
                                  top: 0 * fem,
                                  child: Container(
                                    width: 367 * fem,
                                    height: 150 * fem,
                                    child: bannerList.isNotEmpty
                                        ? CarouselSlider.builder(
                                            itemCount: bannerList.length,
                                            itemBuilder: (BuildContext context,
                                                int index, int realIdx) {
                                              return BannerItem(bannerList
                                                  .elementAt(index)
                                                  .image!);
                                            },
                                            options: CarouselOptions(
                                              height: AppCommonHelper.isTablet(
                                                      context)
                                                  ? 400
                                                  : 140.0,
                                              enlargeCenterPage: true,
                                              autoPlay: true,
                                              aspectRatio: 16 / 9,
                                              autoPlayCurve:
                                                  Curves.fastOutSlowIn,
                                              enableInfiniteScroll: true,
                                              autoPlayAnimationDuration:
                                                  Duration(milliseconds: 1000),
                                              viewportFraction: 0.8,
                                            ),
                                          )
                                        : Image(
                                            width: 367 * fem,
                                            height: 150 * fem,
                                            image: AssetImage(
                                                "assets/page-1/images/bannerdefaultimage.png"),
                                          ),
                                  )),

                              //category Items

                              Positioned(
                                left: 0 * fem,
                                top: 143 * fem,
                                child: Container(
                                  width: 367 * fem,
                                  height: 140 * fem,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x0f2c3039),
                                        offset: Offset(0 * fem, 24 * fem),
                                        blurRadius: 32 * fem,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0 * fem,
                                        top: 11.5791015625 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 367 * fem,
                                            height: 128.42 * fem,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5 * fem),
                                                border: Border.all(
                                                    color: Color(0xffe7e7e7)),
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 16 * fem,
                                        top: 17 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 124 * fem,
                                            height: 15 * fem,
                                            child: Text(
                                              'Moments cover for you',
                                              style: SafeGoogleFont(
                                                'Lato',
                                                fontSize: 12 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2 * ffem / fem,
                                                color: Color(0xff404040),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 16 * fem,
                                        top: 44 * fem,
                                        child: Container(
                                          width: 342 * fem,
                                          height: 90 * fem,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                CreatePostScreen()));
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        16 * fem,
                                                        0 * fem),
                                                    width: 75 * fem,
                                                    height: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  6 * fem),
                                                          width:
                                                              double.infinity,
                                                          height: 60 * fem,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 3 * fem,
                                                                top: 3 * fem,
                                                                child: Align(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 54 *
                                                                        fem,
                                                                    height: 54 *
                                                                        fem,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(27 *
                                                                                fem),
                                                                        color: Color(
                                                                            0xff080053),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 9 * fem,
                                                                top: 9 * fem,
                                                                child: Align(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 42 *
                                                                        fem,
                                                                    height: 42 *
                                                                        fem,
                                                                    child:
                                                                        TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => CreatePostScreen()));
                                                                      },
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/page-1/images/add.png',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            'ADD POST'.tr(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                SafeGoogleFont(
                                                              'Lato',
                                                              fontSize:
                                                                  14 * ffem,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1 *
                                                                  ffem /
                                                                  fem,
                                                              color: Color(
                                                                  0xff000000),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              isLoaded
                                                  ? CategoryItem(
                                                      profileModel.user!
                                                          .primaryInetrest!.id
                                                          .toString(),
                                                      profileModel.user!
                                                          .primaryInetrest!.name
                                                          .toString(),
                                                      profileModel
                                                          .user!
                                                          .primaryInetrest!
                                                          .image
                                                          .toString())
                                                  : Container(),
                                              isLoaded
                                                  ? CategoryItem(
                                                      profileModel.user!
                                                          .secondaryInetrest!.id
                                                          .toString(),
                                                      profileModel
                                                          .user!
                                                          .secondaryInetrest!
                                                          .name
                                                          .toString(),
                                                      profileModel
                                                          .user!
                                                          .secondaryInetrest!
                                                          .image
                                                          .toString())
                                                  : Container(),
                                              isLoaded
                                                  ? CategoryItem(
                                                      profileModel.user!
                                                          .thirdInetrest!.id
                                                          .toString(),
                                                      profileModel.user!
                                                          .thirdInetrest!.name
                                                          .toString(),
                                                      profileModel.user!
                                                          .thirdInetrest!.image
                                                          .toString(),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  isLoaded
                      ? ListView.builder(
                          itemCount: postListData.length + 1,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return (i == postListData.length)
                                ? Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: /*moreLoadPostCircleProgressbar? postListData.length < totalPostLength ?*/
                                        VisibilityDetector(
                                      key: Key('your_button_key'),
                                      // Provide a unique key to the widget
                                      onVisibilityChanged: (visibilityInfo) {
                                        if (visibilityInfo.visibleFraction ==
                                            1.0) {
                                          moreLoadPostCircleProgressbar = true;
                                          offset = offset + perPage;
                                          getPostDat(offset);
                                        } else {
                                          moreLoadPostCircleProgressbar = false;
                                        }
                                      },
                                      child: moreLoadPostCircleProgressbar
                                          ? postListData.length >
                                                  totalPostLength
                                              ? Text("")
                                              : Center(
                                                  child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 25),
                                                  child: Text(
                                                    'No post available',
                                                    style: SafeGoogleFont(
                                                      'Lato',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 1.2 * ffem / fem,
                                                      color: Color(0xff404040),
                                                    ),
                                                  ),
                                                ))
                                          : const SizedBox(
                                              height: 64.0,
                                              width: 24.0,
                                              child: Center(
                                                  child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 25),
                                                child:
                                                    CircularProgressIndicator(),
                                              )),
                                            ),
                                    ),
                                  )
                                : i == 2
                                    ? SizedBox(
                                        height: 300,
                                        width: 200,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(6 * fem, 0 * fem, 7 * fem, 7 * fem),
                                          width: double.infinity,
                                          height: 450 * fem,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7 * fem),
                                            border: Border.all(color: Color(0x99d6d6d6)),
                                            color: Color(0xffffffff),
                                          ),
                                          child: Column(
                                            children: [
                                              //header
                                              Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    //user
                                                    /*if (isLoading) CircularProgressIndicator(),*/

                                                    Expanded(
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(left: 10, top: 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  RichText(
                                                                    text: TextSpan(
                                                                      style: SafeGoogleFont(
                                                                        'Netflix Sans',
                                                                        fontSize: 16 * ffem,
                                                                        fontWeight: FontWeight.w500,
                                                                        height: 1.171875 * ffem / fem,
                                                                        color: Color(0xff000000),
                                                                      ),
                                                                      children: [
                                                                        TextSpan(
                                                                          text: "Shorts",
                                                                          style: SafeGoogleFont(
                                                                            'Lato',
                                                                            fontSize: 20 * ffem,
                                                                            fontWeight: FontWeight.w700,
                                                                            height: 1.2 * ffem / fem,
                                                                            color: Color(0xff000000),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            //option/more icon
                                                          ],
                                                        ))
                                                    //username
                                                  ],
                                                ),
                                              ),
                                              //header End
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Colors.grey,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(left: 10),
                                                  child: Align(
                                                    alignment: Alignment.topLeft,
                                                  )),


                                              Container(
                                                color: Colors.blue,
                                                width: 345,
                                                height: 245,
                                                child: Center(
                                                  child: Text("Required API",style: SafeGoogleFont(
                                                    'Lato',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.2 * ffem / fem,
                                                    color: Color(0xffffffff),
                                                  ),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      )
                                    : PostWidgetItem(postListData.elementAt(i),
                                        profileModel);
                          },
                        )
                      : getShimmerLoading()
                ],
              ),
            ),
          )),
    );
  }

  Future<void> _pullRefresh() async {
    getData();
    getPostDat(0);
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
