import 'package:flutter/material.dart';
import 'package:s2w/theme/color.dart';

import '../models/post_list_model.dart';
import '../presenter/post_presenter.dart';
import '../utils.dart';
import 'post_details_screen.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {

  bool load=false,load2=false;
  PostPresenter postPresenter= PostPresenter();
  PostListModel postListModel=new PostListModel();
  List<PostModelData> postListData=[];
  List<PostModelData> postList=[];
  int perPage  = 10;
  int offset=0;
  int present = 0;
  @override
  void initState() {
    super.initState();

    getPostDat(offset,"");
  }
  String getFileExtension(String fileName) {
    try {
      return  fileName.split('.').last;
    } catch(e){
      return "";
    }
  }
  void getPostDat(int off,String keyword){
    postPresenter.getAllPost(keyword,perPage,off).then((value) {
      postListModel=value;
      postList.clear();
      postListData.clear();
      postList.addAll(value.result as Iterable<PostModelData>);
      postList.forEach((element) {
        if(element.postImage!.length>0) {
          if(getFileExtension(element.postImage!.elementAt(0).image.toString())!="mp4") {
            postListData.add(element);
          }
        }
      });
      //postListData.addAll(value.result as Iterable<PostModelData>);

      load=true;
      setState(() {

      });
    });
  }
  void getSearchPostData(int off,String keyword){
    postPresenter.getAllPost(keyword,perPage,off).then((value) {
      postListModel=value;
      postList.clear();
      postListData.clear();
      postList.addAll(value.result as Iterable<PostModelData>);
      postList.forEach((element) {
        if(element.postImage!.length>0) {
          if(getFileExtension(element.postImage!.elementAt(0).image.toString())!="mp4") {
            postListData.add(element);
          }
        }
      });
      //postListData.addAll(value.result as Iterable<PostModelData>);

      load=true;
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:primary,
        elevation: 0,
        title: TextField(
          style: TextStyle(color: Colors.white),
          onSubmitted: (value){
            if(value.isNotEmpty) {
              getSearchPostData(offset, value);
            }else{
              getPostDat(offset, value);
            }
          },
          onChanged: (value){
            if(value.isEmpty) {
              getPostDat(offset, "");
            }
          },
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(Icons.search,color: Colors.white,),
            filled: true,
            fillColor: primary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: load? Padding(
        padding: EdgeInsets.all(16.0),
        child:postListData.length>0 ?GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: postListData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>PostDetailsScreen(postListData.elementAt(index))));

                // Perform action when an item is tapped
              },
              child: Card(child: Column(
                children: [
                  SizedBox(height: 5,),
                  Image.network(
              postListData.elementAt(index).postImage!.length>0?  postListData.elementAt(index).postImage!.elementAt(0).image.toString():"",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    postListData.elementAt(index).name.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )

                ],
              )),
            );
          },
        ):Center(child: Container(
         margin: EdgeInsets.fromLTRB(5, 100, 0, 11),
         child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/page-1/images/serachnotfound.png',
          fit: BoxFit.cover,
          height: 150,
          width: 150,
        ),
        SizedBox(height: 20,),
        Text(
          'No Search Found',
          textAlign: TextAlign.center,
          style: SafeGoogleFont (
            'Lato',
            fontSize: 20,
            fontWeight: FontWeight.w800,
            height: 1.2,
            color: Colors.grey,
          ),
        ),SizedBox(height: 20,),
          Text(
            'Enter the Correct Word what you want to search',
            textAlign: TextAlign.center,
            style: SafeGoogleFont (
              'Lato',
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Colors.grey,
            ),
          ),
      ],),

    )),
      ):Center(child:CircularProgressIndicator()),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}