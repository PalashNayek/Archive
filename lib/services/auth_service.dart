import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:s2w/models/profile_model.dart';
import 'package:s2w/models/register_post_model.dart';
import 'package:s2w/widget/custom_snackbar.dart';
import '../models/auth_model.dart';
import '../models/block_list_model.dart';
import '../models/follower_model.dart';
import '../models/following_list_model.dart';
import '../models/other_profile_model.dart';
import '../utilities/api-client.dart';
import '../utilities/app_common_helper.dart';
import '../utilities/app_local_data_util.dart';
import '../utilities/ui-helper.dart';

class AuthService extends ApiClient with UiHelper {

  final String _sendOtpUrl = "auth/mobile/login";
  final String _verifyOtpUrl = "auth/verify";
  final String _profileUrl = "personal-details/profile";
  final String _coverUrl = "personal-details/cover";
  final String _registerUrl = "personal-details";
  final String _followerUrl = "followers";
  final String _unfollowUrl = "followers/unfollow/";
  final String _blockUrl  ="user-block/";

  Future<AuthInfo> sendOtp(String mobileNumber,String deviceId, BuildContext context) {
   print(json.encode({"loginId": mobileNumber,"deviceId":deviceId,"longitude":"123",
     "latitude":"123",}));
    return postLoginRequest(_sendOtpUrl, json.encode({"loginId": mobileNumber,"deviceId":deviceId,"longitude":"123",
      "latitude":"123",}))
        .then((response) async {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          AuthInfo auth = AuthInfo.fromJson(result);
         return auth;
        } else {
          AppCommonHelper.customToast(result['message'] ?? "");
          return AuthInfo();
        }
      } else {
        return AuthInfo();
      }
    });
  }

  Future<bool> putImageUpload(File file) async {
    return multipartImageUpload(_profileUrl,file).then((response) async {
      return response;
    });
  }

  Future<bool> putCoverImageUpload(File file) async {
    return multipartImageUpload(_coverUrl,file).then((response) async {
      return response;
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
          "otp": otp,
          "longitude":"123",
          "latitude":"123",
        })).then((response) async {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          await AppLocalDataUtil().setToken(result['token']);
          await AppLocalDataUtil().setMobile(mobileNumber);
          return true;
        } else {
          showCustomSnackBar( result['message'],context,);
          return false;
        }
      } else {
        return false;
      }
    });
  }

  Future<List<BlockListModel>> getBlockList() {
    return getRequest(_blockUrl+"blocked-list?limit=10&offset=0", "",isCompleteUrl: false).then((response) {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        Iterable iterable = result['result'];
        return iterable
            .map((element) => BlockListModel.fromJson(element))
            .toList();
      } else {
        return [];
      }
    });
  }

  Future<bool> registerUser(RegisterModel registerModel) async {
    return postRequest(
        _registerUrl,jsonEncode(registerModel)).then((response) async {

      if (response != null) {

        print(response.body);
        var result = json.decode(response.body);
        //print("hi Palash $result");
        if (response.statusCode==201) {
           return true;
        } else {
          //showAlert(context, result['message']);
          return false;
        }
      } else {
        return false;
      }
    });
  }

  Future<bool> unBlockUser(String userId) async {
    return deleteRequest(_blockUrl+userId,"").then((response) async {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==200) {
          return true;
        } else {
          //showAlert(context, result['message']);
          return false;
        }
      } else {
        return false;
      }
    });
  }

  Future<bool> updateUser(String userId, RegisterModel registerModel) async {
    return patchRequest(
        _registerUrl+"/"+userId,jsonEncode(registerModel)).then((response) async {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==200) {
          return true;
        } else {
          //showAlert(context, result['message']);
          return false;
        }
      } else {
        return false;
      }
    });
  }

  Future<bool> unFollow(String id) async {
    print(_unfollowUrl);
    return deleteRequest(_unfollowUrl+id,"").then((response) async {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==200) {
         return true;
        } else {
          return  false;
        }
      } else {
        return false;
      }
    });
  }

  Future<FollowerModel> follow(String id) async {
    print(_followerUrl);
    return postRequest(_followerUrl,jsonEncode({"followingId":id})).then((response) async {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==201) {
          FollowerModel profileModel = FollowerModel.fromJson(result);
          return profileModel;
        } else {
          return  FollowerModel();
        }
      } else {
        return FollowerModel();
      }
    });
  }

  Future<OtherProfileModel> getOtherProfile(String id) async {
    print(_profileUrl);
    return getRequest(_profileUrl+"/"+id,"",isCompleteUrl: true).then((response) async {
      if (response != null) {
        print(response.body);
        var result = json.decode(response.body);
        if (response.statusCode==200) {
          OtherProfileModel profileModel = OtherProfileModel.fromJson(result);
          return profileModel;
        } else {
          return  OtherProfileModel();
        }
      } else {
        return OtherProfileModel();
      }
    });
  }

  Future<ProfileModel> getProfile() async {
    print(_profileUrl);
    return getRequest(_profileUrl,"",isCompleteUrl: true).then((response) async {
      if (response != null) {

        var result = json.decode(response.body);
        print("palashProfile->$result");
        if (response.statusCode==200) {
          ProfileModel profileModel = ProfileModel.fromJson(result);
          return profileModel;
        } else {
        return  ProfileModel();
        }
      } else {
        return ProfileModel();
      }
    });
  }

  Future<bool> checkProfile() async {
    print(_profileUrl);
    return getRequest(_profileUrl,"",isCompleteUrl: true).then((response) async {
      print("jbndjdfg");
      if (response != null) {
        if (response.statusCode==200) {
          return true;
        } else {
          return  false;
        }
      } else {
        return false;
      }
    });
  }

 /* Future<bool> regVerifyOtp(String mobileNumber,String otp, BuildContext context) async {
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
  }*/
}
