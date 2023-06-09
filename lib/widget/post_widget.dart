import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:s2w/models/profile_model.dart';
import 'package:s2w/page-1/search-page-.dart';
import 'package:s2w/screens/other_account.dart';
import 'package:s2w/screens/post_details_screen.dart';
import 'package:s2w/theme/color.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

//import 'package:share_plus/share_plus.dart';
import '../models/post_list_model.dart';
import '../page-1/search-page--dL4.dart';
import '../player/video_player.dart';
import '../presenter/post_presenter.dart';
import '../screens/comment_screen.dart';
import '../screens/dashboard/fluid_nav_bar.dart';
import '../screens/home.dart';
import '../utilities/app_common_helper.dart';
import '../utils.dart';
import 'package:http/http.dart' as http;

import 'custom_snackbar.dart';

class PostWidgetItem extends StatefulWidget {

  PostWidgetItem(this.postModelData, this.profileModel);

  PostModelData postModelData;
  ProfileModel profileModel;



  @override
  _PostWidgetItemState createState() => _PostWidgetItemState();
}

class _PostWidgetItemState extends State<PostWidgetItem> {
  int activePage = 0;
  PageController _pageController =
      PageController(viewportFraction: 1, initialPage: 0);
  PostPresenter postPresenter = PostPresenter();
  bool isLoading = false;
  double progress = 0.0;
  bool isExpanded = false;
  //int maxLines= 2;
  late VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();
    /*_controller = VideoPlayerController.network(widget.postModelData
        .postImage!
        .elementAt(0)
        .image
        .toString().file.path)
      ..initialize().then((_) {
        setState(() {});  //when your thumbnail will show.
      });*/
  }

  String getFileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return "";
    }
  }

  List<File> files = [];

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;


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

    return ////////////////////////////////////////////////////////////////////////////
        Container(
      margin: EdgeInsets.fromLTRB(6 * fem, 0 * fem, 7 * fem, 7 * fem),
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
      child: Center(
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
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtherAccountContent(widget
                                    .postModelData.account!.id
                                    .toString())));
                      },
                      child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: widget.postModelData.account!.personalDetail!
                                        .elementAt(0)
                                        .profile ==
                                    null
                                ? Image.asset(
                                    "assets/page-1/images/user_profile_male.png",
                                    width: 50 * fem,
                                    height: 50 * fem,
                                    fit: BoxFit.cover)
                                : Image.network(
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        isLoading = false;
                                        return child;
                                      } else {
                                        isLoading = true;
                                        return CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        );
                                      }
                                    },
                                    widget.postModelData.account!.personalDetail!
                                        .elementAt(0)
                                        .profile
                                        .toString(),
                                    width: 50 * fem,
                                    height: 50 * fem,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          "assets/page-1/images/user_profile_male.png",
                                          width: 50 * fem,
                                          height: 50 * fem,
                                          fit: BoxFit.cover);
                                    },
                                    fit: BoxFit.cover,
                                  ),
                          ))),
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
                                    text: widget
                                        .postModelData.account!.personalDetail!
                                        .elementAt(0)
                                        .firstName,
                                    style: SafeGoogleFont(
                                      'Lato',
                                      fontSize: 16 * ffem,
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
                            Text(
                              AppCommonHelper.timeAgoCustom(
                                  widget.postModelData.createdAt.toString()),
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
                      widget.postModelData.account!.id !=
                              widget.profileModel.user!.accountId.toString()
                          ? GestureDetector(
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.more_vert,
                                    size: AppCommonHelper.isTablet(context)
                                        ? 40
                                        : 24,
                                  )),
                              onTapDown: (details) {
                                showPopupMenu(context, details);
                              },
                            )
                          : SizedBox(
                              width: 1,
                            )
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
            SizedBox(
              height: 3,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.postModelData.name.toString(),
                          textAlign: TextAlign.left,
                          style: SafeGoogleFont(
                            'Lato',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),

                        /*if (!isExpanded)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = true;
                              });
                            },
                            child: Text(
                              '...more',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),*/
                        /*AnimatedCrossFade(
                          firstChild: Expanded(
                            child: Text(
                              widget.postModelData.name.toString(),
                              maxLines: maxLines,
                              overflow: TextOverflow.ellipsis,
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          secondChild: Text(
                            "",
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          crossFadeState: isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 300),
                        ),
                        if (!isExpanded*//* && _isTextOverflowed()*//*)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = true;
                              });
                            },
                            child: Text(
                              'Read More',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),*/
                        /*AnimatedCrossFade(
                          firstChild: Text(
                            widget.postModelData.name.toString(),
                            maxLines: maxLines,
                            overflow: TextOverflow.ellipsis,
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          secondChild: Text(
                            widget.postModelData.name.toString(),
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          crossFadeState: isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 300),
                        ),
                        if (!isExpanded)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = true;
                              });
                            },
                            child: Text(
                              'more',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),*/

                      ],
                    ),

                )),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PostDetailsScreen(widget.postModelData)));
              },
              child: Center(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 10 * fem, 0 * fem, 0 * fem),
                    width: double.infinity,
                    height: 330 * fem,
                    child: widget.postModelData.postImage!.length > 0
                        ? widget.postModelData.postImage!.length == 1
                            ? Center(
                                child: Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: getFileExtension(widget
                                              .postModelData.postImage!
                                              .elementAt(0)
                                              .image
                                              .toString()) ==
                                          "mp4"
                                      ? files.length > 0
                                          ? Image.file(
                                              files.elementAt(0),
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            )
                                          : Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 17, left: 17),
                                                child: Container(
                                                  height: 42,
                                                  width: 42,
                                                  child: CircularProgressIndicator(),
                                                ),
                                              ),
                                            )
                                      : Image.network(
                                          widget.postModelData.postImage!
                                              .elementAt(0)
                                              .image
                                              .toString(),
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Image.asset(
                                                "assets/page-1/images/image_load_error.png",
                                                width: 50 * fem,
                                                height: 50 * fem,
                                                fit: BoxFit.cover);
                                          },
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent? loadingProgress) {
                                            if (loadingProgress == null) {
                                              isLoading = false;
                                              return child;
                                            } else {
                                              isLoading = true;
                                              progress = loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : 0.0;
                                              return Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  child,
                                                  /*CircularProgressIndicator(
                                                value: progress,
                                              ),*/
                                                  SizedBox(
                                                    child: Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                      value: progress,
                                                    )),
                                                    height: 100.0,
                                                    width: 100.0,
                                                  ),
                                                  Text(
                                                    '${(progress * 100).toStringAsFixed(1)}%',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              );

                                              /*CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                : null,
                                          );*/
                                            }
                                          }),
                                ),
                                /*if (isLoading) CircularProgressIndicator(),*/
                                getFileExtension(widget.postModelData.postImage!
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
                                                        )
                                                ));
                                          },
                                          icon: Center(
                                            child: Icon(Icons.play_circle,
                                                size: 50, color: third),
                                          ),
                                        ))
                                    : SizedBox(
                                        width: 1,
                                      )
                              ]))
                            : Stack(
                                children: [
                                  PageView.builder(
                                      itemCount:
                                          widget.postModelData.postImage!.length,
                                      pageSnapping: true,
                                      controller: _pageController,
                                      onPageChanged: (page) {
                                        setState(() {
                                          activePage = page;
                                        });
                                      },
                                      itemBuilder: (context, pagePosition) {
                                        return Image.network(
                                          widget.postModelData.postImage!
                                              .elementAt(pagePosition)
                                              .image
                                              .toString(),
                                          filterQuality: FilterQuality.low,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Center(
                                              child: Image.asset(
                                                  "assets/page-1/images/image_load_error",
                                                  width: 50 * fem,
                                                  height: 50 * fem,
                                                  fit: BoxFit.cover),
                                            );
                                          },
                                          fit: BoxFit.cover,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent? loadingProgress) {
                                            if (loadingProgress == null) return child;
                                            return Center(
                                              child: CircularProgressIndicator(
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
                                        );
                                      }),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: indicators(
                                              widget.postModelData.postImage!.length,
                                              activePage)))
                                ],
                              )
                        : Container(
                            color: Colors.white,
                            child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.postModelData.desc.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                      AppCommonHelper.isTablet(
                                          context)
                                          ? 40
                                          : 24,
                                    ),
                                  ),
                                )),
                          ),

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
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 28.00 * fem,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          postPresenter
                              .addLike(
                                  widget.postModelData.id.toString(),
                                  widget.postModelData.postLike!.length > 0
                                      ? false
                                      : true)
                              .then((value) {
                            if (widget.postModelData.postLike!.length > 0) {
                              showCustomSnackBar("UnLike Successfully", context,
                                  isError: false);
                              int? i = widget.postModelData.likeCount;
                              widget.postModelData.likeCount = (i! - 1);
                              widget.postModelData.postLike = [];
                            } else {
                              showCustomSnackBar("Liked Successfully", context,
                                  isError: false);
                              int? i = widget.postModelData.likeCount;
                              widget.postModelData.likeCount = (i! + 1);
                              PostLike postLike = PostLike();
                              postLike.id = "uheuithgiurth";
                              widget.postModelData.postLike!.add(postLike);
                            }
                            setState(() {});
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.thumb_up,
                                  size: AppCommonHelper.isTablet(context) ? 40 : 24,
                                  color: widget.postModelData.postLike!.length > 0
                                      ? secondary
                                      : primary),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.postModelData.likeCount.toString(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: AppCommonHelper.isTablet(context)
                                        ? 30
                                        : 16),
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
                                    CommentScreen(widget.postModelData)));
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.comment,
                              size: AppCommonHelper.isTablet(context) ? 40 : 24,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.postModelData.commentCount.toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      AppCommonHelper.isTablet(context) ? 30 : 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    /*Container(child: Row(children: [
                        Icon(Icons.remove_red_eye_sharp,
                          size: 24,
                        ),
                        SizedBox(width: 5,),
                        Text("12K",style: TextStyle(color: Colors.grey),)
                      ],),),*/
                    GestureDetector(
                        onTapDown: (down) {
                          if (widget.postModelData.postImage!.length > 0) {
                            shareNetworkImage(widget.postModelData.postImage!
                                .elementAt(0)
                                .image
                                .toString());
                          } else {
                            shareText(widget.postModelData.desc.toString());
                          }
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.ios_share_outlined,
                                size: AppCommonHelper.isTablet(context) ? 40 : 24,
                              ),
                              // SizedBox(width: 5,),
                              // Text(widget.postModelData.shareCount.toString(),style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ); ////////////////////////////////////////////////////////////////////
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

  //Post report..................................
  Future<void> _displayTextInputDialogReport(BuildContext context) async {
    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets +
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
            duration: Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: MediaQuery.removeViewInsets(
              removeLeft: true,
              removeTop: true,
              removeRight: true,
              removeBottom: true,
              context: context,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 280.0),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    elevation: 30.0,
                    color: Theme.of(context).dialogBackgroundColor,
                    type: MaterialType.card,
                    child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Report Post",
                              textAlign: TextAlign.left,
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                height: 2,
                                color: Color(0xff000000),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextField(
                                autocorrect: true,
                                maxLines: 4,
                                minLines: 4,
                                keyboardType: TextInputType.multiline,
                                controller: _textFieldController,
                                style: SafeGoogleFont(
                                  'Lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  color: const Color(0xff000000),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter reason',
                                  hintStyle: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    color: const Color(0xff000000),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xfff3f3f3),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color(0x59000000), width: 1),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide:
                                        BorderSide(color: Color(0x59000000)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_textFieldController.text.isNotEmpty) {
                                    postPresenter
                                        .addReport(
                                            widget.postModelData.id.toString(),
                                            _textFieldController.text
                                                .toString())
                                        .then((value) {
                                      showCustomSnackBar(
                                          "Post Report Successfully", context,
                                          isError: false);
                                      Navigator.pop(context);
                                    });
                                  } else {
                                    showCustomSnackBar(
                                        "Please Enter Reason", context,
                                        isError: true);
                                  }
                                },
                                child: const Text(
                                  "Submit",
                                ))
                          ],
                        )),
                  ),
                ),
              ),
            ),
          );
        });
  }

  //Post block....................................
  Future<void> _displayTextInputDialogBlock(BuildContext context) async {
    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets +
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
            duration: Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: MediaQuery.removeViewInsets(
              removeLeft: true,
              removeTop: true,
              removeRight: true,
              removeBottom: true,
              context: context,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 280.0),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    elevation: 30.0,
                    color: Theme.of(context).dialogBackgroundColor,
                    type: MaterialType.card,
                    child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Block Post",
                              textAlign: TextAlign.left,
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                height: 2,
                                color: Color(0xff000000),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextField(
                                /*onChanged: (value) {},
                                keyboardType: TextInputType.text,
                                controller: _textFieldController,
                                decoration: InputDecoration(hintText: "Enter reason"),*/
                                autocorrect: true,
                                maxLines: 4,
                                minLines: 4,
                                keyboardType: TextInputType.multiline,
                                controller: _textFieldController,
                                style: SafeGoogleFont(
                                  'Lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  color: const Color(0xff000000),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter reason',
                                  hintStyle: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    color: const Color(0xff000000),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xfff3f3f3),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color(0x59000000), width: 1),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide:
                                        BorderSide(color: Color(0x59000000)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_textFieldController.text.isNotEmpty) {
                                    postPresenter
                                        .addBlock(
                                            widget.postModelData.id.toString(),
                                            _textFieldController.text
                                                .toString())
                                        .then((value) {
                                      // Fluttertoast.showToast(msg: "Post Block Successfully");
                                      showCustomSnackBar(
                                          "Post Block Successfully", context,
                                          isError: false);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) => DashBoardScreen()));
                                      //Navigator.pop(context);
                                    });
                                  } else {
                                    showCustomSnackBar(
                                        "Please Enter Reason", context,
                                        isError: true);
                                    // Fluttertoast.showToast(msg: "Please Enter Reason");
                                  }
                                },
                                child: Text(
                                  "Submit",
                                ))
                          ],
                        )),
                  ),
                ),
              ),
            ),
          );
        });
  }

  //User report.........................
  Future<void> _displayTextInputDialogUserReport(BuildContext context) async {
    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets +
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
            duration: Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: MediaQuery.removeViewInsets(
              removeLeft: true,
              removeTop: true,
              removeRight: true,
              removeBottom: true,
              context: context,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 280.0),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    elevation: 30.0,
                    color: Theme.of(context).dialogBackgroundColor,
                    type: MaterialType.card,
                    child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Report User",
                              textAlign: TextAlign.left,
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                height: 2,
                                color: Color(0xff000000),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextField(
                                autocorrect: true,
                                maxLines: 4,
                                minLines: 4,
                                keyboardType: TextInputType.multiline,
                                controller: _textFieldController,
                                style: SafeGoogleFont(
                                  'Lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  color: const Color(0xff000000),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter reason',
                                  hintStyle: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    color: const Color(0xff000000),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xfff3f3f3),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color(0x59000000), width: 1),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide:
                                        BorderSide(color: Color(0x59000000)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_textFieldController.text.isNotEmpty) {
                                    postPresenter
                                        .addUserReport(
                                            widget.postModelData.account!.id
                                                .toString(),
                                            _textFieldController.text
                                                .toString())
                                        .then((value) {
                                      showCustomSnackBar(
                                          "User Report Successfully", context,
                                          isError: false);
                                      Navigator.pop(context);
                                    });
                                  } else {
                                    showCustomSnackBar(
                                        "Please Enter Reason", context,
                                        isError: true);
                                    // Fluttertoast.showToast(msg: "Please Enter Reason");
                                  }
                                },
                                child: Text(
                                  "Submit",
                                ))
                          ],
                        )),
                  ),
                ),
              ),
            ),
          );
        });
  }

  //User block.................
  Future<void> _displayTextInputDialogUserBlock(BuildContext context) async {
    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets +
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
            duration: Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: MediaQuery.removeViewInsets(
              removeLeft: true,
              removeTop: true,
              removeRight: true,
              removeBottom: true,
              context: context,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 280.0),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    elevation: 30.0,
                    color: Theme.of(context).dialogBackgroundColor,
                    type: MaterialType.card,
                    child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Block User",
                              textAlign: TextAlign.left,
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                height: 2,
                                color: Color(0xff000000),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: TextField(
                                autocorrect: true,
                                maxLines: 4,
                                minLines: 4,
                                keyboardType: TextInputType.multiline,
                                controller: _textFieldController,
                                style: SafeGoogleFont(
                                  'Lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  color: const Color(0xff000000),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter reason',
                                  hintStyle: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    color: const Color(0xff000000),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xfff3f3f3),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color(0x59000000), width: 1),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide:
                                        BorderSide(color: Color(0x59000000)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_textFieldController.text.isNotEmpty) {
                                    postPresenter
                                        .addUserBlock(
                                            widget.postModelData.account!.id
                                                .toString(),
                                            _textFieldController.text
                                                .toString())
                                        .then((value) {
                                      // Fluttertoast.showToast(msg: "User Block Successfully");
                                      Navigator.pop(context);
                                      showCustomSnackBar(
                                          "User Block Successfully", context,
                                          isError: false);
                                    });
                                  } else {
                                    // Fluttertoast.showToast(msg: "Please Enter Reason");
                                    showCustomSnackBar(
                                        "Please Enter Reason", context,
                                        isError: true);
                                  }
                                },
                                child: Text(
                                  "Submit",
                                ))
                          ],
                        )),
                  ),
                ),
              ),
            ),
          );
        });
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
        _displayTextInputDialogReport(context);
      } else if (itemSelected == "2") {
        //code here
        _displayTextInputDialogBlock(context);
      } else if (itemSelected == "3") {
        //code here
        _displayTextInputDialogUserReport(context);
      } else if (itemSelected == "4") {
        //code here
        _displayTextInputDialogUserBlock(context);
      }
    });
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Rate",
                        style: TextStyle(fontSize: 24.0),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.star_border,
                            color: Colors.red,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.red,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.red,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.red,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.red,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add Review",
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "Rate Product",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /*bool _isTextOverflowed() {
    final renderObject = context.findRenderObject();
    if (renderObject is RenderBox) {
      final constraints = renderObject.constraints;
      return renderObject.getMaxIntrinsicHeight(constraints as double) > constraints.maxHeight;
    }
    return false;
  }*/
}
