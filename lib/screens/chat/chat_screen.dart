
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:s2w/models/group_list_model.dart';
import 'package:s2w/models/message_list_model.dart';
import 'package:s2w/presenter/chat_presenter.dart';
import 'package:s2w/screens/dashboard/fluid_nav_bar.dart';
import 'package:s2w/screens/group_member_list.dart';
import 'package:s2w/screens/user_list.dart';
import 'package:s2w/socket/socket_manager.dart';
import 'package:s2w/theme/color.dart';
import 'package:s2w/utils/crpto.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../api/api_const.dart';
import '../../models/profile_model.dart';
import '../../presenter/auth_presenter.dart';
import '../../presenter/post_presenter.dart';
import '../../socket/socket_constants.dart';
import '../../utilities/app_local_data_util.dart';
import '../../utils/cryptojs.dart';
import '../other_account.dart';
import 'chat_model.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:socket_io_client/socket_io_client.dart' as IO;
class ChatScreen extends StatefulWidget{

  ChatScreen({required this.groupListModel});
  GroupListModel? groupListModel;
  /*String roomId;
  String image;
  String groupId;*/
  @override
  _chatScreenState createState() => _chatScreenState();
}
class _chatScreenState extends State<ChatScreen>{
  TextEditingController textEditingController= TextEditingController();
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  AuthPresenter authPresenter= AuthPresenter();
  PostPresenter postPresenter= PostPresenter();
  ChatPresenter chatPresenter= ChatPresenter();
  ProfileModel profileModel=ProfileModel();
  List<MessageListModel> messageListModel=[];
  bool load=false, load2=false;
  IO.Socket? socket;
  @override
  void dispose() {
    emit(SocketConstants.leaveRoom, ({
      "roomId": widget.groupListModel!.id.toString(),
    }) );
    authPresenter.getProfile().then((value) {
      profileModel=value;

      AppLocalDataUtil().getToken().then((value) {
        if (socket != null) return;
        socket = IO.io(APIConst.socketUrl,
            OptionBuilder()
                .setTransports(['websocket']) // for Flutter or Dart VM
                .disableAutoConnect()
                .setExtraHeaders({'authorization':"Bearer "+value.toString(),'accountId':profileModel.user!.accountId.toString()})
                .build()
        );

        socket!.onConnect((_) {
          print('Connected');
        });
      });
    });

    // Listen for incoming messages
    socket!.on('message', (data) {
      print(data.toString());
      setState(() {
      //  messages.add(data.toString());
      });
    });
    // TODO: implement dispose
    super.dispose();
  }
  void getData(){

    String message="991b1d852e6b2660f4b318a7e34e9551:0be4aa2a492e69ee50e98dfa4f3a03fb";


    authPresenter.getProfile().then((value) {
      profileModel=value;

     //encryptJS(profileModel.user!.accountId.toString(), "hii").then((value) {
     //  print(value);
     //});

      setState(() {

      });
    });
    chatPresenter.getMessageList(widget.groupListModel!.id.toString()).then((value) {
      messageListModel=value;
      load=true;
      value.forEach((element) {

      });
      setState(() {

      });
    });
  }
  @override
  void initState() {

    // TODO: implement initState
    emit(SocketConstants.joinRoom, ({
      "roomId": widget.groupListModel!.id.toString(),
    }) );
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
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
                  SizedBox(width: 2,),
                  CircleAvatar(
                    backgroundImage: widget.groupListModel!.type=="Private"?NetworkImage(widget.groupListModel!.receiver!.personalDetail!.elementAt(0).profile.toString()): NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
                    maxRadius: 20,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.groupListModel!.type.toString()=="Private"?widget.groupListModel!.receiver!.personalDetail!.elementAt(0).firstName.toString():widget.groupListModel!.groupName.toString(),style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        SizedBox(height: 6,),
                        Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                 GestureDetector(onTapDown: (details){
                   widget.groupListModel!.type.toString()!="Private"? showPopupMenu(context, details):showPopupMenuUser(context, details);
                  }, child:Icon(Icons.settings,color: Colors.black54,)),
                ],
              ),
            ),
          ),
        ),
        body:  Column(children: [
          Expanded(child: Container(
              margin: EdgeInsets.only(bottom: 100),
              child: ListView.builder(
              itemCount: messageListModel.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
               return Container(
              padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
              child: Align(
                alignment: (messageListModel[index].accountId == profileModel.user!.accountId?Alignment.topLeft:Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (messageListModel[index].accountId  == profileModel.user!.accountId?Colors.grey.shade200:third),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(messageListModel[index].content.toString(), style: TextStyle(fontSize: 15),),
                ),
              ),
            );
          },
        ))),
          messageListModel.length==0?   Container(
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(

            ),
            child:Text('Messages are end-to-end Encrypted!',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 12),)
            ):Container(),
            Container(
            height: 60,
            width: double.infinity,
            child:
            Stack(
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
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color:secondary,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(Icons.add, color: Colors.white, size: 20, ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        FloatingActionButton(
                          onPressed: (){
                            emit(SocketConstants.sendMessage, ({
                              "type": "TEXT",
                              "roomId":widget.groupListModel!.id.toString(),
                              "accountId":profileModel.user!.accountId.toString(),
                              "content":textEditingController.text.toString()
                            }));
                            textEditingController.text="";
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
          ]),
    );
  }
  showPopupMenu(BuildContext context,TapDownDetails details){
    showMenu<String>(
      context: context,

      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('Add Member'), value: '1'),
        PopupMenuItem<String>(
            child: const Text('All Member'), value: '2'),
        PopupMenuItem<String>(
            child: const Text('Delete Group'), value: '3'),
      ],
      elevation: 8.0,
    )
        .then<void>((String? itemSelected) {

      if (itemSelected == null) return;

      if(itemSelected == "1"){
        //code here
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserListContent(widget.groupListModel!.id.toString())));

      }else if(itemSelected == "2"){
        //code here
        Navigator.push(context, MaterialPageRoute(builder: (context) => GroupMemberListContent(widget.groupListModel!.id.toString())));

      }else if(itemSelected == "3"){
        //code here
     showAlertDialog(context);

      }

    });
  }
  showPopupMenuUser(BuildContext context,TapDownDetails details){
    showMenu<String>(
      context: context,

      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('Block User'), value: '1'),
        PopupMenuItem<String>(
            child: const Text('Report User'), value: '2'),
        PopupMenuItem<String>(
            child: const Text('Delete Chat'), value: '3'),
        PopupMenuItem<String>(
            child: const Text('View Profile'), value: '4'),
      ],
      elevation: 8.0,
    )
        .then<void>((String? itemSelected) {

      if (itemSelected == null) return;

      if(itemSelected == "1"){
        //code here
        _displayTextInputDialogUserBlock(context);
      }else if(itemSelected == "2"){
        //code here
        _displayTextInputDialogUserReport(context);
      }else if(itemSelected == "3"){
        //code here
        showAlertDialog(context);

      }else if(itemSelected == "4"){
        Navigator.push(context,MaterialPageRoute(builder: (context) =>OtherAccountContent(widget.groupListModel!.receiver!.id.toString())));

      }

    });
  }
  Future<void> _displayTextInputDialogUserReport(BuildContext context) async {
    TextEditingController _textFieldController= new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Report User'),
              content: Container(
                  height: 150,
                  width: 200,
                  child: Column(children: [
                    TextField(
                      onChanged: (value) {
                      },
                      keyboardType: TextInputType.text,
                      controller: _textFieldController,
                      decoration: InputDecoration(hintText: "Enter reason"),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      if(_textFieldController.text.isNotEmpty) {
                        postPresenter.addUserReport(widget.groupListModel!.receiver!.id.toString(),
                            _textFieldController.text.toString()).then((value) {
                         // Fluttertoast.showToast(msg: "User Report Successfully");
                          Navigator.pop(context);
                        });
                      }else{
                       // Fluttertoast.showToast(msg: "Please Enter Reason");
                      }
                    }, child: Text("Submit",))
                  ],))



          );
        });
  }
  Future<void> _displayTextInputDialogUserBlock(BuildContext context) async {
    TextEditingController _textFieldController= new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Block User'),
              content: Container(
                  height: 150,
                  width: 200,
                  child: Column(children: [
                    TextField(
                      onChanged: (value) {

                      },
                      keyboardType: TextInputType.text,
                      controller: _textFieldController,
                      decoration: InputDecoration(hintText: "Enter reason"),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){

                      if(_textFieldController.text.isNotEmpty) {
                        postPresenter.addUserBlock(widget.groupListModel!.receiver!.id.toString(),
                            _textFieldController.text.toString()).then((value) {
                         // Fluttertoast.showToast(msg: "User Block Successfully");
                          Navigator.pop(context);
                        });
                      }else{
                       // Fluttertoast.showToast(msg: "Please Enter Reason");
                      }
                    }, child: Text("Submit",))
                  ],))
          );
        });
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Delete"),
      onPressed:  () {
        chatPresenter.deleteGroup(widget.groupListModel!.id.toString()).then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardScreen()));

        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Group"),
      content: Text("Would you like to delete this group?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}