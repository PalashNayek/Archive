class ResCallAcceptModel {

  dynamic doctorId;
  dynamic consultationId;

  ResCallAcceptModel(
  {
  this.doctorId,
  this.consultationId});

  ResCallAcceptModel.fromJson(Map<String, dynamic> json) {
  doctorId = json['doctorId'];
  consultationId = json['consultationId'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['doctorId'] = this.doctorId;
  data['consultationId'] = this.consultationId;
  return data;
  }
  }
