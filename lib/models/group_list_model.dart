

import 'account_model.dart';
import 'personal_details.dart';

class GroupListModel {
  String? id;
  String? groupName;
  String? type;
  String? createdAt;
  List<Messages>? messages;
  int? totalUser;
  Receiver? receiver;
  Sender? sender;

  GroupListModel(
      {this.id,
        this.groupName,
        this.type,
        this.createdAt,
        this.messages,
        this.totalUser,this.sender,this.receiver});

  GroupListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['groupName'];
    type = json['type'];
    createdAt = json['createdAt'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
    sender = json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ? new Receiver.fromJson(json['receiver'])
        : null;

    totalUser = json['totalUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupName'] = this.groupName;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    data['totalUser'] = this.totalUser;
    return data;
  }
}
class Messages {
  int ?id;
  String? content;
  bool? seen;
  String? accountId;
  String? createdAt;
  Account? account;

  Messages(
      {this.id,
        this.content,
        this.seen,
        this.accountId,
        this.createdAt,
        this.account});

  Messages.fromJson(Map<String, dynamic> json) {
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
class Receiver {
  String? id;
  List<PersonalDetail>? personalDetail;

  Receiver({this.id, this.personalDetail});

  Receiver.fromJson(Map<String, dynamic> json) {
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
class Sender {
  String? id;
  List<PersonalDetail>? personalDetail;

  Sender({this.id, this.personalDetail});

  Sender.fromJson(Map<String, dynamic> json) {
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
