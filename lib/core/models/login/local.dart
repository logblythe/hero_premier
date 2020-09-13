class Local {
  int loginAttempts;
  String name;
  String address;
  String phoneNumber;
  String dob;
  String email;
  String image;
  bool isEmailVerified;

  Local({this.loginAttempts, this.name, this.address, this.phoneNumber, this.dob,
      this.email, this.image, this.isEmailVerified});

  Local.fromJsonMap(Map<String, dynamic> json) {
    loginAttempts = json['loginAttempts'];
    name = json['name'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    dob = json['dob'];
    email = json['email'];
    image = json['image'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['loginAttempts'] = this.loginAttempts;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['image'] = this.image;
    data['isEmailVerified'] = this.isEmailVerified;
    return data;
  }
}
