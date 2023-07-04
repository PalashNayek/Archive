import 'package:flutter/material.dart';
import 'package:s2w/theme/color.dart';

import '../models/post_list_model.dart';
import '../presenter/post_presenter.dart';
import '../utilities/app_common_helper.dart';
import '../utils.dart';
import 'post_details_screen.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool load = false, load2 = false;
  PostPresenter postPresenter = PostPresenter();
  PostListModel postListModel = PostListModel();
  List<PostModelData> postListData = [];
  List<PostModelData> postList = [];
  int perPage = 10;
  int offset = 0;
  int present = 0;
  String type = "All";

  @override
  void initState() {
    super.initState();

    getPostDat(offset, "",type);
  }

  String getFileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return "";
    }
  }

  void getPostDat(int off, String keyword, String type) {
    postPresenter.getAllPost(keyword, perPage, off, type).then((value) {
      postListModel = value;
      postList.clear();
      postListData.clear();
      postList.addAll(value.result as Iterable<PostModelData>);
      postList.forEach((element) {
        if (element.postImage!.length > 0) {
          if (getFileExtension(
                  element.postImage!.elementAt(0).image.toString()) !=
              "mp4") {
            postListData.add(element);
          }
        }
      });
      //postListData.addAll(value.result as Iterable<PostModelData>);

      load = true;
      setState(() {});
    });
  }

  void getSearchPostData(int off, String keyword) {
    postPresenter.getAllPost(keyword, perPage, off, type).then((value) {
      postListModel = value;
      postList.clear();
      postListData.clear();
      postList.addAll(value.result as Iterable<PostModelData>);
      postList.forEach((element) {
        if (element.postImage!.length > 0) {
          if (getFileExtension(
                  element.postImage!.elementAt(0).image.toString()) !=
              "mp4") {
            postListData.add(element);
          }
        }
      });
      //postListData.addAll(value.result as Iterable<PostModelData>);

      load = true;
      setState(() {});
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
        elevation: 0,
        title: TextField(
          style: TextStyle(color: Colors.white),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              getSearchPostData(offset, value);
            } else {
              getPostDat(offset, value, type);
            }
          },
          onChanged: (value) {
            if (value.isEmpty) {
              getPostDat(offset, "", type);
            }
          },
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            filled: true,
            fillColor: primary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: load
          ? Padding(
              padding: EdgeInsets.all(16.0),
              child: postListData.isNotEmpty ?
              ListView.builder(
                      itemCount: postListData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostDetailsScreen(
                                        postListData.elementAt(index))));

                            // Perform action when an item is tapped
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxHeight: double.infinity,
                                minHeight: 0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: Color(0x99d6d6d6)),
                                color: Color(0xffffffff),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            postListData
                                                .elementAt(index)
                                                .name
                                                .toString(),
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
                                          postListData
                                              .elementAt(index)
                                              .desc
                                              .toString(),
                                          style: SafeGoogleFont(
                                            'Lato',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 2 * ffem / fem,
                                            color: Color(0xff080053),
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Image.network(
                                      height: 250,
                                      width: 300,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.low,
                                      postListData
                                              .elementAt(index)
                                              .postImage!
                                              .isNotEmpty
                                          ? postListData
                                              .elementAt(index)
                                              .postImage!
                                              .elementAt(0)
                                              .image
                                              .toString()
                                          : "",

                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
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
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ),
                          ),
                          ///////////////////////////////////////////done
                        );
                      },
                    )
                  : Center(
                      child: Container(
                      margin: EdgeInsets.fromLTRB(5, 100, 0, 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/page-1/images/serachnotfound.png',
                            fit: BoxFit.cover,
                            height: 150,
                            width: 150,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'No Search Found',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Enter the Correct Word what you want to search',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Lato',
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
