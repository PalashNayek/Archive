import 'personal_details.dart';

class Account {
  String? id;
  List<PersonalDetail>? personalDetail;

  Account({this.id, this.personalDetail});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['personalDetail'] != null) {
      personalDetail = <PersonalDetail>[];
      json['personalDetail'].forEach((v) {
        personalDetail!.add(new PersonalDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.personalDetail != null) {
      data['personalDetail'] =
          this.personalDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}