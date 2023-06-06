class CommentResponseModel {
  String? id;
  String? createdAt;
  String? updatedAt;

  CommentResponseModel({this.id, this.createdAt, this.updatedAt});

  CommentResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

