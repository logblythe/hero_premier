class User {
  String name;
  String address;
  String phoneNumber;
  String dob;
  String email;
  String password;
  String gender;
  String image;

  User({
    this.name,
    this.address,
    this.phoneNumber,
    this.dob,
    this.email,
    this.password,
    this.gender,
    this.image,
  });

  User.fromJsonMap(Map<String, dynamic> map)
      : name = map["name"],
        address = map["address"],
        phoneNumber = map["phoneNumber"],
        dob = map["dob"],
        email = map["email"],
        password = map["password"],
        image = map['image'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['dob'] = dob;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
