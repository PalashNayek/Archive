import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:s2w/models/interest_list_model.dart';
import 'package:s2w/models/register_post_model.dart';
import 'package:s2w/screens/dashboard/fluid_nav_bar.dart';
import 'package:s2w/utils.dart';

import '../presenter/auth_presenter.dart';
import '../presenter/shared_presenter.dart';
import '../utilities/app_common_helper.dart';
import '../utilities/app_local_data_util.dart';
import '../widget/custom_snackbar.dart';
import '../widget/gender_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

enum Gender { Male, Female }

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  AuthPresenter _authPresenter = AuthPresenter();
  FocusNode focusNodeFullName = FocusNode();
  FocusNode focusNodeDOB = FocusNode();
  FocusNode focusNodeUserName = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  String dropdownValue1 = "Select Sport";
  String dropdownValue2 = "Select Sport";
  String dropdownValue3 = "Select Sport";
  String dropdownValue4 = "Select Language";
  SharedPresenter sharedPresenter = SharedPresenter();
  List<InterestListModel> interestList = [];
  List<InterestListModel> interestList1 = [];
  List<InterestListModel> interestList2 = [];
  List<InterestListModel> interestList3 = [];

  Gender selected = Gender.Male;
  List<String> language = [];

  bool internetConnection = true;

  var _isLoading = false;
  void _onSubmit() {
    setState(() => _isLoading = true);
    /*Future.delayed(
      const Duration(seconds: 2),
          () => setState(() => _isLoading = false),
    );*/
  }

  @override
  void initState() {
    super.initState();

    language.add("Select Language");
    language.add("Hindi");
    language.add("English");
    language.add("Bengali");
    language.add("Urdu");
    language.add("marathi");
    language.add("Tamil");
    language.add("Telugu");
    getData();
  }

  void getData() {

    sharedPresenter.getInterest().then((value) {
      interestList.add(InterestListModel(
          id: "Select Sport", image: "", imageName: "", name: "Select Sport"));
      interestList1.add(InterestListModel(
          id: "Select Sport", image: "", imageName: "", name: "Select Sport"));
      interestList2.add(InterestListModel(
          id: "Select Sport", image: "", imageName: "", name: "Select Sport"));
      interestList3.add(InterestListModel(
          id: "Select Sport", image: "", imageName: "", name: "Select Sport"));
      value.forEach((element) {
        interestList.add(element);
        interestList1.add(element);
        interestList2.add(element);
        interestList3.add(element);
      });
      setState(() {

      });
    });
  }

  DateTime? _selectedDate;

  //Method for showing the date picker
  void _pickDateDialog() {
    final today = DateTime.now();
    final fiveY = DateTime(today.year - 5, today.month, today.day + 1);
    showDatePicker(
            context: context,
            initialDate: fiveY,
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: fiveY) //what will be the up to supported date in picker
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

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Container(
                padding: EdgeInsets.only(top: 7),
                width: double.infinity,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 17 * fem, 0 * fem, 35 * fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 10 * fem, 1 * fem, 30 * fem),
                                decoration: BoxDecoration(
                                  color: Color(0xff080053),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(38 * fem),
                                    bottomLeft: Radius.circular(38 * fem),
                                  ),
                                ),
                                width: AppCommonHelper.isTablet(context)
                                    ? width
                                    : 169 * fem,
                                height: 40 * fem,
                                child: Container(
                                  child: Image.asset(
                                    'assets/page-1/images/app_logo.png',
                                    fit: AppCommonHelper.isTablet(context)
                                        ? BoxFit.contain
                                        : BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        width: 390 * fem,
                        height: 670 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xfcd0cbff)),
                          color: Color(0xfcffffff),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(36 * fem),
                            topRight: Radius.circular(37 * fem),
                            bottomRight: Radius.circular(5 * fem),
                            bottomLeft: Radius.circular(5 * fem),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0 * fem, 4 * fem),
                              blurRadius: 2 * fem,
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 209 * fem,
                                height: 24 * fem,
                                child: Text(
                                  'Complete Your Profile',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w800,
                                    height: 1.2 * ffem / fem,
                                    color: Color(0xff080053),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 258 * fem,
                                height: 36 * fem,
                                child: Text(
                                  'Just one Step away from ever world of sport media app & Explore more',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2 * ffem / fem,
                                    color: Color(0xff080053),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                // group2nME (14:4)
                                margin: EdgeInsets.fromLTRB(
                                    10 * fem, 0 * fem, 10 * fem, 15 * fem),
                                width: double.infinity,
                                height: 60 * fem,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: TextField(
                                  autocorrect: true,
                                  focusNode: focusNodeUserName,
                                  controller: userNameController,
                                  decoration: InputDecoration(
                                    hintText: 'User Name',
                                    prefixIcon: Icon(
                                      Icons.person_pin_outlined,
                                      color: Colors.grey,
                                    ),
                                    hintStyle: SafeGoogleFont(
                                      'Lato',
                                      fontSize: 16 * ffem,
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
                                    10 * fem, 0 * fem, 10 * fem, 10 * fem),
                                width: double.infinity,
                                height: 60 * fem,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: TextField(
                                  autocorrect: true,
                                  focusNode: focusNodeFullName,
                                  controller: fullNameController,
                                  decoration: InputDecoration(
                                    hintText: 'Full Name',
                                    hintStyle: SafeGoogleFont(
                                      'Lato',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
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
                                    10 * fem, 0 * fem, 10 * fem, 15 * fem),
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
                                    hintText: 'Email Id',
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Colors.grey,
                                    ),
                                    hintStyle: SafeGoogleFont(
                                      'Lato',
                                      fontSize: 16 * ffem,
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
                                    10 * fem, 0 * fem, 10 * fem, 25 * fem),
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
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.calendar_month,
                                      color: Colors.grey,
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
                              Row(
                                children: [
                                  Expanded(
                                      child: GenderWidget(
                                        onclick: () {
                                          selected = Gender.Male;
                                          setState(() {});
                                        },
                                        isSelected: Gender.Male == selected,
                                        title: 'Male',
                                        icon: Icons.male,
                                      )),
                                  Expanded(
                                      child: GenderWidget(
                                        isSelected: Gender.Female == selected,
                                        onclick: () {
                                          selected = Gender.Female;
                                          setState(() {});
                                        },
                                        title: 'Female',
                                        icon: Icons.female,
                                      )),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height: 60 * fem,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    interestList1.length > 0
                                        ? Container(
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                5 * fem),
                                            color: Color(0xfff3f3f3),
                                            border: Border.all(
                                                color: Color(0x59000000))),
                                        child: DropdownButton<String>(
                                          value: dropdownValue1,
                                          underline: SizedBox(),
                                          items: interestList1
                                              .map((InterestListModel value) {
                                            return DropdownMenuItem<String>(
                                              value: value.id,
                                              child: Text(
                                                value.name.toString(),
                                                style:
                                                TextStyle(fontSize: 12),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValue1 = newValue!;
                                              interestList2.removeWhere(
                                                      (item) =>
                                                  item.id ==
                                                      dropdownValue1);
                                              interestList3.removeWhere(
                                                      (item) =>
                                                  item.id ==
                                                      dropdownValue1);
                                            });
                                          },
                                        ))
                                        : SizedBox(),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    interestList2.length > 0
                                        ? Container(
                                        margin: EdgeInsets.only(
                                            left: 5, bottom: 10),
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                5 * fem),
                                            color: Color(0xfff3f3f3),
                                            border: Border.all(
                                                color: Color(0x59000000))),
                                        child: DropdownButton<String>(
                                          value: dropdownValue2,
                                          underline: SizedBox(),
                                          items: interestList2
                                              .map((InterestListModel value) {
                                            return DropdownMenuItem<String>(
                                              value: value.id,
                                              child: Text(
                                                value.name.toString(),
                                                style:
                                                TextStyle(fontSize: 12),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValue2 = newValue!;
                                              interestList1.removeWhere(
                                                      (item) =>
                                                  item.id ==
                                                      dropdownValue2);
                                              interestList3.removeWhere(
                                                      (item) =>
                                                  item.id ==
                                                      dropdownValue2);
                                            });
                                          },
                                        ))
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 60 * fem,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    interestList3.length > 0
                                        ? Container(
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                5 * fem),
                                            color: Color(0xfff3f3f3),
                                            border: Border.all(
                                                color: Color(0x59000000))),
                                        child: DropdownButton<String>(
                                          value: dropdownValue3,
                                          underline: SizedBox(),
                                          items: interestList3
                                              .map((InterestListModel value) {
                                            return DropdownMenuItem<String>(
                                              value: value.id,
                                              child: Text(
                                                value.name.toString(),
                                                style:
                                                TextStyle(fontSize: 12),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValue3 = newValue!;
                                              interestList1.removeWhere(
                                                      (item) =>
                                                  item.id ==
                                                      dropdownValue3);
                                              interestList2.removeWhere(
                                                      (item) =>
                                                  item.id ==
                                                      dropdownValue3);
                                            });
                                          },
                                        ))
                                        : SizedBox(),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: 10, bottom: 10),
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5 * fem),
                                            color: Color(0xfff3f3f3),
                                            border: Border.all(
                                                color: Color(0x59000000))),
                                        child: DropdownButton<String>(
                                          value: dropdownValue4,
                                          underline: SizedBox(),
                                          items: language.map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValue4 = newValue!;
                                            });
                                          },
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {

                                  _isLoading ? null : _onSubmit();

                                  if (userNameController.text.isEmpty) {
                                    showCustomSnackBar(
                                        "Username Required", context);
                                  } else if (fullNameController.text.isEmpty) {
                                    showCustomSnackBar(
                                        "Full Name Required", context);
                                  } else if (emailController.text.isEmpty) {
                                    showCustomSnackBar(
                                        "Email id Required", context);
                                  } else if (dobController.text.isEmpty) {
                                    showCustomSnackBar("DOB Required", context);
                                  } else {
                                    InternetConnectionChecker()
                                        .hasConnection
                                        .then((value) => {
                                      internetConnection = value,
                                    });
                                    if (internetConnection == false) {
                                      showCustomSnackBar(
                                          "no internet connection".tr(), context);
                                    } else {
                                      final df = new DateFormat('yyyy-MM-dd');
                                      AppLocalDataUtil()
                                          .getMobile()
                                          .then((value) {
                                        RegisterModel registerModel =
                                        RegisterModel();
                                        registerModel.emailId =
                                            emailController.text;
                                        registerModel.phoneNumber = value;
                                        registerModel.firstName =
                                            fullNameController.text.toString();
                                        registerModel.lastName =
                                            userNameController.text.toString();
                                        registerModel.dob =
                                            df.format(_selectedDate!);
                                        registerModel.gender =
                                        selected == Gender.Male
                                            ? "Male"
                                            : "Female";
                                        registerModel.joinFor = "Participants";
                                        registerModel.primaryInetrestId =
                                            dropdownValue1;
                                        registerModel.secondaryInetrestId =
                                            dropdownValue2;
                                        registerModel.thirdInetrestId =
                                        dropdownValue3 == "Select Sport"
                                            ? ""
                                            : dropdownValue3;

                                        print(registerModel.toJson());
                                        _authPresenter
                                            .registerUser(registerModel)
                                            .then((value) {
                                          if (value) {
                                            showCustomSnackBar(
                                                "Register Successfully", context,
                                                isError: false);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DashBoardScreen()));
                                          } else {
                                            showCustomSnackBar(
                                                "Something went wrong", context);
                                          }
                                        });
                                      });
                                    }
                                  }

                                  //Navigator.push(context,MaterialPageRoute(builder: (context) =>InterestScreen()));
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: _isLoading
                                    ? Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.all(2.0),
                                  child: const CircularProgressIndicator(
                                    color: Color(0xff080053),
                                    strokeWidth: 3,
                                  ),
                                ): Container(
                                  width: 346 * fem,
                                  height: 60 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xff080053),
                                    borderRadius: BorderRadius.circular(5 * fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Submit',
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
                            ],
                          ),
                        ),
                      ),
                      /*Container(/////////////////////////////////
                        padding: EdgeInsets.fromLTRB(
                            21 * fem, 23 * fem, 10 * fem, 10 * fem),
                        width: double.infinity,
                        height:
                        AppCommonHelper.isTablet(context) ? 700 : 380 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffd0cbff)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(36 * fem),
                            topRight: Radius.circular(37 * fem),
                            bottomRight: Radius.circular(5 * fem),
                            bottomLeft: Radius.circular(5 * fem),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0 * fem, 4 * fem),
                              blurRadius: 2 * fem,

                            ),
                          ],
                        ),

                      ),*/
                    ],
                  ),
                ))));
    /*return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
                width: double.infinity,
                height: 800 * fem,
                child: Column(
                  children: [
                    SizedBox(
                      width: 341 * fem,
                      height: 70 * fem,
                      child: Image.asset(
                        'assets/page-1/images/registerpage.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    *//*Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      width: 390 * fem,
                      height: 670 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xfcd0cbff)),
                        color: Color(0xfcffffff),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36 * fem),
                          topRight: Radius.circular(37 * fem),
                          bottomRight: Radius.circular(5 * fem),
                          bottomLeft: Radius.circular(5 * fem),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0 * fem, 4 * fem),
                            blurRadius: 2 * fem,
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 209 * fem,
                              height: 24 * fem,
                              child: Text(
                                'Complete Your Profile',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Lato',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w800,
                                  height: 1.2 * ffem / fem,
                                  color: Color(0xff080053),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 258 * fem,
                              height: 36 * fem,
                              child: Text(
                                'Just one Step away from ever world of sport media app & Explore more',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Lato',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: Color(0xff080053),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              // group2nME (14:4)
                              margin: EdgeInsets.fromLTRB(
                                  10 * fem, 0 * fem, 10 * fem, 15 * fem),
                              width: double.infinity,
                              height: 60 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5 * fem),
                              ),
                              child: TextField(
                                autocorrect: true,
                                focusNode: focusNodeUserName,
                                controller: userNameController,
                                decoration: InputDecoration(
                                  hintText: 'User Name',
                                  prefixIcon: Icon(
                                    Icons.person_pin_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 16 * ffem,
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
                                  10 * fem, 0 * fem, 10 * fem, 10 * fem),
                              width: double.infinity,
                              height: 60 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5 * fem),
                              ),
                              child: TextField(
                                autocorrect: true,
                                focusNode: focusNodeFullName,
                                controller: fullNameController,
                                decoration: InputDecoration(
                                  hintText: 'Full Name',
                                  hintStyle: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
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
                                  10 * fem, 0 * fem, 10 * fem, 15 * fem),
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
                                  hintText: 'Email Id',
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 16 * ffem,
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
                                  10 * fem, 0 * fem, 10 * fem, 25 * fem),
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
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.calendar_month,
                                    color: Colors.grey,
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
                            Row(
                              children: [
                                Expanded(
                                    child: GenderWidget(
                                  onclick: () {
                                    selected = Gender.Male;
                                    setState(() {});
                                  },
                                  isSelected: Gender.Male == selected,
                                  title: 'Male',
                                  icon: Icons.male,
                                )),
                                Expanded(
                                    child: GenderWidget(
                                  isSelected: Gender.Female == selected,
                                  onclick: () {
                                    selected = Gender.Female;
                                    setState(() {});
                                  },
                                  title: 'Female',
                                  icon: Icons.female,
                                )),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 60 * fem,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  interestList1.length > 0
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              left: 10, bottom: 10),
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5 * fem),
                                              color: Color(0xfff3f3f3),
                                              border: Border.all(
                                                  color: Color(0x59000000))),
                                          child: DropdownButton<String>(
                                            value: dropdownValue1,
                                            underline: SizedBox(),
                                            items: interestList1
                                                .map((InterestListModel value) {
                                              return DropdownMenuItem<String>(
                                                value: value.id,
                                                child: Text(
                                                  value.name.toString(),
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              );
                                            }).toList(),
                                            // Step 5.
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownValue1 = newValue!;
                                                interestList2.removeWhere(
                                                    (item) =>
                                                        item.id ==
                                                        dropdownValue1);
                                                interestList3.removeWhere(
                                                    (item) =>
                                                        item.id ==
                                                        dropdownValue1);
                                              });
                                            },
                                          ))
                                      : SizedBox(),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  interestList2.length > 0
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              left: 5, bottom: 10),
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5 * fem),
                                              color: Color(0xfff3f3f3),
                                              border: Border.all(
                                                  color: Color(0x59000000))),
                                          child: DropdownButton<String>(
                                            value: dropdownValue2,
                                            underline: SizedBox(),
                                            items: interestList2
                                                .map((InterestListModel value) {
                                              return DropdownMenuItem<String>(
                                                value: value.id,
                                                child: Text(
                                                  value.name.toString(),
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              );
                                            }).toList(),
                                            // Step 5.
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownValue2 = newValue!;
                                                interestList1.removeWhere(
                                                    (item) =>
                                                        item.id ==
                                                        dropdownValue2);
                                                interestList3.removeWhere(
                                                    (item) =>
                                                        item.id ==
                                                        dropdownValue2);
                                              });
                                            },
                                          ))
                                      : SizedBox(),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 60 * fem,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  interestList3.length > 0
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              left: 10, bottom: 10),
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      5 * fem),
                                              color: Color(0xfff3f3f3),
                                              border: Border.all(
                                                  color: Color(0x59000000))),
                                          child: DropdownButton<String>(
                                            value: dropdownValue3,
                                            underline: SizedBox(),
                                            items: interestList3
                                                .map((InterestListModel value) {
                                              return DropdownMenuItem<String>(
                                                value: value.id,
                                                child: Text(
                                                  value.name.toString(),
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              );
                                            }).toList(),
                                            // Step 5.
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownValue3 = newValue!;
                                                interestList1.removeWhere(
                                                    (item) =>
                                                        item.id ==
                                                        dropdownValue3);
                                                interestList2.removeWhere(
                                                    (item) =>
                                                        item.id ==
                                                        dropdownValue3);
                                              });
                                            },
                                          ))
                                      : SizedBox(),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5 * fem),
                                          color: Color(0xfff3f3f3),
                                          border: Border.all(
                                              color: Color(0x59000000))),
                                      child: DropdownButton<String>(
                                        value: dropdownValue4,
                                        underline: SizedBox(),
                                        items: language.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          );
                                        }).toList(),
                                        // Step 5.
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue4 = newValue!;
                                          });
                                        },
                                      )),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {

                                _isLoading ? null : _onSubmit();

                                if (userNameController.text.isEmpty) {
                                  showCustomSnackBar(
                                      "Username Required", context);
                                } else if (fullNameController.text.isEmpty) {
                                  showCustomSnackBar(
                                      "Full Name Required", context);
                                } else if (emailController.text.isEmpty) {
                                  showCustomSnackBar(
                                      "Email id Required", context);
                                } else if (dobController.text.isEmpty) {
                                  showCustomSnackBar("DOB Required", context);
                                } else {
                                  InternetConnectionChecker()
                                      .hasConnection
                                      .then((value) => {
                                            internetConnection = value,
                                          });
                                  if (internetConnection == false) {
                                    showCustomSnackBar(
                                        "no internet connection".tr(), context);
                                  } else {
                                    final df = new DateFormat('yyyy-MM-dd');
                                    AppLocalDataUtil()
                                        .getMobile()
                                        .then((value) {
                                      RegisterModel registerModel =
                                          RegisterModel();
                                      registerModel.emailId =
                                          emailController.text;
                                      registerModel.phoneNumber = value;
                                      registerModel.firstName =
                                          fullNameController.text.toString();
                                      registerModel.lastName =
                                          userNameController.text.toString();
                                      registerModel.dob =
                                          df.format(_selectedDate!);
                                      registerModel.gender =
                                          selected == Gender.Male
                                              ? "Male"
                                              : "Female";
                                      registerModel.joinFor = "Participants";
                                      registerModel.primaryInetrestId =
                                          dropdownValue1;
                                      registerModel.secondaryInetrestId =
                                          dropdownValue2;
                                      registerModel.thirdInetrestId =
                                          dropdownValue3 == "Select Sport"
                                              ? ""
                                              : dropdownValue3;

                                      print(registerModel.toJson());
                                      _authPresenter
                                          .registerUser(registerModel)
                                          .then((value) {
                                        if (value) {
                                          showCustomSnackBar(
                                              "Register Successfully", context,
                                              isError: false);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DashBoardScreen()));
                                        } else {
                                          showCustomSnackBar(
                                              "Something went wrong", context);
                                        }
                                      });
                                    });
                                  }
                                }

                                //Navigator.push(context,MaterialPageRoute(builder: (context) =>InterestScreen()));
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: _isLoading
                                  ? Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(2.0),
                                child: const CircularProgressIndicator(
                                  color: Color(0xff080053),
                                  strokeWidth: 3,
                                ),
                              ): Container(
                                width: 346 * fem,
                                height: 60 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xff080053),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Submit',
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
                          ],
                        ),
                      ),
                    ),*//*
                  ],
                ),
              ),
      ),
    );*/
  }
}
