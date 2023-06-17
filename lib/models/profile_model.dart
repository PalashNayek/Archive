class ProfileModel {
  User? user;
  int? follower;
  int? following;

  ProfileModel({this.user, this.follower, this.following});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    follower = json['follower'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['follower'] = follower;
    data['following'] = following;
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
    json['account'] != null ? Account.fromJson(json['account']) : null;
    primaryInetrest = json['primaryInetrest'] != null
        ? PrimaryInetrest.fromJson(json['primaryInetrest'])
        : null;
    secondaryInetrest = json['secondaryInetrest'] != null
        ? PrimaryInetrest.fromJson(json['secondaryInetrest'])
        : null;
    thirdInetrest = json['thirdInetrest'] != null
        ? PrimaryInetrest.fromJson(json['thirdInetrest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailId'] = emailId;
    data['phoneNumber'] = phoneNumber;
    data['address'] = address;
    data['streetAddress1'] = streetAddress1;
    data['streetAddress2'] = streetAddress2;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['country'] = country;
    data['profile'] = profile;
    data['profileName'] = profileName;
    data['cover'] = cover;
    data['coverName'] = coverName;
    data['gender'] = gender;
    data['joinFor'] = joinFor;
    data['dob'] = dob;
    data['desc'] = desc;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['accountId'] = accountId;
    data['primaryInetrestId'] = primaryInetrestId;
    data['secondaryInetrestId'] = secondaryInetrestId;
    data['thirdInetrestId'] = thirdInetrestId;
    data['ageGroupId'] = ageGroupId;
    if (account != null) {
      data['account'] = account!.toJson();
    }else{

    }
    if (primaryInetrest != null) {
      data['primaryInetrest'] = primaryInetrest!.toJson();
    }
    if (secondaryInetrest != null) {
      data['secondaryInetrest'] = secondaryInetrest!.toJson();
    }
    if (thirdInetrest != null) {
      data['thirdInetrest'] = thirdInetrest!.toJson();
    }
    return data;
  }
}

class Account {
  String? id;
  String? phoneNumber;
  String? password;
  String? deviceId;
  String? socketId;
  String? activeAt;
  String? lastStatus;
  String? createdBy;
  String? roles;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? postCount;

  Account(
      {this.id,
        this.phoneNumber,
        this.password,
        this.deviceId,
        this.socketId,
        this.activeAt,
        this.lastStatus,
        this.createdBy,
        this.roles,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.postCount});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    deviceId = json['deviceId'];
    socketId = json['socketId'];
    activeAt = json['activeAt'];
    lastStatus = json['lastStatus'];
    createdBy = json['createdBy'];
    roles = json['roles'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    postCount = json['postCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['deviceId'] = deviceId;
    data['socketId'] = socketId;
    data['activeAt'] = activeAt;
    data['lastStatus'] = lastStatus;
    data['createdBy'] = createdBy;
    data['roles'] = roles;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['postCount'] = postCount;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['imageName'] = imageName;
    data['status'] = status;
    return data;
  }
}