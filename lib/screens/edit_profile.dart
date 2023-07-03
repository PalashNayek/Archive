import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:s2w/screens/setting_screen.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/utils.dart';
import 'package:s2w/widget/display_image_rect.dart';

import '../models/profile_model.dart';
import '../models/register_post_model.dart';
import '../presenter/auth_presenter.dart';
import '../widget/custom_snackbar.dart';
import '../widget/display_image.dart';
import 'account.dart';
import 'dashboard/fluid_nav_bar.dart';
import 'my_follower_list.dart';
import 'my_following_list.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FilePickerResult? result;
  FilePickerResult? resultCover;
  FocusNode focusNodeTitle = FocusNode();
  FocusNode focusNodeDescription = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeDOB = FocusNode();
  FocusNode focusNodeMobile = FocusNode();
  FocusNode focusNodeBio = FocusNode();
  String dropdownValue = "Select Sport";
  AuthPresenter authPresenter = AuthPresenter();
  ProfileModel profileModel = ProfileModel();
  bool load = false;
  var gender;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    authPresenter.getProfile().then((value) {
      profileModel = value;
      load = true;
      usernameController.text = profileModel.user!.firstName.toString();

      fullnameController.text = profileModel.user!.lastName.toString();

      emailController.text = profileModel.user!.emailId.toString();

      bioController.text = profileModel.user!.desc == null
          ? ""
          : profileModel.user!.desc.toString();

      dobController.text = profileModel.user!.dob.toString();
      try{

      }catch(error){
        gender = profileModel.user!.gender;
      }
      mobileController.text =
          profileModel.user!.account!.phoneNumber.toString();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          "Edit & Update Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //padding: EdgeInsets.fromLTRB(10*fem, 20*fem, 10*fem, 10*fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned(
                              child: Align(
                                  child: InkWell(
                                onTap: () {
                                  // navigateSecondPage(EditImagePage());
                                },
                                child: DisplayImageRect(
                                  imagePath: resultCover != null
                                      ? resultCover!.files[0].path.toString()
                                      : load
                                          ? profileModel.user!.cover != null
                                              ? profileModel.user!.cover
                                                  .toString()
                                              : 'assets/page-1/images/bannerdefaultimage.png'
                                          : 'assets/page-1/images/bannerdefaultimage.png',
                                  onPressed: () async {
                                    resultCover = await FilePicker.platform
                                        .pickFiles(
                                            allowMultiple: false,
                                            type: FileType.custom,
                                            allowedExtensions: [
                                          'jpg',
                                          'png',
                                          'jpeg'
                                        ]);
                                    if (resultCover == null) {
                                      print("No file selected");
                                    } else {
                                      setState(() {});
                                      resultCover?.files.forEach((element) {
                                        print(element.name);
                                      });
                                    }
                                  },
                                ),
                              ))),
                          Positioned(
                              top: 90 * fem,
                              child: Align(
                                child: SizedBox(
                                    height: 150,
                                    width: 350,
                                    child: InkWell(
                                        onTap: () {
                                          // navigateSecondPage(EditImagePage());
                                        },
                                        child: DisplayImage(
                                          imagePath: result != null
                                              ? result!.files[0].path.toString()
                                              : load
                                                  ? profileModel
                                                              .user!.profile !=
                                                          null
                                                      ? profileModel
                                                          .user!.profile
                                                          .toString()
                                                      : profileModel.user!
                                                                  .gender ==
                                                              "Male"
                                                          ? 'assets/page-1/images/user_profile_male.png'
                                                          : 'assets/page-1/images/user_profile_female.png'
                                                  : gender ==
                                                          "Malle"
                                                      ? 'assets/page-1/images/user_profile_male.png'
                                                      : 'assets/page-1/images/user_profile_female.png',
                                          onPressed: () async {
                                            result = await FilePicker.platform
                                                .pickFiles(
                                                    allowMultiple: false,
                                                    type: FileType.custom,
                                                    allowedExtensions: [
                                                  'jpg',
                                                  'png',
                                                  'jpeg'
                                                ]);
                                            if (result == null) {
                                              print("No file selected");
                                            } else {
                                              setState(() {});
                                              result?.files.forEach((element) {
                                                print(element.name);
                                              });
                                            }
                                          },
                                        ))),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          10 * fem, 10 * fem, 10 * fem, 10 * fem),
                      width: double.infinity,
                      height: 60 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: TextField(
                        autocorrect: true,
                        focusNode: focusNodeTitle,
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
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
                        focusNode: focusNodeDescription,
                        controller: fullnameController,
                        decoration: InputDecoration(
                          hintText: 'Full Name',
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
                        focusNode: focusNodeEmail,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
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
                        focusNode: focusNodeMobile,
                        controller: mobileController,
                        decoration: InputDecoration(
                          hintText: 'Mobile No',
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
                        focusNode: focusNodeBio,
                        controller: bioController,
                        decoration: InputDecoration(
                          hintText: 'Bio',
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
                      height: 60 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: TextField(
                        autocorrect: true,
                        focusNode: focusNodeDOB,
                        controller: dobController,
                        readOnly: true,
                        onTap: _pickDateDialog,
                        decoration: InputDecoration(
                          hintText: 'DOB',
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
                  ],
                ),
              ),
              load
                  ? Container(
                      margin: EdgeInsets.fromLTRB(
                          22 * fem, 0 * fem, 16 * fem, 0 * fem),
                      child: TextButton(
                        onPressed: () {
                          if (result != null) {
                            File f = File(result!.files[0].path.toString());
                            authPresenter.putImageUpload(f);
                          }
                          if (resultCover != null) {
                            File f =
                                File(resultCover!.files[0].path.toString());
                            authPresenter.putCoverImageUpload(f);
                          }
                          if (usernameController.text.isEmpty) {
                            showCustomSnackBar("Username Required", context);
                          } else if (fullnameController.text.isEmpty) {
                            showCustomSnackBar("Full Name Required", context);
                          } else if (emailController.text.isEmpty) {
                            showCustomSnackBar("Email id Required", context);
                          }else if (mobileController.text.isEmpty) {
                            showCustomSnackBar("Mobile No Required", context);
                          }else if (bioController.text.isEmpty) {
                            showCustomSnackBar("Bio Required", context);
                          } else if (dobController.text.isEmpty) {
                            showCustomSnackBar("DOB Required", context);
                          }
                          else {
                            RegisterModel registerModel = RegisterModel();

                            registerModel.emailId = emailController.text;

                            registerModel.phoneNumber = profileModel.user!.account!.phoneNumber.toString();

                            registerModel.firstName = usernameController.text.toString();

                            registerModel.lastName = fullnameController.text.toString();

                            registerModel.dob = dobController.text.toString();

                            registerModel.desc = bioController.text.toString();

                            registerModel.gender = profileModel.user!.gender.toString();

                            registerModel.joinFor = "Participants";

                            registerModel.primaryInetrestId = profileModel.user!.primaryInetrestId.toString();

                            registerModel.secondaryInetrestId = profileModel.user!.secondaryInetrestId.toString();

                            registerModel.thirdInetrestId = profileModel.user!.thirdInetrestId.toString();

                            authPresenter
                                .updateUser(
                                    profileModel.user!.accountId.toString(),
                                    registerModel)
                                .then((value) {
                              showCustomSnackBar("Update Successful", context,
                                  isError: false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountContent()));
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 50 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff080053),
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Update Profile',
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
                    )
                  : SizedBox(
                      height: 1,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime? _selectedDate;

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        final df = new DateFormat('dd-MM-yyyy');
        dobController.text = df.format(_selectedDate!).toString();
      });
    });
  }
}
