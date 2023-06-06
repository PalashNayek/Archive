

import 'account_model.dart';

class MessageListModel {
  int ?id;
  String? content;
  bool? seen;
  String? accountId;
  String? createdAt;
  Account? account;

  MessageListModel(
      {this.id,
        this.content,
        this.seen,
        this.accountId,
        this.createdAt,
        this.account});

  MessageListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    seen = json['seen'];
    accountId = json['accountId'];
    createdAt = json['createdAt'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['seen'] = this.seen;
    data['accountId'] = this.accountId;
    data['createdAt'] = this.createdAt;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    return data;
  }
}

