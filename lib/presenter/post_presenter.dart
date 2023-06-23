import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:s2w/models/follower_list_model.dart';
import 'package:s2w/models/following_list_model.dart';
import 'package:s2w/models/post_list_model.dart';
import 'package:s2w/models/post_request_model.dart';
import 'package:s2w/services/post_service.dart';

import '../models/auth_model.dart';
import '../models/comment_list_model.dart';
import '../models/comment_response_model.dart';
import '../models/notification_model.dart';
import '../models/post_details_model.dart';
import '../models/post_response_model.dart';
import '../services/auth_service.dart';

class PostPresenter {
  PostService? _postService;

  PostPresenter() {
    _postService = PostService();
  }
  Future<PostListModel> getMyPost() {
    return _postService!.getMyPost("");
  }
  Future<PostDetails> getPostDetails(String postId) {
    return _postService!.getPostDetails(postId);
  }
  Future<PostListModel> getOtherPost(String userId) {
    return _postService!.getOtherPost(userId,"");
  }
  Future<PostListModel> getAllPost(String keyword,int limit,int offset) {
    return _postService!.getAllPost(keyword,limit,offset);
  }

  //get filter ........
  Future<PostListModel> getFilterPost(String interestId,int limit,int offset) {
    return _postService!.getFilterPost(interestId,limit,offset);
  }

  Future<List<NotificationModel>> getNotification() {
    return _postService!.getNotification();
  }
  Future<PostResponse> addPost(PostRequestModel postRequestModel) async {
    return _postService!.addPost(postRequestModel);
  }
  Future<PostResponse> updatePost(PostRequestModel postRequestModel) async {
    return _postService!.addPost(postRequestModel);
  }
  Future<CommentResponseModel> addComment(String postId,String message) async {
    return _postService!.addComment(message,postId);
  }
  Future<bool> deleteComment(String commentId) async {
    return _postService!.deleteComment(commentId);
  }
  Future<PostResponse> addLike(String postId,bool like) async {
    return _postService!.addLike(postId,like);
  }
  Future<PostResponse> addReport(String postId,String reason) async {
    return _postService!.addReport(postId,reason);
  }
  Future<bool> deletePost(String postId) async {
    return _postService!.deletePost(postId);
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
  Future<bool> postVideoUpload(String  postId,File image) async {
    return _postService!.postVideoUpload(postId,image);
  }
  Future<bool> verifyOtp(String mobileNumber,String otp, BuildContext context) {
    return _postService!.verifyOtp(mobileNumber,otp.trim(),context);
  }
}
