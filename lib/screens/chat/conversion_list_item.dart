import 'package:flutter/material.dart';
import 'package:s2w/models/group_list_model.dart';

import '../../utilities/app_common_helper.dart';
import 'chat_screen.dart';
import 'chat_user_model.dart';

class ConversationListitem extends StatefulWidget{
   /*String? name;
  String? messageText;
  String? imageUrl;
  String? time;
  bool? isMessageRead;
  String? roomId;*/
  GroupListModel? group;
   ConversationListitem({this.group,/* this.messageText, this.imageUrl, this.time, this.isMessageRead,this.roomId,this.groupId*/});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationListitem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) =>ChatScreen(groupListModel: widget.group,)));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.group!.type=="Private"?widget.group!.receiver!.personalDetail!.elementAt(0).profile.toString():""),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.group!.type.toString()=="Private"?widget.group!.receiver!.personalDetail!.elementAt(0).firstName.toString():widget.group!.groupName.toString(), style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(""/*widget.messageText!*/,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: true?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(AppCommonHelper.timeAgoCustom(widget.group!.createdAt!),style: TextStyle(fontSize: 12,fontWeight: true?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}