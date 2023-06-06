import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:s2w/models/follower_list_model.dart';
import 'package:s2w/models/group_list_model.dart';
import 'package:s2w/models/notification_model.dart';
import 'package:s2w/models/post_list_model.dart';
import 'package:s2w/models/post_request_model.dart';
import '../models/auth_model.dart';
import '../models/comment_list_model.dart';
import '../models/comment_response_model.dart';
import '../models/following_list_model.dart';
import '../models/group_member_list.dart';
import '../models/message_list_model.dart';
import '../models/post_response_model.dart';
import '../utilities/api-client.dart';
import '../utilities/app_common_helper.dart';
import '../utilities/app_local_data_util.dart';
import '../utilities/ui-helper.dart';

class ChatService extends ApiClient with UiHelper {

  final String _imageUploadUrl = "post-images/";
  final String _verifyOtpUrl = "auth/verify";
  final String _addPostUrl = "posts";
  final String _removeGroupMemberUrl = "remove-group-member/";
  final String _removeChatUrl = "chat/remove-chat/";
  final String _postBlockUrl = "post-block";
  final String _userBlockUrl = "user-block";
  final String _groupCreateUrl = "chat/group-create";
  final String _userReportUrl = "user-report";
  final String _addGroupMemberUrl = "chat/group-add-member";
  final String _setFcmUrl = "/doctors/update-fcm";
  final String _newRegVerifyOtpUrl = "/auth/verify";
  final String _myFollowingUrl="followers/";
  final String _myFollowerUrl="followers/";
  final String _notificationUrl="notifications";

  String _groupListUrl = "chat/conversations";
  String _messageListUrl = "chat/messages";
  String _allMemberListUrl = "chat/group-members/";
  String _otherPostListUrl = "posts/list/user/";


  Future<PostResponse> createGroup(String name) {
    return postRequest(_groupCreateUrl, json.encode({"name":name}))
        .then((response) async {
      print(response.body);
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          PostResponse auth = PostResponse.fromJson(result);
          return auth;
        } else {
          AppCommonHelper.customToast(result['message'] ?? "");
          return PostResponse();
        }
      } else {
        return PostResponse();
      }
    });
  }
  Future<PostResponse> addUserReport(String reportUserId,String reason) {
    return postRequest(_userReportUrl, json.encode({"reportUserId":reportUserId,"reason":reason,"longitude":"123", "latitude":"123"}))
        .then((response) async {
      print(response.body);
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          PostResponse auth = PostResponse.fromJson(result);
          return auth;
        } else {
          AppCommonHelper.customToast(result['message'] ?? "");
          return PostResponse();
        }
      } else {
        return PostResponse();
      }
    });
  }
  Future<PostResponse> addBlock(String postId,String reason) {
    return postRequest(_postBlockUrl, json.encode({"postId":postId,"reason":reason,"longitude":"123", "latitude":"123"}))
        .then((response) async {
      print(response.body);
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          PostResponse auth = PostResponse.fromJson(result);
          return auth;
        } else {
          AppCommonHelper.customToast(result['message'] ?? "");
          return PostResponse();
        }
      } else {
        return PostResponse();
      }
    });
  }
  Future<PostResponse> addUserBlock(String blockUserId,String reason) {
    return postRequest(_userBlockUrl, json.encode({"blockUserId":blockUserId,"reason":reason,"longitude":"123", "latitude":"123"}))
        .then((response) async {
      print(response.body);
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          PostResponse auth = PostResponse.fromJson(result);
          return auth;
        } else {
          AppCommonHelper.customToast(result['message'] ?? "");
          return PostResponse();
        }
      } else {
        return PostResponse();
      }
    });
  }
  Future<CommentResponseModel> addComment(String message,String postId) {
    return postRequest(_userReportUrl, json.encode({"postId":postId,"comment":message,"longitude":"123", "latitude":"123"}))
        .then((response) async {
      print(response.body);
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          CommentResponseModel auth = CommentResponseModel.fromJson(result);
          return auth;
        } else {
          AppCommonHelper.customToast(result['message'] ?? "");
          return CommentResponseModel();
        }
      } else {
        return CommentResponseModel();
      }
    });
  }
  Future<bool> addGroupMember(String groupId,List<dynamic> ids) {
    return postRequest(_addGroupMemberUrl, json.encode({"groupId":groupId,"ids":ids}))
        .then((response) async {
      print(response.body);
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
         return true;
        } else {
          AppCommonHelper.customToast(result['message'] ?? "");
          return false;
        }
      } else {
        return false;;
      }
    });
  }
  Future<bool> deleteGroup(String groupId) {
    return deleteRequest(_removeChatUrl+""+groupId, "")
        .then((response) async {
      print(response.body);
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==200) {
          return true;
        } else {
          AppCommonHelper.customToast(result['message'] ?? "");
          return false;
        }
      } else {
        return false;
      }
    });
  }
  Future<bool> removeGroupMember(String groupId,String accountId) {
    return deleteRequest(_removeGroupMemberUrl+"/"+groupId, "")
        .then((response) async {
      print(response.body);
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==200) {
            return true;
        } else {
          AppCommonHelper.customToast(result['message'] ?? "");
          return false;
        }
      } else {
        return false;
      }
    });
  }
  Future<List<GroupListModel>> getGroupList(String keyword) {

    return getRequest(_groupListUrl+"?limit=10&offset=0&keyword="+keyword+"&type=Group","",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);

        Iterable iterable = result['result'];
        return iterable
            .map((element) => GroupListModel.fromJson(element))
            .toList();
      } else {
        return [];
      }
    });
  }
  Future<List<MessageListModel>> getMessageList(String roomId) {

    return getRequest(_messageListUrl+"/"+roomId+"?limit=10&offset=0&keyword=","",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);

        Iterable iterable = result['result'];
        return iterable
            .map((element) => MessageListModel.fromJson(element))
            .toList();
      } else {
        return [];
      }
    });
  }
  Future<PostListModel> getOtherPost(String userId,String keyword) {

    return getRequest(_otherPostListUrl+userId+"?limit=10&offset=0&status=Live&keyword="+keyword, "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        return PostListModel.fromJson(result);
        /* Iterable iterable = result;
        return iterable
            .map((element) => PostListModel.fromJson(element))
            .toList();*/
      } else {
        return PostListModel();
      }
    });
  }
  Future<List<CommentListModel>> getComment(String postId) {

    return getRequest(_userReportUrl+"/"+postId+"?limit=10&offset=0", "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
         Iterable iterable = result['result'];
        return iterable
            .map((element) => CommentListModel.fromJson(element))
            .toList();
      } else {
        return [];
      }
    });
  }
  Future<List<FollowingListModel>> getMyFollowing(String url) {

    return getRequest(_myFollowingUrl+url+"?limit=10&offset=0", "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        Iterable iterable = result['result'];
        return iterable
            .map((element) => FollowingListModel.fromJson(element))
            .toList();
      } else {
        return [];
      }
    });
  }
  Future<List<FollowerListModel>> getMyFollower(String url) {

    return getRequest(_myFollowerUrl+url+"?limit=10&offset=0", "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        Iterable iterable = result['result'];
        return iterable
            .map((element) => FollowerListModel.fromJson(element))
            .toList();
      } else {
        return [];
      }
    });
  }

  Future<List<GroupMemberList>> getAllGroupMember(String roomId,String keyword,int limit,int offset) {

    return getRequest(_allMemberListUrl+roomId+"?limit="+limit.toString()+"&offset="+offset.toString()+"&keyword="+keyword, "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
       // return PostListModel.fromJson(result);
        Iterable iterable = result['result'];
        return iterable
            .map((element) => GroupMemberList.fromJson(element))
            .toList();
      } else {
        return [];
      }
    });
  }
  Future<List<NotificationModel>> getNotification() {

    return getRequest(_notificationUrl, "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
         if(result['total']!=0) {
           Iterable iterable = result['result'];

           return iterable
               .map((element) => NotificationModel.fromJson(element))
               .toList();
         }else{
           return [];
         }
      } else {
        return [];
      }
    });
  }
  Future<bool> verifyOtp(String mobileNumber,String otp, BuildContext context) async {
   print( json.encode({
     'loginId':mobileNumber,
     'otp': otp
   }));
    return postLoginRequest(
        _verifyOtpUrl,
        json.encode({
          "loginId":mobileNumber,
          "otp": otp
        })).then((response) async {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          await AppLocalDataUtil().setToken(result['token']);
          return true;
        } else {
          showAlert(context, result['message']);
          return false;
        }
      } else {
        return false;
      }
    });
  }
  Future<bool> postImageUpload(String postId,File file) async {

    return multipartImageUploadPOST(_imageUploadUrl+postId,file).then((response) async {
      return response;
    });
  }
  Future<bool> regVerifyOtp(String mobileNumber,String otp, BuildContext context) async {
    print(_newRegVerifyOtpUrl);
    return postLoginRequest(
        _newRegVerifyOtpUrl,
        json.encode({
          "loginId":mobileNumber,
          "otp": otp
        })).then((response) async {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          await AppLocalDataUtil().setToken(result['token']);
          return true;
        } else {
          showAlert(context, result['message']);
          return false;
        }
      } else {
        return false;
      }
    });
  }

  Future<bool> setFcm(String fcmToken) async {
    print("FCM Token: $fcmToken");
    return postRequest(_setFcmUrl, json.encode({'fcmToken': fcmToken}))
        .then((response) async {
      if (response != null) {
        var result = json.decode(response.body);
        if (!result['hasError']) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    });
  }
}
