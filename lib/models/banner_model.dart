
class BannerModel {
  int? id;
  String? image;
  String? imageName;
  int? priority;
  bool? status;
  String? createdAt;
  String? updatedAt;

  BannerModel(
      {this.id,
        this.image,
        this.imageName,
        this.priority,
        this.status,
        this.createdAt,
        this.updatedAt});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    imageName = json['imageName'];
    priority = json['priority'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['imageName'] = this.imageName;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

