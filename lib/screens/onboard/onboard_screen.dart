import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:s2w/main.dart';
import 'package:s2w/screens/login_screen.dart';
import 'package:s2w/screens/register_screen.dart';
import 'package:s2w/theme/color.dart';

import '../../page-1/main-screen-of-app-starts-.dart';
import '../../utilities/app_local_data_util.dart';
import '../../utils.dart';
import '../../widget/custom_snackbar.dart';
import 'slider_model.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoardScreen> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);

  bool internetConnection = true;

  var _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);
    Future.delayed(
      const Duration(seconds: 3),
      () => setState(
        () => _isLoading = false,
      ),
    );

    /*InternetConnectionChecker().hasConnection.then((value) => {
      internetConnection = value,
    });
    if (internetConnection == false) {
      showCustomSnackBar("no internet connection".tr(), context);
    } else {
      */ /*if (currentIndex == slides.length - 1) {
        AppLocalDataUtil().setOnBoard(true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterScreen()), //LoginScreen()
        );
      }*/ /*
    }*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: slides.length,
              itemBuilder: (context, index) {
                // contents of slider
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // image given in slider
                    Expanded(
                        flex: 7,
                        child: Image(
                          width: double.infinity,
                          image: AssetImage(slides.elementAt(index).image!),
                          fit: BoxFit.fill,
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                constraints: BoxConstraints(
                                  maxWidth: 343,
                                ),
                                child: Text(
                                  slides.elementAt(index).header.toString(),
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                constraints: BoxConstraints(
                                  maxWidth: 343,
                                ),
                                child: Text(
                                  slides
                                      .elementAt(index)
                                      .description
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Lato',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    slides.length,
                                    (index) => buildDot(index, context),
                                  ),
                                ),
                              ),
                              currentIndex == slides.length - 1
                                  ? Container(
                                      height: 40,
                                      margin: EdgeInsets.all(10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: TextButton(
                                        child: _isLoading
                                            ? Container(
                                                width: 24,
                                                height: 24,
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child:
                                                    const CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 3,
                                                ),
                                              )
                                            : Text(
                                                currentIndex ==
                                                        slides.length - 1
                                                    ? "Lets Start"
                                                    : "Next",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                        onPressed: () {
                                          _isLoading ? null : _onSubmit();
                                          /*if(_isLoading){
                                            showCustomSnackBar("hahahahahaha".tr(), context);
                                          }*/

                                          InternetConnectionChecker()
                                              .hasConnection
                                              .then((value) => {
                                                    internetConnection = value,
                                                  });
                                          if (internetConnection == false) {
                                            showCustomSnackBar(
                                                "no internet connection".tr(),
                                                context);
                                          } else {
                                            if (currentIndex ==
                                                slides.length - 1) {
                                              AppLocalDataUtil()
                                                  .setOnBoard(true);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()), //LoginScreen()
                                              );
                                            } else {
                                              _controller.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.bounceIn);
                                            }
                                          }
                                        },
                                      ),
                                    )
                                  : SizedBox(
                                      width: 1,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  // container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? mainColor : Colors.grey,
      ),
    );
  }
}
