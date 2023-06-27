import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:s2w/models/follower_list_model.dart';
import 'package:s2w/models/notification_model.dart';
import 'package:s2w/models/post_list_model.dart';
import 'package:s2w/models/post_request_model.dart';
import '../models/auth_model.dart';
import '../models/comment_list_model.dart';
import '../models/comment_response_model.dart';
import '../models/following_list_model.dart';
import '../models/post_details_model.dart';
import '../models/post_response_model.dart';
import '../utilities/api-client.dart';
import '../utilities/app_common_helper.dart';
import '../utilities/app_local_data_util.dart';
import '../utilities/ui-helper.dart';

class PostService extends ApiClient with UiHelper {

  final String _imageUploadUrl = "post-images/";
  final String _verifyOtpUrl = "auth/verify";
  final String _postUrl = "posts";
  final String _commentUrl = "post-comment";
  final String _addLikeUrl = "post-like";
  final String _postBlockUrl = "post-block";
  final String _userBlockUrl = "user-block";
  final String _postReportUrl = "post-report";
  final String _userReportUrl = "user-report";
  final String _setFcmUrl = "/doctors/update-fcm";
  final String _newRegVerifyOtpUrl = "/auth/verify";
  final String _myFollowingUrl="followers/";
  final String _myFollowerUrl="followers/";
  final String _notificationUrl="notifications";

  String _myPostListUrl = "posts/list/my?limit=10&offset=0&keyword=&status=Active";
  String _allPostListUrl = "posts/list/all?status=Active";
  String _otherPostListUrl = "posts/list/user/";

  Future<PostResponse> addPost(PostRequestModel postRequestModel) {
    return postRequest(_postUrl, json.encode(postRequestModel))
        .then((response) async {
      print("updatePost-> $response");
      if (response != null) {
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          PostResponse auth = PostResponse.fromJson(result);
          print(auth);
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


  Future<PostResponse> addLike(String postId,bool like) {
    print(json.encode({"postId":postId,"like":like}));
    return postRequest(_addLikeUrl, json.encode({"postId":postId,"like":like}))
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
  Future<PostResponse> addReport(String postId,String reason) {
    print("postReportParams-> $_postReportUrl");
    return postRequest(_postReportUrl, json.encode({"postId":postId,"reason":reason,"longitude":"123", "latitude":"123"}))
        .then((response) async {

      print("postReport");
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
  Future<bool> deletePost(String postId) {
    return deleteRequest(_postUrl+"/"+postId, "")
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
  Future<PostResponse> addUserReport(String reportUserId,String reason) {
    print("reportUserId->$reportUserId");
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
    print(json.encode({"blockUserId":blockUserId,"reason":reason,"longitude":"123", "latitude":"123"}));
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
    return postRequest(_commentUrl, json.encode({"postId":postId,"comment":message,"longitude":"123", "latitude":"123"}))
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
  Future<bool> deleteComment(String commentId) {
    return deleteRequest(_commentUrl+"/"+commentId, "")
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
  Future<PostDetails> getPostDetails(String postId) {

    return getRequest(_postUrl+"/"+postId, "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        return PostDetails.fromJson(result);
        /* Iterable iterable = result;
        return iterable
            .map((element) => PostListModel.fromJson(element))
            .toList();*/
      } else {
        return PostDetails();
      }
    });
  }
  Future<PostListModel> getMyPost(String keyword) {

    return getRequest(_myPostListUrl+keyword, "",isCompleteUrl: false).then((response) {
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

    return getRequest(_commentUrl+"/"+postId+"?limit=10&offset=0", "",isCompleteUrl: false).then((response) {
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

  Future<PostListModel> getAllPost(String keyword,int limit,int offset) {
    return getRequest(_allPostListUrl+"&limit="+limit.toString()+"&offset="+offset.toString()+"&keyword="+keyword, "",isCompleteUrl: false).then((response) {
      if (response != null) {
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

  //filter post
  Future<PostListModel> getFilterPost(String interestId,int limit,int offset) {
    return getRequest(_allPostListUrl+"&limit="+limit.toString()+"&offset="+offset.toString()+"&interestId="+interestId, "",isCompleteUrl: false).then((response) {
      if (response != null) {
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
    print(_imageUploadUrl);

    return multipartImageUploadPOST(_imageUploadUrl+postId,file).then((response) async {
      print("ImgUploadRes$response");
      return response;
    });
  }



  Future<bool> postVideoUpload(String postId,File file) async {

    return multipartVideoUploadPOST(_imageUploadUrl+postId,file).then((response) async {
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
