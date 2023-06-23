import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../models/post_list_model.dart';
import '../models/profile_model.dart';
import '../presenter/auth_presenter.dart';
import '../presenter/post_presenter.dart';
import '../theme/color.dart';
import '../utils.dart';
import '../widget/my_post_widget.dart';
import '../widget/post_widget.dart';

class FilterIntestScreen extends StatefulWidget {
  final String interest_name;
  final String interest_id;

  const FilterIntestScreen({Key? key, required this.interest_name, required this.interest_id}) : super(key: key);


  @override
  State<FilterIntestScreen> createState() => _FilterIntestScreenState();
}

class _FilterIntestScreenState extends State<FilterIntestScreen> {

  PostPresenter postPresenter = PostPresenter();
  PostListModel postListModel = PostListModel();
  List<PostModelData> postListData = [];
  AuthPresenter authPresenter = AuthPresenter();

  bool cirLoader = false;
  int perPage = 50; //default- perPage = 10;
  int offset = 0; //default- offset = 0;
  int present = 0;

  int totalPostLength = 0;
  bool isLoaded = false;
  bool moreLoadPostCircleProgressbar = false;
  ProfileModel profileModel = ProfileModel();
  int? myCount;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3000), () {
      isLoaded = true;
    });
    getPostDat(offset);
  }

  void getPostDat(int off) {
    authPresenter.getProfile().then((value) {
      profileModel = value;
      setState(() {
        if (profileModel.user!.firstName != null) {
          //loader = false;
        }
        myCount = profileModel.user!.account?.postCount!;
      });
    });

    postPresenter.getFilterPost(widget.interest_id, perPage, off).then((value) {
      postListModel = value;
      postListData.addAll(value.result as Iterable<PostModelData>);
      totalPostLength = postListData.length.toInt();
      print("filterPostTotal->$totalPostLength");
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          widget.interest_name.tr(),
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isLoaded
                        ? totalPostLength == 0
                        ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Text(
                            'No post available',
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 15.2 * ffem / fem,
                              color: Color(0xff404040),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )) : ListView.builder(
                      itemCount: postListModel.result!.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return MyPostWidgetItem(
                            postListModel.result!.elementAt(i),
                            profileModel.user!.accountId.toString());
                      },
                    )
                        : getShimmerLoading()
                  ],
                ),
              ),
            ),
          )),
    );
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
