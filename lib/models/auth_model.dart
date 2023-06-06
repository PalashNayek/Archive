class AuthInfo {
  int? otp;
  bool? latest;
  String? message;

  AuthInfo({this.otp, this.latest, this.message});

  AuthInfo.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    latest = json['latest'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['latest'] = this.latest;
    data['message'] = this.message;
    return data;
  }
}