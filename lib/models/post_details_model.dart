import 'post_list_model.dart';

class PostDetails {
  String ?id;
  String? name;
  String? desc;
  String? status;
  String? ip;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  String? accountId;
  int? ageGroupId;
  String? interestId;
  List<PostImage>? postImage;
  int? likeCount;
  int? commentCount;
  int? shareCount;

  PostDetails(
      {this.id,
        this.name,
        this.desc,
        this.status,
        this.ip,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.accountId,
        this.ageGroupId,
        this.interestId,
        this.postImage,
        this.likeCount,
        this.commentCount,
        this.shareCount});

  PostDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    status = json['status'];
    ip = json['ip'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    accountId = json['accountId'];
    ageGroupId = json['ageGroupId'];
    interestId = json['interestId'];

    if (json['postImage'] != null) {
      postImage = <PostImage>[];
      json['postImage'].forEach((v) {
        postImage!.add(PostImage.fromJson(v));
      });
    }
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    shareCount = json['shareCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['status'] = this.status;
    data['ip'] = this.ip;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['accountId'] = this.accountId;
    data['ageGroupId'] = this.ageGroupId;
    data['interestId'] = this.interestId;

    if (this.postImage != null) {
      data['postImage'] = this.postImage!.map((v) => v.toJson()).toList();
    }
    data['likeCount'] = this.likeCount;
    data['commentCount'] = this.commentCount;
    data['shareCount'] = this.shareCount;
    return data;
  }
}
