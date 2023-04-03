class UserModel {
  String profilePic;
  String name;
  String dob;
  String aadhar;
  String disability;
  String address;
  String pincode;
  String phoneNumber;
  String uid;
  String createdAt;
  String status;

  UserModel(
      {required this.profilePic,
      required this.name,
      required this.dob,
      required this.aadhar,
      required this.disability,
      required this.address,
      required this.pincode,
      required this.phoneNumber,
      required this.uid,
      required this.createdAt,
      required this.status});

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      profilePic: map['profilePic'] ?? '',
      name: map['name'] ?? '',
      dob: map['dob'] ?? '',
      aadhar: map['aadhar'] ?? '',
      disability: map['disability'] ?? '',
      address: map['address'] ?? '',
      pincode: map['pincode'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      uid: map['uid'] ?? '',
      createdAt: map['createdAt'] ?? '',
      status: map['status'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "profilePic": profilePic,
      "name": name,
      "dob": dob,
      "aadhar": aadhar,
      "disability": disability,
      "address": address,
      "pincode": pincode,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "createdAt": createdAt,
      "status": status
    };
  }
}
