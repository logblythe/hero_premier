class TodayResponse {
  List<Result> result;
  int current;
  int pages;
  int totalCount;

  TodayResponse({this.result, this.current, this.pages, this.totalCount});

  TodayResponse.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
    current = json['current'];
    pages = json['pages'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['current'] = this.current;
    data['pages'] = this.pages;
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Result {
  List<String> users;
  String status;
  String sId;
  FirstTeamId firstTeamId;
  FirstTeamId secondTeamId;
  Stadium stadium;
  String weekNo;
  String matchTime;
  Stadium leagueCategoryId;
  String createdAt;
  int iV;

  Result(
      {this.users,
        this.status,
        this.sId,
        this.firstTeamId,
        this.secondTeamId,
        this.stadium,
        this.weekNo,
        this.matchTime,
        this.leagueCategoryId,
        this.createdAt,
        this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    users = json['users'].cast<String>();
    status = json['status'];
    sId = json['_id'];
    firstTeamId = json['firstTeamId'] != null
        ? new FirstTeamId.fromJson(json['firstTeamId'])
        : null;
    secondTeamId = json['secondTeamId'] != null
        ? new FirstTeamId.fromJson(json['secondTeamId'])
        : null;
    stadium =
    json['stadium'] != null ? new Stadium.fromJson(json['stadium']) : null;
    weekNo = json['weekNo'];
    matchTime = json['matchTime'];
    leagueCategoryId = json['leagueCategoryId'] != null
        ? new Stadium.fromJson(json['leagueCategoryId'])
        : null;
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users'] = this.users;
    data['status'] = this.status;
    data['_id'] = this.sId;
    if (this.firstTeamId != null) {
      data['firstTeamId'] = this.firstTeamId.toJson();
    }
    if (this.secondTeamId != null) {
      data['secondTeamId'] = this.secondTeamId.toJson();
    }
    if (this.stadium != null) {
      data['stadium'] = this.stadium.toJson();
    }
    data['weekNo'] = this.weekNo;
    data['matchTime'] = this.matchTime;
    if (this.leagueCategoryId != null) {
      data['leagueCategoryId'] = this.leagueCategoryId.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FirstTeamId {
  String sId;
  String name;
  String image;

  FirstTeamId({this.sId, this.name, this.image});

  FirstTeamId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Stadium {
  String sId;
  String name;

  Stadium({this.sId, this.name});

  Stadium.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
