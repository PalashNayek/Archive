class RegisterModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? streetAddress1;
  String? streetAddress2;
  String? pincode;
  String? city;
  String? state;
  String? country;
  String? emailId;
  String? gender;
  String? joinFor;
  String? dob;
  String? desc;
  String? primaryInetrestId;
  String? secondaryInetrestId;
  String? thirdInetrestId;

  RegisterModel(
      {this.firstName,
        this.lastName,
        this.phoneNumber,
        this.address,
        this.streetAddress1,
        this.streetAddress2,
        this.pincode,
        this.city,
        this.state,
        this.country,
        this.emailId,
        this.gender,
        this.joinFor,
        this.dob,
        this.desc,
        this.primaryInetrestId,
        this.secondaryInetrestId,
        this.thirdInetrestId});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    streetAddress1 = json['streetAddress1'];
    streetAddress2 = json['streetAddress2'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    emailId = json['emailId'];
    gender = json['gender'];
    joinFor = json['joinFor'];
    dob = json['dob'];
    desc = json['desc'];
    primaryInetrestId = json['primaryInetrestId'];
    secondaryInetrestId = json['secondaryInetrestId'];
    thirdInetrestId = json['thirdInetrestId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['streetAddress1'] = this.streetAddress1;
    data['streetAddress2'] = this.streetAddress2;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['emailId'] = this.emailId;
    data['gender'] = this.gender;
    data['joinFor'] = this.joinFor;
    data['dob'] = this.dob;
    data['desc'] = this.desc;
    data['primaryInetrestId'] = this.primaryInetrestId;
    data['secondaryInetrestId'] = this.secondaryInetrestId;
    data['thirdInetrestId'] = this.thirdInetrestId;
    return data;
  }
}

