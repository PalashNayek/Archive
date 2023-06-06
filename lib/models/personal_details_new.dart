class PersonalDetailx {
  String? firstName;
  String? lastName;
  String? profile;

  PersonalDetailx({this.firstName, this.lastName, this.profile});

  PersonalDetailx.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profile'] = this.profile;
    return data;
  }
}