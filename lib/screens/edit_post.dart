import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:s2w/models/post_request_model.dart';
import 'package:s2w/presenter/post_presenter.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/utils.dart';
import 'package:s2w/widget/category_select_item.dart';

import '../models/hashtag_model.dart';
import '../models/post_details_model.dart';
import '../models/post_list_model.dart';
import '../models/profile_model.dart';
import '../presenter/auth_presenter.dart';
import 'dashboard/fluid_nav_bar.dart';

class EditPostScreen extends StatefulWidget {
  EditPostScreen({required this.postId});

  String postId;

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController hasTagController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  PostPresenter postPresenter = PostPresenter();
  FilePickerResult? result;
  FocusNode focusNodeTitle = FocusNode();
  FocusNode focusNodeHasTag = FocusNode();
  FocusNode focusNodeDescription = FocusNode();
  AuthPresenter authPresenter = AuthPresenter();
  ProfileModel profileModel = ProfileModel();
  PostDetails postModelData = PostDetails();
  bool load = false;
  String selected = "";
  String postId = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    authPresenter.getProfile().then((value) {
      profileModel = value;

      setState(() {});
    });
    postPresenter.getPostDetails(widget.postId.toString()).then((value) {
      postModelData = value;
      load = true;
      postId = postModelData.id.toString();
      //print("PostId->"+postId);
      titleController.text = postModelData.name.toString();
      descriptionController.text = postModelData.desc.toString();
      selected = postModelData.interestId.toString();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          "Edit & update post",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: load? Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    EdgeInsets.fromLTRB(10 * fem, 20 * fem, 10 * fem, 10 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          10 * fem, 20 * fem, 10 * fem, 10 * fem),
                      width: double.infinity,
                      height: 60 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: TextField(
                        autocorrect: true,
                        focusNode: focusNodeTitle,
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: SafeGoogleFont(
                            'Lato',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: Color(0xfff3f3f3),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(color: Color(0x59000000), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Color(0x59000000)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          10 * fem, 0 * fem, 10 * fem, 10 * fem),
                      width: double.infinity,
                      height: 60 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: TextField(
                        autocorrect: true,
                        focusNode: focusNodeHasTag,
                        controller: hasTagController,
                        decoration: InputDecoration(
                          hintText: 'HasTag upto 30',
                          hintStyle: SafeGoogleFont(
                            'Lato',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: Color(0xfff3f3f3),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(color: Color(0x59000000), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Color(0x59000000)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          10 * fem, 0 * fem, 10 * fem, 10 * fem),
                      width: double.infinity,
                      height: 150 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: TextField(
                        autocorrect: true,
                        maxLines: 4,
                        minLines: 4,
                        keyboardType: TextInputType.multiline,
                        focusNode: focusNodeDescription,
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: SafeGoogleFont(
                            'Lato',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: const Color(0xfff3f3f3),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(color: Color(0x59000000), width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Color(0x59000000)),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(
                          10 * fem, 0 * fem, 10 * fem, 10 * fem),
                      width: double.infinity,
                      height: 150 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      /*child:CachedNetworkImage(
                        filterQuality: FilterQuality.low,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                        imageUrl: postModelData.postImage.toString(),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),*/
                    ),
                   /* if (result != null)
                      Container(
                          height: 100,
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5.0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: result?.files.length ?? 0,
                              itemBuilder: (context, index) {
                                File f =
                                    File(result!.files[index].path.toString());
                                return Image.file(
                                  f,
                                  height: 100,
                                  width: 100,
                                );
                                // return Text(result?.files[index].name ?? '', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
                              })),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          result = await FilePicker.platform.pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'png', 'jpeg', 'mp4'],
                          );
                          if (result == null) {
                            print("No file selected");
                          } else {
                            setState(() {});
                            result?.files.forEach((element) {
                              print(element.name);
                            });
                          }
                        },
                        child: const Text("Select File"),
                      ),
                    ),*/
                  ],
                ),
              ),
              /*Text(
                "Select Category",
                style: TextStyle(fontSize: 14),
              ),*/

              Container(
                height: 85,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                        child: CategorySelectItem(
                      onclick: () {
                        selected =
                            profileModel.user!.primaryInetrest!.id.toString();
                        setState(() {});
                      },
                      isSelected:
                          profileModel.user!.primaryInetrest!.id.toString() ==
                              selected,
                      title: profileModel.user!.primaryInetrest!.name.toString(),
                      icon: profileModel.user!.primaryInetrest!.image.toString(),
                    )),
                    Expanded(
                        child: CategorySelectItem(
                      isSelected:
                          profileModel.user!.secondaryInetrest!.id.toString() ==
                              selected,
                      onclick: () {
                        selected =
                            profileModel.user!.secondaryInetrest!.id.toString();
                        setState(() {});
                      },
                      title:
                          profileModel.user!.secondaryInetrest!.name.toString(),
                      icon:
                          profileModel.user!.secondaryInetrest!.image.toString(),
                    )),
                    profileModel.user!.secondaryInetrest != null
                        ? Expanded(
                            child: CategorySelectItem(
                            isSelected:
                                profileModel.user!.thirdInetrest!.id.toString() ==
                                    selected,
                            onclick: () {
                              selected =
                                  profileModel.user!.thirdInetrest!.id.toString();
                              setState(() {});
                            },
                            title:
                                profileModel.user!.thirdInetrest!.name.toString(),
                            icon: profileModel.user!.thirdInetrest!.image
                                .toString(),
                          ))
                        : Container(),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(22 * fem, 20 * fem, 16 * fem, 0 * fem),
                child: TextButton(
                  onPressed: () {
                    if (titleController.text.isEmpty) {
                      //Fluttertoast.showToast(msg: "Title Required");
                    } else if (descriptionController.text.isEmpty) {
                      // Fluttertoast.showToast(msg: "Description Required");
                    } else {
                      HasTagModel hastag = HasTagModel();
                      hastag.name = hasTagController.text.toString();
                      PostRequestModel registerModel = PostRequestModel();
                      registerModel.name = titleController.text;
                      registerModel.desc = descriptionController.text.toString();
                      registerModel.postTags = [hastag];
                      registerModel.interestId = selected;
                      registerModel.latitude = "123";
                      registerModel.longitude = "123";
                      registerModel.type = "Post";



                      postPresenter.updatePost(postId, registerModel).then((value) {
                        /*if (result != null) {
                          result?.files.forEach((element) {
                            print(element.name);
                            postPresenter.postImageUpload(value.id.toString(),
                                File(element.path.toString()));
                          });
                        }*/
                        // Fluttertoast.showToast(msg: "Post Updated Successfully");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoardScreen()));
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff080053),
                      borderRadius: BorderRadius.circular(5 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Review & Update',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Lato',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.2 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ): Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
