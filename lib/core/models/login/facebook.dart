class Facebook {
  String facebookId;
  String email;
  String name;
  String phoneNumber;
  String address;
  String dob;
  String image;

  Facebook(
      {this.facebookId,
      this.email,
      this.name,
      this.phoneNumber,
      this.address,
      this.dob,
      this.image});

  Facebook.fromJsonMap(Map<String, dynamic> map)
      : facebookId = map['facebookId'],
        email = map['email'],
        name = map['name'],
        phoneNumber = map['phoneNumber'],
        address = map['address'],
        dob = map['dob'],
        image = map['image'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['facebookId'] = this.facebookId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['dob'] = this.dob;
    data['image'] = this.image;
    return data;
  }
}
