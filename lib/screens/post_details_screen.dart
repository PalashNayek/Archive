import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:s2w/screens/comment_screen.dart';
import 'package:s2w/utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../models/post_list_model.dart';
import '../page-1/search-page--dL4.dart';
import '../player/video_player.dart';
import '../presenter/post_presenter.dart';
import '../theme/color.dart';
import '../utilities/app_common_helper.dart';
import 'package:http/http.dart' as http;

class PostDetailsScreen extends StatefulWidget {
  PostDetailsScreen(
    this.postModelData,
  );

  PostModelData postModelData;

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetailsScreen> {
  int activePage = 0;
  List<File> files = [];
  PostPresenter postPresenter = PostPresenter();
  PageController _pageController =
      PageController(viewportFraction: 1, initialPage: 0);
  bool circleLoader = false;

  String getFileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return "";
    }
  }

  Future<File> _generateThumbnail(String url) async {
    final String? _path = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,

      /// path_provider
      imageFormat: ImageFormat.PNG,
      maxHeight: 50,
      quality: 50,
    );
    return File(_path!);
  }

  @override
  void initState() {
    super.initState();
    circleLoader = true;
    if (widget.postModelData.account!.personalDetail!.isNotEmpty) {
      circleLoader = false;
    }
    if (widget.postModelData.postImage!.length > 0) {
      if (getFileExtension(
              widget.postModelData.postImage!.elementAt(0).image.toString()) ==
          "mp4") {
        _generateThumbnail(
                widget.postModelData.postImage!.elementAt(0).image.toString())
            .then((value) {
          files.add(value);
          setState(() {});
        });
      }
    }
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? primary : secondary,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          title: Text(
            "Post Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: double.infinity,
          child: circleLoader
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: CircularProgressIndicator(),
                ))
              : Container(
                  padding:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                11 * fem, 0 * fem, 12 * fem, 79 * fem),
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxHeight: double.infinity,
                              minHeight: 0,
                            ),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7 * fem),
                              border: Border.all(color: Color(0x99d6d6d6)),
                              color: Color(0xffffffff),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //user

                                    Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: widget.postModelData.account!
                                                      .personalDetail!
                                                      .elementAt(0)
                                                      .profile ==
                                                  null
                                              ? Image.asset(
                                                  "assets/page-1/images/user_profile_male.png",
                                                  width: 50 * fem,
                                                  height: 50 * fem,
                                                  fit: BoxFit.cover)
                                              : Image.network(
                                                  widget.postModelData.account!
                                                      .personalDetail!
                                                      .elementAt(0)
                                                      .profile
                                                      .toString(),
                                                  width: 50 * fem,
                                                  height: 50 * fem,
                                                  fit: BoxFit.cover),
                                        )),

                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  style: SafeGoogleFont(
                                                    'Netflix Sans',
                                                    fontSize: 16 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height:
                                                        1.171875 * ffem / fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: widget
                                                          .postModelData
                                                          .account!
                                                          .personalDetail!
                                                          .elementAt(0)
                                                          .firstName,
                                                      style: SafeGoogleFont(
                                                        'Lato',
                                                        fontSize: 16 * ffem,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height:
                                                            1.2 * ffem / fem,
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                AppCommonHelper.timeAgoCustom(
                                                    widget
                                                        .postModelData.createdAt
                                                        .toString()),
                                                style: SafeGoogleFont(
                                                  'Lato',
                                                  fontSize: 9 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.2 * ffem / fem,
                                                  color: Color(0xff9496a1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //option/more icon
                                        /*GestureDetector(child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.more_vert)
                              ),onTapDown: (details){
                                showPopupMenu(context,details);
                              },)*/
                                      ],
                                    ))

                                    //username
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ), ///////////////////////////////////////////////

                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          widget.postModelData.name.toString(),
                                          textAlign: TextAlign.left,
                                          style: SafeGoogleFont(
                                            'Lato',
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ))),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        widget.postModelData.desc.toString(),
                                        style: SafeGoogleFont(
                                          'Lato',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 2 * ffem / fem,
                                          color: Color(0xff080053),
                                        ),
                                      ),
                                    )),

                                SizedBox(
                                  height: 5,
                                ),
                                //header End

                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        6 * fem, 0 * fem, 7 * fem, 7 * fem),
                                    width: double.infinity,
                                    height: 300 * fem,
                                    child: widget.postModelData.postImage!
                                                .length >
                                            0
                                        ? widget.postModelData.postImage!
                                                    .length ==
                                                1
                                            ? Center(
                                                child: Stack(children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: getFileExtension(widget
                                                              .postModelData
                                                              .postImage!
                                                              .elementAt(0)
                                                              .image
                                                              .toString()) ==
                                                          "mp4"
                                                      ? files.length > 0
                                                          ? Image.file(
                                                              files
                                                                  .elementAt(0),
                                                              width: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : Center(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 17,
                                                                        left:
                                                                            17),
                                                                child:
                                                                    Container(
                                                                  height: 42,
                                                                  width: 42,
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                ),
                                                              ),
                                                            )
                                                      : Image.network(
                                                          filterQuality:
                                                              FilterQuality.low,
                                                          widget.postModelData
                                                              .postImage!
                                                              .elementAt(0)
                                                              .image
                                                              .toString(),
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.fill,
                                                        ),
                                                ),
                                                getFileExtension(widget
                                                            .postModelData
                                                            .postImage!
                                                            .elementAt(0)
                                                            .image
                                                            .toString()) ==
                                                        "mp4"
                                                    ? Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            VideoApp(
                                                                              url: widget.postModelData.postImage!.elementAt(0).image.toString(),
                                                                            )));
                                                          },
                                                          icon: Icon(
                                                              Icons.play_circle,
                                                              size: 50,
                                                              color: third),
                                                        ))
                                                    : SizedBox(
                                                        width: 1,
                                                      )
                                              ]))
                                            : Stack(
                                                children: [
                                                  PageView.builder(
                                                      itemCount: widget
                                                          .postModelData
                                                          .postImage!
                                                          .length,
                                                      pageSnapping: true,
                                                      controller:
                                                          _pageController,
                                                      onPageChanged: (page) {
                                                        setState(() {
                                                          activePage = page;
                                                        });
                                                      },
                                                      itemBuilder: (context,
                                                          pagePosition) {
                                                        return Image.network(
                                                          widget.postModelData
                                                              .postImage!
                                                              .elementAt(
                                                                  pagePosition)
                                                              .image
                                                              .toString(),
                                                          fit: BoxFit.cover,
                                                        );
                                                      }),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: indicators(
                                                              widget
                                                                  .postModelData
                                                                  .postImage!
                                                                  .length,
                                                              activePage)))
                                                ],
                                              )
                                        : Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              widget.postModelData.desc
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    AppCommonHelper.isTablet(
                                                            context)
                                                        ? 40
                                                        : 24,
                                              ),
                                            )),

                                    /* ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child:

                widget.postModelData.postImage!.length>0? widget.postModelData.postImage!.length==1?
                   // Center(child:Stack(children: [
                      Image.network(widget.postModelData.postImage!.elementAt(0).image.toString(),
                        fit: BoxFit.cover,)
                      */ /* Align(
                        alignment: Alignment.center,
                        child:  IconButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>VideoApp()));
                      }, icon:   Icon(Icons.play_circle,
                          size: 50,
                          color: third
                      ),))*/ /*

                 //   ],))
                :
                Stack(children: [
                  PageView.builder(
                      itemCount: widget.postModelData.postImage!.length,
                      pageSnapping: true,
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          activePage = page;
                        });
                      },
                      itemBuilder: (context,pagePosition){
                        return  Image.network(widget.postModelData.postImage!.elementAt(pagePosition).image.toString(),fit: BoxFit.cover,);
                      }),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators(widget.postModelData.postImage!.length,activePage)))
                ],) :
                Align(alignment: Alignment.center, child:Text(widget.postModelData.desc.toString(),style: TextStyle(color: Colors.black),)),

            ),*/
                                  ),
                                ),

                                SizedBox(
                                  height: 3,
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 24.00 * fem,
                                  margin: EdgeInsets.only(
                                      left: 20, top: 10, right: 20, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            postPresenter
                                                .addLike(
                                                    widget.postModelData.id
                                                        .toString(),
                                                    widget
                                                                .postModelData
                                                                .postLike!
                                                                .length >
                                                            0
                                                        ? false
                                                        : true)
                                                .then((value) {
                                              if (widget.postModelData.postLike!
                                                      .length >
                                                  0) {
                                                // Fluttertoast.showToast(msg: "UnLike Successfully");
                                                int? i = widget
                                                    .postModelData.likeCount;
                                                widget.postModelData.likeCount =
                                                    (i! - 1);
                                                widget.postModelData.postLike =
                                                    [];
                                              } else {
                                                // Fluttertoast.showToast(msg: "Liked Successfully");
                                                int? i = widget
                                                    .postModelData.likeCount;
                                                widget.postModelData.likeCount =
                                                    (i! + 1);
                                                PostLike postLike = PostLike();
                                                postLike.id = "uheuithgiurth";
                                                widget.postModelData.postLike!
                                                    .add(postLike);
                                              }
                                              setState(() {});
                                            });
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Icon(Icons.thumb_up,
                                                    size: 24,
                                                    color: widget
                                                                .postModelData
                                                                .postLike!
                                                                .length >
                                                            0
                                                        ? secondary
                                                        : primary),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  widget.postModelData.likeCount
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CommentScreen(widget
                                                          .postModelData)));
                                        },
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.comment,
                                                size: 24,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                widget
                                                    .postModelData.commentCount
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTapDown: (down) {
                                            if (widget.postModelData.postImage!
                                                    .length >
                                                0) {
                                              shareNetworkImage(widget
                                                  .postModelData.postImage!
                                                  .elementAt(0)
                                                  .image
                                                  .toString());
                                            } else {
                                              shareText(widget
                                                  .postModelData.desc
                                                  .toString());
                                            }
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.ios_share_outlined,
                                                  size:
                                                      AppCommonHelper.isTablet(
                                                              context)
                                                          ? 40
                                                          : 24,
                                                ),
                                                // SizedBox(width: 5,),
                                                // Text(widget.postModelData.shareCount.toString(),style: TextStyle(color: Colors.grey),)
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ), //////////////////////
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }

  Future<void> shareNetworkImage(String imageUrl) async {
    try {
      var response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final file = await File('${tempDir.path}/image.png').create();
        await file.writeAsBytes(response.bodyBytes);
        Share.shareXFiles([XFile(file.path)], text: "Welcome to Sporto App");
        /* await FlutterShare.shareFile(
          title: 'Share Image',
          text: "Welcome to Sporto App",
          filePath: file.path,
        );*/
      } else {
        throw 'Failed to download image';
      }
    } catch (e) {
      throw 'Failed to share image: $e';
    }
  }

  Future<void> shareText(String text) async {
    try {
      Share.share(text, subject: 'Welcome to Sporto App');
    } catch (e) {
      throw 'Failed to share image: $e';
    }
  }

  showPopupMenu(BuildContext context, TapDownDetails details) {
    showMenu<String>(
      context: context,

      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ), //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(child: const Text('Report Post'), value: '1'),
        PopupMenuItem<String>(child: const Text('Block Post'), value: '2'),
        PopupMenuItem<String>(child: const Text('Report User'), value: '3'),
        PopupMenuItem<String>(child: const Text('Block User'), value: '4'),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        //code here
      } else if (itemSelected == "2") {
        //code here
      } else {
        //code here
      }
    });
  }
}
