import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:s2w/models/follower_model.dart';
import 'package:s2w/models/profile_model.dart';
import 'package:s2w/models/register_post_model.dart';

import '../models/auth_model.dart';
import '../models/block_list_model.dart';
import '../models/following_list_model.dart';
import '../models/other_profile_model.dart';
import '../services/auth_service.dart';

class AuthPresenter {
  AuthService? _authService;

  AuthPresenter() {
    _authService = AuthService();
  }

  Future<AuthInfo> sendOtp(String mobile, BuildContext context) async {
    String onlyMobileNo = mobile.trim().substring(mobile.trim().length - 10);
  //  FirebaseMessaging _fm = FirebaseMessaging.instance;

    return _authService!.sendOtp(mobile,"1234567890", context);
  }

  Future<List<BlockListModel>> getBlockList() async {
    return _authService!.getBlockList();
  }

  Future<bool> unBlockUser(String userId) {
    return _authService!.unBlockUser(userId);
  }

  Future<bool> verifyOtp(String mobileNumber,String otp, BuildContext context) {
    return _authService!.verifyOtp(mobileNumber,otp.trim(),context);
  }

  Future<bool> registerUser(RegisterModel registerModel) {
    return _authService!.registerUser(registerModel);
  }

  Future<bool> updateUser(String userId,RegisterModel registerModel) {
    return _authService!.updateUser(userId,registerModel);
  }

  Future<ProfileModel> getProfile() {
    return _authService!.getProfile();
  }

  Future<OtherProfileModel> getOtherProfile(String id) {
    return _authService!.getOtherProfile(id);
  }

  Future<FollowerModel> follow(String id) {
    return _authService!.follow(id);
  }

  Future<bool> unFollow(String id) {
    return _authService!.unFollow(id);
  }

  Future<bool> checkProfile() {
    return _authService!.checkProfile();
  }

  Future<bool> putImageUpload(File image) async {
    return _authService!.putImageUpload(image);
  }

  Future<bool> putCoverImageUpload(File image) async {
    return _authService!.putCoverImageUpload(image);
  }

  /*Future<bool> regVerifyOtp(String mobileNumber,String otp, BuildContext context) {
    return _authService.regVerifyOtp(mobileNumber ,otp.trim(), context);
  }

  Future<bool> setFcm() async {
    FirebaseMessaging _fm = FirebaseMessaging.instance;
    return _authService.setFcm(await _fm.getToken());
  }*/
}
