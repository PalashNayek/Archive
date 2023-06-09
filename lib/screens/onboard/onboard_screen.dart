import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:s2w/main.dart';
import 'package:s2w/screens/login_screen.dart';
import 'package:s2w/theme/color.dart';

import '../../page-1/main-screen-of-app-starts-.dart';
import '../../utilities/app_local_data_util.dart';
import '../../utils.dart';
import 'slider_model.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoardScreen> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      _controller.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    /*int totalPage = slides.length;
    print("MyTotalPages$totalPage");*/

    /*if (currentIndex == slides.length - 1) {
      AppLocalDataUtil().setOnBoard(true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginScreen()),
      );

    } else {
      _controller.nextPage(
          duration:
          Duration(milliseconds: 2000),
          curve: Curves.bounceIn);
    }*/
    /*Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentIndex ==  3) {
        currentIndex++;
        _controller.animateToPage(
          currentIndex,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        currentIndex = slides.length;
      }
    });*/
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                  if(currentIndex==2){
                    _timer?.cancel();
                  }
                  print("MyIndex->$currentIndex");
                  /*if (currentIndex == slides.length - 1) {
                    AppLocalDataUtil().setOnBoard(true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginScreen()),
                    );

                  } else {
                    _controller.nextPage(
                        duration:
                        Duration(milliseconds: 2000),
                        curve: Curves.bounceIn);
                  }*/
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /*SizedBox(
                              height: 10,
                            ),*/
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              constraints: BoxConstraints(
                                maxWidth: 350,
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
                                slides.elementAt(index).description.toString(),
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
                                    height: 60,
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
                                      child: Text(
                                        currentIndex == slides.length - 1
                                            ? "Lets Start"
                                            : "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                         if (currentIndex == slides.length - 1) {
                                          AppLocalDataUtil().setOnBoard(true);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()),
                                          );

                                        } else {
                                          _controller.nextPage(
                                              duration:
                                                   Duration(seconds: 2000),
                                              curve: Curves.bounceIn);
                                        }
                                      },
                                    ))
                                : SizedBox(
                                    width: 1,
                                  ),
                          ],
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
