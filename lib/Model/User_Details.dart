class User_Details {
  String? firstName;
  String? lastName;
String? profile;
  String? phone;
//  String? address;
//String? phone;

  User_Details(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.profile,
  //    required this.address
  });

  Map<String, dynamic> getjson() {
    return {
      "firstname": firstName,
      "lastname": lastName,
      "phone": phone,
       "profile": profile,
  //    "address": address,
    };
  }

  User_Details.fromjson(Map<String, dynamic> json) {
    firstName = json["firstname"];
    lastName = json["lastname"];
    phone = json["phone"];
    profile = json["profile"];
    //address = json["address"];
  }

  factory User_Details.getModelFromJson(Map<String, dynamic> json) {
    return User_Details(
      firstName: json["firstname"],
      lastName: json["lastname"],
      phone: json["phone"],
      profile: json["profile"],
      //address: json["address"],
    );
  }
}
