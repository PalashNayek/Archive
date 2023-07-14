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
import '../player/video_player.dart';
import '../presenter/auth_presenter.dart';
import '../presenter/post_presenter.dart';
import '../theme/color.dart';
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
  List<PostModelData> shortsListData = [];
  int perPage = 10; //default- perPage = 10;
  int offset = 0; //default- offset = 0;
  int allOffset = 2; //default- offset = 0;
  int present = 0;
  bool moreLoadPostCircleProgressbar = false;

  bool isLoaded = false;
  bool internetConnection = true;
  late int latestTwoPostLength;
  late int shortsVideoPostLength;
  late int totalAllPostLength;
  late int totalShortsPostLength;
  String type = "All";
  String shortVideoType = "Shorts";
  int adjustedIndex = 0;

  var profileModelUser;
  late String primaryInterestId;

  @override
  void initState() {
    latestTwoPostLength = 0;
    shortsVideoPostLength = 0;
    totalAllPostLength = 0;
    totalShortsPostLength = 0;
    postListData.clear();
    shortsListData.clear();

    getData();
    getLatestPostData(offset);
    getShortsVideo(offset);
    getPostDat(allOffset);

    super.initState();
    Future.delayed(const Duration(seconds: 3000), () {
      isLoaded = true;
      getData();
      getLatestPostData(offset);
      getShortsVideo(offset);
      getPostDat(allOffset);
    });

    setState(() {

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
      profileModelUser = profileModel.user!;
      primaryInterestId = profileModelUser.primaryInetrest!.id.toString();
      if (primaryInterestId.isEmpty) {
        isLoaded = true;
      }
      setState(() {});
    });
  }

  void getLatestPostData(int off) {
    isLoaded = true;
    postPresenter.getLatestPost("", 2, off, type).then((value) {
      postListModel = value;
      postListData.addAll(value.result as Iterable<PostModelData>);
      latestTwoPostLength = postListData.length.toInt();
      setState(() {});
    });
  }

  void getShortsVideo(int off) {
    postPresenter.getAllPost("", perPage, off, shortVideoType).then((value) {
      postListModel = value;
      shortsListData.addAll(value.result as Iterable<PostModelData>);
      totalShortsPostLength = shortsListData.length.toInt();
      print("shortsVideoLen->$totalShortsPostLength");
      setState(() {
        isLoaded = true;
      });
    });
  }

  void getPostDat(int off) {
    postPresenter.getAllPost("", perPage, off, type).then((value) {
      postListModel = value;
      postListData.addAll(value.result as Iterable<PostModelData>);
      totalAllPostLength = postListData.length.toInt();
      print("postTotal->$totalAllPostLength");
      setState(() {
        isLoaded = true;
      });
    });
  }

  String getFileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return "";
    }
  }

  @override
  void dispose() {
    postListData.clear();
    shortsListData.clear();
    super.dispose();
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
                              ///////////////////////////////////////////////////////////////////////

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
                                        top: 34 * fem,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                                                        primaryInterestId,
                                                        profileModelUser
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
                                                        profileModelUser
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
                                                        profileModelUser
                                                            .thirdInetrest!.id
                                                            .toString(),
                                                        profileModelUser
                                                            .thirdInetrest!.name
                                                            .toString(),
                                                        profileModelUser
                                                            .thirdInetrest!.image
                                                            .toString(),
                                                      )
                                                    : const Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 30, bottom: 30),
                                                        child: SizedBox(
                                                            height: 30,
                                                            width: 30,
                                                            child:
                                                                CircularProgressIndicator()),
                                                      ),
                                              ],
                                            ),
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
                          itemCount: latestTwoPostLength,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return PostWidgetItem(
                                postListData.elementAt(i), profileModel);
                          },
                        )
                      : getShimmerLoading(),
                  Container(
                      //height: 355,
                      height:
                          AppCommonHelper.isTablet(context) ? 200 * fem : 355,
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            7 * fem, 0 * fem, 7 * fem, 7 * fem),
                        width: double.infinity,
                        height: 460 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7 * fem),
                          border: Border.all(color: Color(0x99d6d6d6)),
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                          children: [
                            //header
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: SafeGoogleFont(
                                                      'Netflix Sans',
                                                      fontSize: 16 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.171875 *
                                                          ffem /
                                                          fem,
                                                      color:
                                                          Color(0xff000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: "Shorts",
                                                        style: SafeGoogleFont(
                                                          'Lato',
                                                          fontSize: 20 * ffem,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 1.2 *
                                                              ffem /
                                                              fem,
                                                          color: Color(
                                                              0xff000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),

                                            ////////////////////////////

                                            Container(
                                              height: 300,
                                              width: 338,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    shortsListData.length,
                                                itemBuilder: (context, i) {
                                                  //print()
                                                  return Container(
                                                    width: 160,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  12 * fem),
                                                      border: Border.all(
                                                          color: Color(
                                                              0x99d6d6d6)),
                                                      color:
                                                          Color(0xffffffff),
                                                    ),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    child: Center(
                                                        child: /*getFileExtension(widget.postModelData.postImage!
                                                          .elementAt(0)
                                                          .image
                                                          .toString()) ==
                                                          "mp4"
                                                          ? Align(
                                                          alignment: Alignment.center,
                                                          child: IconButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => VideoApp(
                                                                        url: widget.postModelData
                                                                            .postImage!
                                                                            .elementAt(0)
                                                                            .image
                                                                            .toString(),
                                                                      )));
                                                            },
                                                            icon: Center(
                                                              child: Icon(Icons.play_circle,
                                                                  size: 50, color: third),
                                                            ),
                                                          ))*/

                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => VideoApp(
                                                                                  url:
                                                                                  'https://socialstorage.b-cdn.net/posts/1687965597567.mp4'
                                                                                  //postListData.postImage!.elementAt(0).image.toString()
                                                                                  //postListData.elementAt(i).postImage!.elementAt(shortsListData.length).image.toString()
                                                                                  ,
                                                                                )
                                                                            //Center(child: Text('Item ${shortsListData}')),
                                                                        )
                                                                    );
                                                                  },
                                                                  icon:
                                                                      const Center(
                                                                    child: Icon(
                                                                        Icons
                                                                            .play_circle,
                                                                        size:
                                                                            50,
                                                                        color:
                                                                            third),
                                                                  ),
                                                                ))),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),

                                    //option/more icon
                                  ],
                                ))
                                //username
                              ],
                            ),
                            //header End
                          ],
                        ),
                      )),
                  isLoaded
                      ? ListView.builder(
                          itemCount: totalAllPostLength - 1,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            final adjustedIndex = i + 2;
                            return (adjustedIndex == postListData.length)
                                ? Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: VisibilityDetector(
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
                                                  totalAllPostLength
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
                                                )
                                      )
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
                                : PostWidgetItem(
                                    postListData.elementAt(adjustedIndex),
                                    profileModel);
                          },
                        )
                      : getShimmerLoading(),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> _pullRefresh() async {
    Future.delayed(const Duration(seconds: 3000), () {
      isLoaded = true;
      getPostDat(offset);
    });

    /*setState(() {
      //getData();
      getPostDat(offset);
    });*/
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
