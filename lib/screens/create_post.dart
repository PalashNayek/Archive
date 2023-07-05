import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui';
import 'package:s2w/models/post_request_model.dart';
import 'package:s2w/presenter/post_presenter.dart';
import 'package:s2w/screens/setting_screen.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/utils.dart';
import 'package:s2w/utils/app_constants.dart';
import 'package:s2w/widget/category_select_item.dart';
import 'package:s2w/widget/custom_snackbar.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

//import 'package:video_thumbnail/video_thumbnail.dart';
import '../models/hashtag_model.dart';
import '../models/profile_model.dart';
import '../presenter/auth_presenter.dart';
import '../utilities/app_common_helper.dart';
import 'dashboard/fluid_nav_bar.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
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
  String selected = "";
  List<File> x = [];
  bool term = true;
  bool loader = false;
  String userIntersetedValue = "";

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
              padding: EdgeInsets.all(10),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new CircularProgressIndicator(),
                  new Text("Please wait.."),
                ],
              )),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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

  void getData() {
    loader = true;
    authPresenter.getProfile().then((value) {
      profileModel = value;
      selected = profileModel.user!.primaryInetrest!.id.toString();
      setState(() {
        userIntersetedValue = profileModel.user!.primaryInetrest!.id.toString();
        if (userIntersetedValue.isNotEmpty) {
          loader = false;
        }
      });
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
          "Create Post",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: loader
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: CircularProgressIndicator()))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*Container(
                width: double.infinity,
                height: 76 * fem,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(38 * fem),
                    bottomLeft: Radius.circular(38 * fem),
                  ),
                ),
                */ /*child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Create Post',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Lato',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2 * ffem / fem,
                            color: Color(0xffcacaca),
                          ),
                        )),
                  ],
                ),*/ /*
              ),*/
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          10 * fem,
                          AppCommonHelper.isTablet(context) ? 10 : 20 * fem,
                          10 * fem,
                          10 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                10 * fem,
                                AppCommonHelper.isTablet(context)
                                    ? 1
                                    : 20 * fem,
                                10 * fem,
                                AppCommonHelper.isTablet(context)
                                    ? 1
                                    : 10 * fem),
                            width: double.infinity,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: TextField(
                              autocorrect: true,
                              focusNode: focusNodeTitle,
                              controller: titleController,
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2 * ffem / fem,
                                color: Color(0xff000000),
                              ),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                      color: Color(0x59000000), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide:
                                      BorderSide(color: Color(0x59000000)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                10 * fem,
                                0 * fem,
                                10 * fem,
                                AppCommonHelper.isTablet(context)
                                    ? 1
                                    : 10 * fem),
                            width: double.infinity,
                            height: 60 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: TextField(
                              autocorrect: true,
                              focusNode: focusNodeHasTag,
                              controller: hasTagController,
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2 * ffem / fem,
                                color: Color(0xff000000),
                              ),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                      color: Color(0x59000000), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide:
                                      BorderSide(color: Color(0x59000000)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                10 * fem,
                                0 * fem,
                                10 * fem,
                                AppCommonHelper.isTablet(context)
                                    ? 1
                                    : 10 * fem),
                            width: double.infinity,
                            height: 100 * fem,
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
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2 * ffem / fem,
                                color: const Color(0xff000000),
                              ),
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
                          if (x.length > 0)
                            Container(
                                height: 150,
                                width: double.infinity,
                                margin: EdgeInsets.all(
                                    AppCommonHelper.isTablet(context) ? 1 : 5),
                                padding: const EdgeInsets.all(5.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: x.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                          x.elementAt(index),
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.low,
                                          alignment: Alignment.topCenter,
                                          frameBuilder: (context, child, frame,
                                              wasSynchronouslyLoaded) {
                                            return Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 3),
                                                ),
                                                child: child,

                                              ),
                                            );

                                          },
                                        ),
                                          Positioned(
                                            right: 10 * fem,
                                            top: 10 * fem,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.red,
                                              child: Center(
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: primary,
                                                    ),
                                                    onPressed: () {
                                                      result?.files.forEach((element) {
                                                        print("PNayek->"+element.name);
                                                        if (element.extension == "mp4") {
                                                          _generateThumbnail(
                                                              element.path.toString())
                                                              .then((value) {
                                                            x.clear();
                                                            setState(() {});
                                                          });
                                                        } else {
                                                          //x.add(File(element.path.toString()));
                                                          x.clear();
                                                          setState(() {});
                                                        }
                                                      });
                                                    },
                                                  )),
                                            ),
                                          ),
                                        ]
                                      );

                                      // return Text(result?.files[index].name ?? '', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
                                    })
                            ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                result = await FilePicker.platform.pickFiles(
                                  allowMultiple: true,
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'jpg',
                                    'png',
                                    'jpeg',
                                    'mp4'
                                  ],
                                );
                                if (result == null) {
                                  print("No file selected");
                                } else {
                                  result?.files.forEach((element) {
                                    print("Palash1--");
                                    print(element.name);
                                    if (element.extension == "mp4") {
                                      _generateThumbnail(
                                              element.path.toString())
                                          .then((value) {
                                        x.add(value);
                                        setState(() {});
                                      });
                                    } else {
                                      //mutiple item upload editing by Palash
                                      int? myElement = x.length;
                                      print("MyFileLen->$File(element.path.toString())");


                                      ////////////


                                      x.add(File(element.path.toString()));
                                      setState(() {});
                                    }
                                  });
                                }
                              },
                              child: Text(
                                "Select File",
                                style: TextStyle(
                                    fontSize: AppCommonHelper.isTablet(context)
                                        ? 30
                                        : 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Select Category",
                      style: TextStyle(
                          fontSize:
                              AppCommonHelper.isTablet(context) ? 30 : 14),
                    ),
                    Container(
                      height: AppCommonHelper.isTablet(context) ? 120 : 100,
                      margin: EdgeInsets.all(
                          AppCommonHelper.isTablet(context) ? 1 : 10),
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
                              selected = profileModel.user!.primaryInetrest!.id
                                  .toString();
                              setState(() {});
                            },
                            isSelected: profileModel.user!.primaryInetrest!.id
                                    .toString() ==
                                selected,
                            title: profileModel.user!.primaryInetrest!.name
                                .toString(),
                            icon: profileModel.user!.primaryInetrest!.image
                                .toString(),
                          )),
                          Expanded(
                              child: CategorySelectItem(
                            isSelected: profileModel.user!.secondaryInetrest!.id
                                    .toString() ==
                                selected,
                            onclick: () {
                              selected = profileModel
                                  .user!.secondaryInetrest!.id
                                  .toString();
                              setState(() {});
                            },
                            title: profileModel.user!.secondaryInetrest!.name
                                .toString(),
                            icon: profileModel.user!.secondaryInetrest!.image
                                .toString(),
                          )),
                          profileModel.user!.secondaryInetrest != null
                              ? Expanded(
                                  child: CategorySelectItem(
                                  isSelected: profileModel
                                          .user!.thirdInetrest!.id
                                          .toString() ==
                                      selected,
                                  onclick: () {
                                    selected = profileModel
                                        .user!.thirdInetrest!.id
                                        .toString();
                                    setState(() {});
                                  },
                                  title: profileModel.user!.thirdInetrest!.name
                                      .toString(),
                                  icon: profileModel.user!.thirdInetrest!.image
                                      .toString(),
                                ))
                              : Container(),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(
                            5 * fem,
                            AppCommonHelper.isTablet(context) ? 5 : 15 * fem,
                            5 * fem,
                            0 * fem),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  focusColor: Colors.lightBlue,
                                  activeColor: primary,
                                  value: term,
                                  onChanged: (newValue) {
                                    term = newValue!;
                                    setState(() {});
                                  }),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildAboutDialog(context),
                                    );
                                  },
                                  child: Text(
                                    'I agree with Terms & Conditions and privacy policy',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  )),
                            ])),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          AppCommonHelper.isTablet(context) ? 50 : 20 * fem,
                          15 * fem,
                          AppCommonHelper.isTablet(context) ? 50 : 16 * fem,
                          0 * fem),
                      child: TextButton(
                        onPressed: () {
                          if (titleController.text.isEmpty) {
                            showCustomSnackBar("Title Required", context);
                          } else if (descriptionController.text.isEmpty) {
                            showCustomSnackBar("Description Required", context);
                          } else if (!term) {
                            showCustomSnackBar(
                                "Please accept our Terms & Conditions",
                                context);
                          } else {
                            _onLoading(context);
                            HasTagModel hastag = HasTagModel();
                            hastag.name = hasTagController.text.toString();
                            PostRequestModel registerModel = PostRequestModel();
                            registerModel.name = titleController.text;
                            registerModel.desc =
                                descriptionController.text.toString();
                            registerModel.postTags = [hastag];
                            registerModel.interestId = selected;
                            registerModel.latitude = "123";
                            registerModel.longitude = "123";

                            //print("button click$registerModel");

                            postPresenter.addPost(registerModel).then((value) {
                              print("button click$registerModel");

                              if (result != null) {
                                result?.files.forEach((element) {
                                  print(element.extension);
                                  print(element.name);
                                  if (element.extension == "mp4") {
                                    print("Palash2 - > Post Video");
                                    postPresenter.postVideoUpload(value.id.toString(), File(element.path.toString()));
                                  } else {
                                        postPresenter.postImageUpload(value.id.toString(), File(element.path.toString())).then((value) {
                                          print("Upload Images:"+value.toString());
                                        });

                                        print(result?.count.toString());
                                  }
                                });
                              }

                              Navigator.pop(context);
                              showCustomSnackBar(
                                  "Post Added Successfully", context,
                                  isError: false);

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
                          height:
                              AppCommonHelper.isTablet(context) ? 60 : 60 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff080053),
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Review & Submit',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Lato',
                                fontSize: AppCommonHelper.isTablet(context)
                                    ? 18
                                    : 20 * ffem,
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
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Terms & Conditions'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppConstants.terms,
            style: TextStyle(fontSize: 8, color: Colors.grey),
          )
        ],
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
