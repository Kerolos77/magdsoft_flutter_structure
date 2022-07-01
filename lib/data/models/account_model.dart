class UserModel{
  late String message;
  late int status;
  UserModel({
    required this.message,
    required this.status,
  });
  UserModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
  }
  Map<String, dynamic> toMap(){
    return {
      'message': message,
      'status': status,
    };
  }
}

class AccountModel
{
      late int id;
      late String name;
      late String email;
      late String phone;
      late String password;
      AccountModel(this.id, this.name, this.email, this.phone, this.password);

      AccountModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        email = json['email'];
        phone = json['phone'];
        password = json['password'];
      }
      Map<String, dynamic> toMap() {
        return {
          'id': id,
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        };
      }

    }