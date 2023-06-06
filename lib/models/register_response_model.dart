class RegisterResponseModel {
  String? profile;
  String? profileName;
  String? ageGroupId;
  String? id;
  String? joinFor;
  String? createdAt;
  String? updatedAt;

  RegisterResponseModel(
      {this.profile,
        this.profileName,
        this.ageGroupId,
        this.id,
        this.joinFor,
        this.createdAt,
        this.updatedAt});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    profile = json['profile'];
    profileName = json['profileName'];
    ageGroupId = json['ageGroupId'];
    id = json['id'];
    joinFor = json['joinFor'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile'] = this.profile;
    data['profileName'] = this.profileName;
    data['ageGroupId'] = this.ageGroupId;
    data['id'] = this.id;
    data['joinFor'] = this.joinFor;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

