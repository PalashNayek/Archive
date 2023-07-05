import 'account_model.dart';
import 'age_group.dart';

class PostListModel {
  List<PostModelData>? result;
  int? total;

  PostListModel({this.result, this.total});

  PostListModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <PostModelData>[];
      json['result'].forEach((v) {
        result!.add(PostModelData.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class PostModelData {
  String? id;
  String? name;
  String? desc;
  String? createdAt;
  List<PostImage>? postImage;
  AgeGroup? ageGroup;
  Account? account;
  List<PostLike>? postLike;
  int? likeCount;
  int? commentCount;
  int? shareCount;

  PostModelData(
      {this.id,
        this.name,
        this.desc,
        this.createdAt,
        this.postImage,
        this.ageGroup,
        this.account,
        this.postLike,
        this.likeCount,
        this.commentCount,
        this.shareCount});

  PostModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    createdAt = json['createdAt'];
    if (json['postImage'] != null) {
      postImage = <PostImage>[];
      json['postImage'].forEach((v) {
        postImage!.add(new PostImage.fromJson(v));
      });
    }
    ageGroup = json['ageGroup'] != null
        ? new AgeGroup.fromJson(json['ageGroup'])
        : null;
    if (json['postLike'] != null) {
      postLike = <PostLike>[];
      json['postLike'].forEach((v) {
        postLike!.add(new PostLike.fromJson(v));
      });
    }
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    shareCount = json['shareCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['createdAt'] = this.createdAt;
    if (this.postImage != null) {
      data['postImage'] = this.postImage!.map((v) => v.toJson()).toList();
    }
    if (this.ageGroup != null) {
      data['ageGroup'] = this.ageGroup!.toJson();
    }
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    if (this.postLike != null) {
      data['postLike'] = this.postLike!.map((v) => v.toJson()).toList();
    }
    data['likeCount'] = this.likeCount;
    data['commentCount'] = this.commentCount;
    data['shareCount'] = this.shareCount;
    return data;
  }
}

class PostImage {
  String? id;
  String? image;

  PostImage({this.id, this.image});

  PostImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class PostLike {
  String? id;

  PostLike({this.id});


  PostLike.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}





