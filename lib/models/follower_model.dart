class FollowerModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? accountId;
  String? followingId;
  String? followerId;

  FollowerModel(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.accountId,
        this.followingId,
        this.followerId});

  FollowerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    accountId = json['accountId'];
    followingId = json['followingId'];
    followerId = json['followerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['accountId'] = this.accountId;
    data['followingId'] = this.followingId;
    data['followerId'] = this.followerId;
    return data;
  }
}

