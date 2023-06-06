
class InterestListModel {
  String? id;
  String? name;
  String? image;
  String? imageName;
  bool? status;

  InterestListModel({this.id, this.name, this.image, this.imageName, this.status});

  InterestListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    imageName = json['imageName'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['imageName'] = this.imageName;
    data['status'] = this.status;
    return data;
  }
}