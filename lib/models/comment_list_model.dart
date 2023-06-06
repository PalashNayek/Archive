import 'account_model.dart';

class CommentListModel {
  String? id;
  String? comment;
  String? createdAt;
  Account? account;
  List<String>? postChildComment;

  CommentListModel(
      {this.id,
        this.comment,
        this.createdAt,
        this.account,
        this.postChildComment});

  CommentListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
    if (json['postChildComment'] != null) {
      postChildComment = <String>[];
      json['postChildComment'].forEach((v) {
        postChildComment!.add(v.toString());
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['createdAt'] = this.createdAt;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    if (this.postChildComment != null) {
      data['postChildComment'] =
          this.postChildComment!.map((v) => v.toString()).toList();
    }
    return data;
  }
}

