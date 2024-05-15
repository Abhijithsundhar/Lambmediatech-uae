
class LoginModel{
  String? email;
  String? password;
  DateTime? createTime;

  LoginModel({
    required this.email,
    required this.password,
    required this.createTime,
  });

  Map<String,dynamic> toMap(){
    final Map<String,dynamic> data=<String,dynamic>{};
    data['email']= email;
    data['password']= password;
    data['createTime']=createTime;
    return data;
  }
  LoginModel.fromMap(Map<String, dynamic> map)
      : email = map['email'],
        password = map['password'],
        createTime = (map['createTime']).toDate();

  LoginModel copyWith({
    String? email ,
    String? password,
    DateTime? createTime,
  })=> LoginModel(
      email: email??this.email,
      password: password??this.password,
      createTime: createTime??this.createTime,

  );
}