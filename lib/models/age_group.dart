class AgeGroup {
  int ?id;
  String ? group;

  AgeGroup({this.id, this. group});


  AgeGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group'] = this.group;
    return data;
  }
}