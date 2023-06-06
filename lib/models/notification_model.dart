class NotificationModel {
  int? id;
  String? title;
  String? desc;
  String? type;
  bool? read;
  String? createdAt;
  String? accountId;

  NotificationModel(
      {this.id,
        this.title,
        this.desc,
        this.type,
        this.read,
        this.createdAt,
        this.accountId});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    type = json['type'];
    read = json['read'];
    createdAt = json['createdAt'];
    accountId = json['accountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['type'] = this.type;
    data['read'] = this.read;
    data['createdAt'] = this.createdAt;
    data['accountId'] = this.accountId;
    return data;
  }
}