import 'personal_details_new.dart';

class FollowerListModel {
  String? id;
  Follower? follower;

  FollowerListModel({this.id, this.follower});

  FollowerListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    follower = json['follower'] != null
        ? Follower.fromJson(json['follower'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.follower != null) {
      data['follower'] = this.follower!.toJson();
    }
    return data;
  }
}

class Follower {
  String? id;
  List<PersonalDetailx>? personalDetail;

  Follower({this.id, this.personalDetail});

  Follower.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['personalDetail'] != null) {
      personalDetail = <PersonalDetailx>[];
      json['personalDetail'].forEach((v) {
        personalDetail!.add(new PersonalDetailx.fromJson(v));
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
