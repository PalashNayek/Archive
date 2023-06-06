import 'account_model.dart';

class BlockListModel {
  String? id;
  String? createdAt;
  Account? account;

  BlockListModel({this.id, this.createdAt, this.account});

  BlockListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    account =
    json['blockUser'] != null ? new Account.fromJson(json['blockUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    if (this.account != null) {
      data['blockUser'] = this.account!.toJson();
    }
    return data;
  }
}

