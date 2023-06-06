class PersonalDetail {
  String? id;
  String? firstName;
  String? lastName;
  String? profile;

  PersonalDetail({this.id, this.firstName, this.lastName, this.profile});

  PersonalDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profile'] = this.profile;
    return data;
  }
}