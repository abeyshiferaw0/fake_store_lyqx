class UserModel {
  final String userName;
  final String token;

  UserModel({
    required this.userName,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['user_name'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'token': token,
    };
  }
}
