class GroupId {
  String sId;
  String name;
  String inviteLink;

  GroupId({this.sId, this.name, this.inviteLink});

  GroupId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    inviteLink = json['inviteLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['inviteLink'] = this.inviteLink;
    return data;
  }
}
