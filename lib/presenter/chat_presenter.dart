import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:s2w/models/follower_list_model.dart';
import 'package:s2w/models/following_list_model.dart';
import 'package:s2w/models/group_list_model.dart';
import 'package:s2w/models/message_list_model.dart';
import 'package:s2w/models/post_list_model.dart';
import 'package:s2w/models/post_request_model.dart';
import 'package:s2w/services/post_service.dart';

import '../models/auth_model.dart';
import '../models/comment_list_model.dart';
import '../models/comment_response_model.dart';
import '../models/group_member_list.dart';
import '../models/notification_model.dart';
import '../models/post_response_model.dart';
import '../services/auth_service.dart';
import '../services/chat_service.dart';

class ChatPresenter {
  ChatService? _postService;

  ChatPresenter() {
    _postService = ChatService();
  }
  Future<List<GroupListModel>> getGroupList() {
    return _postService!.getGroupList("");
  }
  Future<List<MessageListModel>> getMessageList(String roomId) {
    return _postService!.getMessageList(roomId);
  }
  Future<PostListModel> getOtherPost(String userId) {
    return _postService!.getOtherPost(userId,"");
  }
  Future<List<GroupMemberList>> getAllGroupMember(String roomId,int limit,int offset) {
    return _postService!.getAllGroupMember(roomId,"",limit,offset);
  }
  Future<List<NotificationModel>> getNotification() {
    return _postService!.getNotification();
  }
  Future<PostResponse> createGroup(String name) async {
    return _postService!.createGroup(name);
  }
  Future<bool> addGroupMember(String groupId,List<dynamic> userIds) async {
    return _postService!.addGroupMember(groupId,userIds);
  }
  Future<bool> deleteGroup(String groupId) async {
    return _postService!.deleteGroup(groupId);
  }
  Future<bool> removeGroupMember(String userId,String groupId) async {
    return _postService!.removeGroupMember(userId,groupId);
  }

  Future<PostResponse> addBlock(String postId,String reason) async {
    return _postService!.addBlock(postId,reason);
  }
  Future<PostResponse> addUserBlock(String userId,String reason) async {
    return _postService!.addUserBlock(userId,reason);
  }
  Future<PostResponse> addUserReport(String userId,String reason) async {
    return _postService!.addUserReport(userId,reason);
  }
  Future<List<CommentListModel>> getComment(String postId) async {
    return _postService!.getComment(postId);
  }
  Future<List<FollowerListModel>> getMyFollower() async {
    return _postService!.getMyFollower("my/follower");
  }
  Future<List<FollowerListModel>> getUserFollower(String userId) async {
    return _postService!.getMyFollower("follower/"+userId);
  }
  Future<List<FollowingListModel>> getUserFollowing(String userId) async {
    return _postService!.getMyFollowing("following/"+userId);
  }
  Future<List<FollowingListModel>> getMyFollowing() async {
    return _postService!.getMyFollowing("my/following");
  }
  Future<bool> postImageUpload(String  postId,File image) async {
    return _postService!.postImageUpload(postId,image);
  }
  Future<bool> verifyOtp(String mobileNumber,String otp, BuildContext context) {
    return _postService!.verifyOtp(mobileNumber,otp.trim(),context);
  }
}
