
import 'account_model.dart';

class GroupMemberList {
  String? id;
  Account? account;

  GroupMemberList({this.id, this.account});

  GroupMemberList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    return data;
  }
}
