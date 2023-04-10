class userModel
{
   String? name;
   String? email;
   String? phone;
   String? uId;

  userModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
  });
  userModel.fromJson(Map<String,dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
  }
  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
    };
  }

}
