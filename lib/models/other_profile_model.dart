class OtherProfileModel {
  User? user;
  int? follower;
  int? following;

  OtherProfileModel({this.user, this.follower, this.following});

  OtherProfileModel.fromJson(Map<String, dynamic> json) {
    try {
      user = json['user'] != null ? User.fromJson(json['user']) : null;
      follower = json['follower'];
      following = json['following'];
    } on Exception catch (e) {
         print("Error->$e");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['follower'] = this.follower;
    data['following'] = this.following;
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? emailId;
  String? phoneNumber;
  String? address;
  String? streetAddress1;
  String? streetAddress2;
  String? city;
  String? state;
  String? pincode;
  String? country;
  String? profile;
  String? profileName;
  String? cover;
  String? coverName;
  String? gender;
  String? joinFor;
  String? dob;
  String? desc;
  String? createdAt;
  String? updatedAt;
  String? accountId;
  String? primaryInetrestId;
  String? secondaryInetrestId;
  String? thirdInetrestId;
  int? ageGroupId;
  Account? account;
  PrimaryInetrest? primaryInetrest;
  PrimaryInetrest? secondaryInetrest;
  PrimaryInetrest? thirdInetrest;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.emailId,
        this.phoneNumber,
        this.address,
        this.streetAddress1,
        this.streetAddress2,
        this.city,
        this.state,
        this.pincode,
        this.country,
        this.profile,
        this.profileName,
        this.cover,
        this.coverName,
        this.gender,
        this.joinFor,
        this.dob,
        this.desc,
        this.createdAt,
        this.updatedAt,
        this.accountId,
        this.primaryInetrestId,
        this.secondaryInetrestId,
        this.thirdInetrestId,
        this.ageGroupId,
        this.account,
        this.primaryInetrest,
        this.secondaryInetrest,
        this.thirdInetrest});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailId = json['emailId'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    streetAddress1 = json['streetAddress1'];
    streetAddress2 = json['streetAddress2'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    country = json['country'];
    profile = json['profile'];
    profileName = json['profileName'];
    cover = json['cover'];
    coverName = json['coverName'];
    gender = json['gender'];
    joinFor = json['joinFor'];
    dob = json['dob'];
    desc = json['desc'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    accountId = json['accountId'];
    primaryInetrestId = json['primaryInetrestId'];
    secondaryInetrestId = json['secondaryInetrestId'];
    thirdInetrestId = json['thirdInetrestId'];
    ageGroupId = json['ageGroupId'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
    primaryInetrest = json['primaryInetrest'] != null
        ? new PrimaryInetrest.fromJson(json['primaryInetrest'])
        : null;
    secondaryInetrest = json['secondaryInetrest'] != null
        ? new PrimaryInetrest.fromJson(json['secondaryInetrest'])
        : null;
    thirdInetrest = json['thirdInetrest'] != null
        ? new PrimaryInetrest.fromJson(json['thirdInetrest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailId'] = this.emailId;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['streetAddress1'] = this.streetAddress1;
    data['streetAddress2'] = this.streetAddress2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['country'] = this.country;
    data['profile'] = this.profile;
    data['profileName'] = this.profileName;
    data['cover'] = this.cover;
    data['coverName'] = this.coverName;
    data['gender'] = this.gender;
    data['joinFor'] = this.joinFor;
    data['dob'] = this.dob;
    data['desc'] = this.desc;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['accountId'] = this.accountId;
    data['primaryInetrestId'] = this.primaryInetrestId;
    data['secondaryInetrestId'] = this.secondaryInetrestId;
    data['thirdInetrestId'] = this.thirdInetrestId;
    data['ageGroupId'] = this.ageGroupId;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    if (this.primaryInetrest != null) {
      data['primaryInetrest'] = this.primaryInetrest!.toJson();
    }
    if (this.secondaryInetrest != null) {
      data['secondaryInetrest'] = this.secondaryInetrest!.toJson();
    }
    if (this.thirdInetrest != null) {
      data['thirdInetrest'] = this.thirdInetrest!.toJson();
    }
    return data;
  }
}

class Account {
  String? id;
  String? phoneNumber;
  String? deviceId;
  String? activeAt;
  String? lastStatus;
  String? createdBy;
  String? roles;
  String? status;
  String? ip;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  List<UserFollow>? userFollow;
  int ?postCount;

  Account(
      {this.id,
        this.phoneNumber,
        this.deviceId,
        this.activeAt,
        this.lastStatus,
        this.createdBy,
        this.roles,
        this.status,
        this.ip,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.userFollow,
        this.postCount});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    deviceId = json['deviceId'];
    activeAt = json['activeAt'];
    lastStatus = json['lastStatus'];
    createdBy = json['createdBy'];
    roles = json['roles'];
    status = json['status'];
    ip = json['ip'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['userFollow'] != null) {
      userFollow = <UserFollow>[];
      json['userFollow'].forEach((v) {
        userFollow!.add(new UserFollow.fromJson(v));
      });
    }

    postCount = json['postCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phoneNumber'] = this.phoneNumber;
    data['deviceId'] = this.deviceId;
    data['activeAt'] = this.activeAt;
    data['lastStatus'] = this.lastStatus;
    data['createdBy'] = this.createdBy;
    data['roles'] = this.roles;
    data['status'] = this.status;
    data['ip'] = this.ip;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.userFollow != null) {
      data['userFollow'] = this.userFollow!.map((v) => v.toJson()).toList();
    }

    data['postCount'] = this.postCount;
    return data;
  }
}

class UserFollow {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? accountId;
  String? followingId;
  String? followerId;

  UserFollow(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.accountId,
        this.followingId,
        this.followerId});

  UserFollow.fromJson(Map<String, dynamic> json) {
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

class PrimaryInetrest {
  String? id;
  String? name;
  String? image;
  String? imageName;
  bool? status;

  PrimaryInetrest(
      {this.id, this.name, this.image, this.imageName, this.status});

  PrimaryInetrest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    imageName = json['imageName'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['imageName'] = this.imageName;
    data['status'] = this.status;
    return data;
  }
}