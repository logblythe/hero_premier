class User {
  String facebookId;
  String name;
  String address;
  String phoneNumber;
  String dob;
  String email;
  String password;
  String gender;
  String image;
  String rank;
  String points;
  String favClub;
  String favClubUrl;

  User({
    this.facebookId,
    this.name,
    this.address,
    this.phoneNumber,
    this.dob,
    this.email,
    this.password,
    this.gender,
    this.image,
    this.rank,
    this.points,
    this.favClub,
    this.favClubUrl,
  });

  User.fromJsonMap(Map<String, dynamic> map)
      : name = map["name"],
        facebookId = map["facebookId"],
        address = map["address"] != null ? map["address"] : "",
        phoneNumber = map["phoneNumber"] != null ? map["phoneNumber"] : "",
        dob = map["dob"] != null ? map["dob"] : "",
        email = map["email"],
        password = map["password"],
        image = map['image'] != null ? map["image"] : "",
        rank = map['rank'],
        points = map['points'],
        favClub = map['favClub'],
        favClubUrl = map['favClubUrl'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['address'] = address != null ? address : "";
    data['phoneNumber'] = phoneNumber != null ? phoneNumber : "";
    data['dob'] = dob != null ? dob : "";
    data['email'] = email != null ? email : "";
    data['password'] = password != null ? password : "";
    data['image'] = image != null ? image : "";
    return data;
  }
}
