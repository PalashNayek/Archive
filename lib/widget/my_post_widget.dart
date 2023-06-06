import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:s2w/page-1/search-page-.dart';
import 'package:s2w/screens/edit_post.dart';
import 'package:s2w/screens/other_account.dart';
import 'package:s2w/screens/post_details_screen.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/widget/custom_snackbar.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
//import 'package:share_plus/share_plus.dart';
import '../models/post_list_model.dart';
import '../models/profile_model.dart';
import '../page-1/search-page--dL4.dart';
import '../player/video_player.dart';
import '../presenter/post_presenter.dart';
import '../screens/comment_screen.dart';
import '../screens/dashboard/fluid_nav_bar.dart';
import '../utilities/app_common_helper.dart';
import '../utils.dart';
import 'package:http/http.dart' as http;
class MyPostWidgetItem extends StatefulWidget {
  MyPostWidgetItem(this.postModelData,this.profileModel);
  PostModelData postModelData;
  String profileModel;
  @override
  _PostWidgetItemState createState() => _PostWidgetItemState();
}

class _PostWidgetItemState extends State<MyPostWidgetItem> {
  int activePage = 0;
  PageController _pageController = PageController(viewportFraction: 1,initialPage: 0);
  PostPresenter postPresenter= PostPresenter();
  @override
  void initState() {
    super.initState();
    if(widget.postModelData.postImage!.length>0) {
      if (getFileExtension(
          widget.postModelData.postImage!.elementAt(0).image.toString()) ==
          "mp4") {
        _generateThumbnail(
            widget.postModelData.postImage!.elementAt(0).image.toString())
            .then((value) {
          files.add(value);
          setState(() {

          });
        });
      }
    }

  }
  String getFileExtension(String fileName) {
    try {
      return  fileName.split('.').last;
    } catch(e){
      return "";
    }
  }
  List<File> files=[];
  Future<File> _generateThumbnail(String url) async {

    final String? _path = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path, /// path_provider
      imageFormat: ImageFormat.PNG,
      maxHeight: 50,
      quality: 50,
    );
    return File(_path!);
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    List<Widget> indicators(imagesLength,currentIndex) {

      return List<Widget>.generate(imagesLength, (index) {
        return Container(
          margin: EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentIndex == index ? primary :secondary,
              shape: BoxShape.circle),
        );
      });
    }
    return   Container(
      margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 7*fem, 7*fem),
      width: double.infinity,
      height: 440*fem,
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

           GestureDetector(onTap: (){
             Navigator.push(context,MaterialPageRoute(builder: (context) =>OtherAccountContent(widget.postModelData.account!.id.toString())));

           },child:  Container(
                 margin: EdgeInsets.all(5.0),
                 child: ClipRRect(
                 borderRadius: BorderRadius.circular(30.0),
                 child:widget.postModelData.account!.personalDetail!.elementAt(0).profile==null?
                 Image.asset("assets/page-1/images/user.png",
                     width: 50*fem,
                     height: 50*fem,
                     fit: BoxFit.cover) :
                 Image.network(widget.postModelData.account!.personalDetail!.elementAt(0).profile.toString(),
                   width: 50*fem,
                   height: 50*fem,
                   fit: BoxFit.cover
               ),
             ))),

             Expanded(child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,

               children: [
                 Container(
                   margin: EdgeInsets.only(left: 10,top: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                   RichText(
                       text: TextSpan(
                         style: SafeGoogleFont (
                           'Netflix Sans',
                           fontSize: 16*ffem,
                           fontWeight: FontWeight.w500,
                           height: 1.171875*ffem/fem,
                           color: Color(0xff000000),
                         ),
                         children: [
                           TextSpan(
                             text: widget.postModelData.account!.personalDetail!.elementAt(0).firstName,
                             style: SafeGoogleFont (
                               'Lato',
                               fontSize: 16*ffem,
                               fontWeight: FontWeight.w700,
                               height: 1.2*ffem/fem,
                               color: Color(0xff000000),
                             ),
                           ),
                         ],
                       ),
                   ),
                   SizedBox(height: 5,),
                   Text(AppCommonHelper.timeAgoCustom(widget.postModelData.createdAt.toString()),
                     style: SafeGoogleFont (
                       'Lato',
                       fontSize: 9*ffem,
                       fontWeight: FontWeight.w400,
                       height: 1.2*ffem/fem,
                       color: Color(0xff9496a1),
                     ),
                   ),
                 ],),),

                 //option/more icon
                 widget.postModelData.account!.id.toString()==widget.profileModel?   GestureDetector(child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(Icons.more_vert,size: AppCommonHelper.isTablet(context)?40:24,)
                ),onTapDown: (details){

                 showPopupMenu(context,details);

               },):SizedBox(width: 1,)
             ],))
             //username

           ],
         ),
          //header End
          SizedBox(height: 3,),
          Divider(height: 1,color: Colors.grey,),
          SizedBox(height: 3,),
         Padding(padding:EdgeInsets.only(left: 10) , child:Align(alignment: Alignment.topLeft, child: Text(widget.postModelData.name.toString(),
            textAlign: TextAlign.left,
            style: SafeGoogleFont (
              'Lato',
              fontSize: 16*ffem,
              fontWeight: FontWeight.w700,
              height: 1.2*ffem/fem,
              color: Color(0xff000000),
            ),
          ))),
         SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) =>PostDetailsScreen(widget.postModelData)));

            },
            child: Container(
              margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 7*fem, 7*fem),
              width: double.infinity,
              height: 300*fem,
              child:  widget.postModelData.postImage!.length>0? widget.postModelData.postImage!.length==1?Center(child:Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: getFileExtension(widget.postModelData.postImage!.elementAt(0).image.toString())=="mp4"?
                  files.length>0?Image.file(files.elementAt(0),
                    width: double.infinity,
                    fit: BoxFit.cover,):Image.asset("assets/page-1/images/loading.png",
                    width: double.infinity,
                    fit: BoxFit.fill,):Image.network(widget.postModelData.postImage!.elementAt(0).image.toString(),
                    width: double.infinity,
                    fit: BoxFit.fill,) ,),
                getFileExtension(widget.postModelData.postImage!.elementAt(0).image.toString())=="mp4"?
                Align(alignment: Alignment.center,
                    child:  IconButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>VideoApp(url: widget.postModelData.postImage!.elementAt(0).image.toString(),)));
                    }, icon:   Icon(Icons.play_circle,
                        size: 50,
                        color: third
                    ),)):SizedBox(width: 1,)])):
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
              ],):
              Align(alignment: Alignment.center, child:Text(widget.postModelData.desc.toString(),style: TextStyle(color: Colors.black,fontSize: AppCommonHelper.isTablet(context)?40:24,),)),


              /* ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child:

            widget.postModelData.postImage!.length>0? widget.postModelData.postImage!.length==1?
               // Center(child:Stack(children: [
                  Image.network(widget.postModelData.postImage!.elementAt(0).image.toString(),
                    fit: BoxFit.cover,)
                  *//* Align(
                    alignment: Alignment.center,
                    child:  IconButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>VideoApp()));
                  }, icon:   Icon(Icons.play_circle,
                      size: 50,
                      color: third
                  ),))*//*

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
          Container(
              width: double.infinity,
              height: 24.00*fem,
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  GestureDetector(
                  onTap: (){


                    },
                  child: Container(child: Row(children: [
                    Icon(Icons.thumb_up,
                      size: AppCommonHelper.isTablet(context)?40:24,
                      color:  primary
                    ),
                    SizedBox(width: 5,),
                    Text(widget.postModelData.shareCount.toString(),style: TextStyle(color: Colors.grey,fontSize:  AppCommonHelper.isTablet(context)?30:16),)

                  ],),)),

                  GestureDetector(
                  onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>CommentScreen(widget.postModelData)));

                  },
                 child: Container(child: Row(children: [
                    Icon(Icons.comment,
                      size: AppCommonHelper.isTablet(context)?40:24,
                    ),
                    SizedBox(width: 5,),
                    Text(widget.postModelData.commentCount.toString(),style: TextStyle(color: Colors.grey,fontSize:  AppCommonHelper.isTablet(context)?30:16),)
                  ],),),),
                  /*Container(child: Row(children: [
                    Icon(Icons.remove_red_eye_sharp,
                      size: 24,
                    ),
                    SizedBox(width: 5,),
                    Text("12K",style: TextStyle(color: Colors.grey),)
                  ],),),*/
                  GestureDetector(
                      onTapDown: (down){
                        if(widget.postModelData.postImage!.length>0) {
                          shareNetworkImage(widget.postModelData.postImage!.elementAt(0).image.toString());
                        }else{
                          shareText(widget.postModelData.desc.toString());
                        }
                      },
                      child:  Container(child: Row(children: [
                        Icon(Icons.ios_share_outlined,
                          size: AppCommonHelper.isTablet(context)?40:24,
                        ),
                        // SizedBox(width: 5,),
                        // Text(widget.postModelData.shareCount.toString(),style: TextStyle(color: Colors.grey),)
                      ],),)),


                ],
              ),
            ),
        ],
      ),
    );

  }
  Future<void> shareNetworkImage(String imageUrl) async {
    try {
      var response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final file = await File('${tempDir.path}/image.png').create();
        await file.writeAsBytes(response.bodyBytes);
      //  Share.shareXFiles([XFile(file.path)], text: "Welcome to Sporto App");
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
      //Share.share(text, subject: 'Welcome to Sporto App');
    } catch (e) {
      throw 'Failed to share image: $e';
    }
  }
  showPopupMenu(BuildContext context,TapDownDetails details){
    showMenu<String>(
      context: context,

      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('Edit Post'), value: '1'),
        PopupMenuItem<String>(
            child: const Text('Delete Post'), value: '2'),
      ],
      elevation: 8.0,
    )
        .then<void>((String? itemSelected) {

      if (itemSelected == null) return;

      if(itemSelected == "1"){
        Navigator.push(context,MaterialPageRoute(builder: (context) =>EditPostScreen( postId: widget.postModelData.id.toString(),)));

      }else if(itemSelected == "2"){
        //code here
        postPresenter.deletePost(widget.postModelData.id.toString()).then((value) {
         showCustomSnackBar( "Post Deleted Successfully",context);
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DashBoardScreen()));

        });
      }else{
        //code here
      }

    });
  }
}