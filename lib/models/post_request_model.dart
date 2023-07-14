import 'hashtag_model.dart';

class PostRequestModel {
  String? name;
  String? desc;
  String? interestId;
  List<HasTagModel>? postTags;
  String? latitude;
  String? longitude;
  String? type;

  PostRequestModel({this.name, this.desc, this.interestId, this.postTags,this.longitude,this.latitude, this.type});

  PostRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    interestId = json['interestId'];
    if (json['postTags'] != null) {
      postTags = <HasTagModel>[];
      json['postTags'].forEach((v) {
        postTags!.add(new HasTagModel.fromJson(v));
      });
    }
    latitude=json['latitude'];
    longitude=json['longitude'];
    type=json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['interestId'] = this.interestId;
    data['longitude']=this.longitude;
    data['latitude']=this.latitude;
    data['type']=this.type;
    if (this.postTags != null) {
      data['postTags'] =
          this.postTags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}