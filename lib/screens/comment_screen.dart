
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s2w/models/comment_list_model.dart';
import 'package:s2w/theme/color.dart';

import '../models/post_list_model.dart';
import '../models/profile_model.dart';
import '../presenter/auth_presenter.dart';
import '../presenter/post_presenter.dart';
import '../utilities/app_common_helper.dart';
import '../widget/custom_snackbar.dart';
import 'chat/chat_model.dart';

class CommentScreen extends StatefulWidget{
  CommentScreen(this.post);
  PostModelData post;
  @override
  _commentScreenState createState() => _commentScreenState();
}
class _commentScreenState extends State<CommentScreen>{
  AuthPresenter authPresenter= AuthPresenter();
  PostPresenter postPresenter= PostPresenter();
  ProfileModel profileModel=ProfileModel();
  TextEditingController messageTextController= new TextEditingController();
  bool load=false, load2=false;
  List<CommentListModel> postListModel=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  void getData(){
    authPresenter.getProfile().then((value) {
      profileModel=value;
      load=true;
      setState(() {

      });
    });
   getComment();
  }
  void getComment(){
    postPresenter.getComment(widget.post.id.toString()).then((value) {
      postListModel=value;
      load2=true;
      setState(() {

      });
    });
  }
  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(

          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 CircularProgressIndicator(),
                 SizedBox(width: 10,),
                 Text("Loading..."),
            ],
          )),
        );
      },
    );
     Future.delayed( Duration(seconds: 1), () {
      Navigator.pop(context); //pop dialog
      getData();
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.post.name.toString(),style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        SizedBox(height: 6,),
                        Text(widget.post.account!.personalDetail!.elementAt(0).firstName.toString(),style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                 GestureDetector(child: Icon(Icons.refresh,color: Colors.black54,),onTap: (){

                   _onLoading();

                 },),
                ],
              ),
            ),
          ),
        ),
        body: Column(children: [
            Expanded(child: Container(
                margin: EdgeInsets.only(bottom: 100),
                child:load2? postListModel.length>0? ListView.builder(
                  itemCount: postListModel.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 5,bottom: 5),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200
                          ),
                          padding: EdgeInsets.all(10),
                          child:Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                          children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(postListModel.elementAt(index).account!.personalDetail!.elementAt(0).profile.toString()), 
                            maxRadius: 20,
                          ),
                           SizedBox(width: 12,),
                           Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, 
                              mainAxisAlignment: MainAxisAlignment.center, 
                              children: <Widget>[
                             Text(postListModel.elementAt(index).comment.toString(),
                            style: TextStyle(fontSize: 16),),
                            SizedBox(height: 6,),
                            Text(AppCommonHelper.timeAgoCustom(postListModel.elementAt(index).createdAt.toString()),style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                            ),
                           ),
                            postListModel.elementAt(index).account!.id==widget.post.account!.id?IconButton(onPressed: (){
                       
                              showAlert(index);
                             }, icon: Icon(Icons.delete,color: Colors.red,)):Container(),
                          ],
                          ),
                         ),
                        ),
                      ),
                    );
                  },
                ):Center(child: Text('No Data Available'),):Center(child:CircularProgressIndicator()))),
            Container(
                height: 60,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                        height: 60,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                              },
                              child:load?profileModel.user!.profile!=null?
                              CircleAvatar(
                              backgroundImage:NetworkImage(profileModel.user!.profile.toString()),
                              maxRadius: 20,
                              ): CircleAvatar(
                                backgroundImage:AssetImage("assets/page-1/images/user.png"),
                                maxRadius: 20,
                                ): CircleAvatar(
                                backgroundImage:AssetImage("assets/page-1/images/user.png"),
                                maxRadius: 20,
                                )
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: TextField(
                                controller: messageTextController,
                                decoration: InputDecoration(
                                    hintText: "Write comment...",
                                    hintStyle: TextStyle(color: Colors.black54),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            FloatingActionButton(
                              onPressed: (){
                                if(messageTextController.text.isEmpty){
                                  showCustomSnackBar("Comment is Empty",context,isError:false);
                                }
                                else {
                                  postPresenter.addComment(widget.post.id.toString(),messageTextController.text.toString()).then((value){
                                    getComment();
                                    showCustomSnackBar( "Comment sent Successfully",context,isError:false);
                                    messageTextController.text="";
                                    setState(() {
                                    });
                                  });
                                }
                              },
                              child: Icon(Icons.send,color: Colors.white,size: 18,),
                              backgroundColor:secondary,
                              elevation: 0,
                            ),
                          ],

                        ),
                      ),
                    ),
                  ],
                )),
          ],)

    );
  }
  showAlert(int i){
    showDialog(context: context, builder: (_) =>
        AlertDialog(
          title: const Text("Delete Alert!"),
          content: Text("Are you sure want to delete Comment?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Yes"),
              onPressed: () async {
                Navigator.of(context).pop();
                postPresenter.deleteComment(postListModel.elementAt(i).id.toString()).then((value) {
                  showCustomSnackBar( "Comment Deleted Successfully",context);
               getComment();
                });
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}