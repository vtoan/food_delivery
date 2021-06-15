class User {
  String phone = '';
  String fullName = '';
  String address = '';
  String password = '';

  User(
      {this.phone: '', this.fullName: '', this.password: '', this.address: ''});

  Map<String, Object?> toJson() {
    return {
      'phone': phone,
      'fullName': fullName,
      'address': address,
      'password': password
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phone: json['phone'] ?? "",
      fullName: json['fullName'] ?? "",
      address: json['address'] ?? "",
    );
  }
}
