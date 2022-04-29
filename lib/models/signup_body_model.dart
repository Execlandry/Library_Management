

class SignUpBody{
 String name;
 String email;
 String password;
//  String cPassword;

 SignUpBody({
   required this.name,
   required this.email,
   required this.password,
  //  required this.cPassword,
   
 });

 //to convert signupbody object to json to send it to server
Map <String,dynamic> toJson(){
 final Map <String,dynamic> data = new Map<String, dynamic>();
 data["name"] = this.name;
 data["email"] = this.email;
 data["password"] = this.password;
 return data;
}
}