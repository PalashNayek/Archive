import 'personal_details_new.dart';

class FollowingListModel {

  String? id;
  Following? following;

  FollowingListModel({this.id, this.following});

  FollowingListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    following = json['following'] != null
        ? new Following.fromJson(json['following'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.following != null) {
      data['following'] = this.following!.toJson();
    }
    return data;
  }
}

class Following {
  String? id;
  List<PersonalDetailx>? personalDetail;

  Following({this.id, this.personalDetail});

  Following.fromJson(Map<String, dynamic> json) {
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



