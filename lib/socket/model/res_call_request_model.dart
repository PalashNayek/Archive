class ResCallRequestModel {
  bool? error;
  String? msesage;
  Result? result;

  ResCallRequestModel({this.error, this.msesage, this.result});

  ResCallRequestModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msesage = json['msesage'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msesage'] = this.msesage;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int ?userId;
  String? channel;
  int? doctorId;
  String? doctorName;
  String? doctorPhone;
  String? token;
  int? consultationId;

  Result(
      {this.userId,
        this.channel,
        this.doctorId,
        this.doctorName,
        this.doctorPhone,
        this.token,
        this.consultationId});

  Result.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    channel = json['channel'];
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
    doctorPhone = json['doctorPhone'];
    token = json['token'];
    consultationId = json['consultationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['channel'] = this.channel;
    data['doctorId'] = this.doctorId;
    data['doctorName'] = this.doctorName;
    data['doctorPhone'] = this.doctorPhone;
    data['token'] = this.token;
    data['consultationId'] = this.consultationId;
    return data;
  }
}

