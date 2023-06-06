import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:s2w/models/group_list_model.dart';
import 'package:s2w/presenter/chat_presenter.dart';
import 'package:s2w/screens/chat/conversion_list_item.dart';

import '../../utils.dart';
import '../../widget/custom_snackbar.dart';
import 'chat_user_model.dart';

class ConversationList extends StatefulWidget{
   @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  ChatPresenter chatPresenter= ChatPresenter();
  List<GroupListModel>  groupListModel=[];

  @override
  void initState() {
    super.initState();


    getConversationList();
  }
  getConversationList(){
    chatPresenter.getGroupList().then((value) {
      groupListModel=value;
      setState(() {

      });
    });
  }
  Future<void> _displayTextInputDialogReport(BuildContext context) async {
    TextEditingController _textFieldController= new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Create Group'),
              content: Container(
                  height: 150,
                  width: 200,
                  child: Column(children: [
                    TextField(
                      onChanged: (value) {

                      },
                      maxLength: 15,
                      keyboardType: TextInputType.text,
                      controller: _textFieldController,
                      decoration: InputDecoration(hintText: "Enter Group Name"),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      if(_textFieldController.text.isNotEmpty) {
                        chatPresenter.createGroup(_textFieldController.text.toString()).then((value) {
                          showCustomSnackBar( "Group Created Successfully",context,isError:false);
                          Navigator.pop(context);
                          getConversationList();
                        });
                      }else{
                        showCustomSnackBar("Please Enter Group Name",context,isError:false);
                      }
                    }, child: Text("Submit",))
                  ],))



          );
        });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
     elevation: 0,
     automaticallyImplyLeading: false,
     backgroundColor: Colors.white,
     flexibleSpace: SafeArea(
       child:  Container(
         padding: EdgeInsets.only(left: 16,right: 16,top: 10),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text("Conversations",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            GestureDetector(child: Container(
               padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
               height: 30,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.pink[50],
               ),
               child: Row(
                 children: <Widget>[
                   Icon(Icons.add,color: Colors.pink,size: 20,),
                   SizedBox(width: 2,),
                   Text("Create Group",style: TextStyle(fontSize: 12),),
                 ],
               ),
             ),onTap: (){
              _displayTextInputDialogReport(context);
            },
            )
           ],
         ),
       ),
     ),
   ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
          groupListModel.length>0?   ListView.builder(
              itemCount: groupListModel.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 70),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationListitem(
                  group: groupListModel.elementAt(index),
                );
              },
            ):Center(child: Container(
            margin: EdgeInsets.fromLTRB(5, 100, 0, 11),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/page-1/images/nonotification.png',
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
              SizedBox(height: 20,),
              Text(
                'Group Not Found',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
              ),SizedBox(height: 20,),
              Text(
                'Please Create Group & join/ads more People who you want to add in this group',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Lato',
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 100,),
              Text(
                'We are on Testing Mode!',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Lato',
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ],),

          )),

          ],
        ),
      ),
    );
  }
}