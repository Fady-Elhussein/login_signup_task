import 'package:dio/dio.dart';

import '../models/sign_up_model.dart';

class RegistrationServices{
  static Dio dio=Dio();

  static Future<RegistrationModel> loginData({required String email,required String password}) async{
try{
  Response response = await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser",
  data: {
    "Email":email,
    "Password":password,
  });
  if(response.statusCode==200){
    print(response.data);

    return RegistrationModel.fromJSon(response.data);
  }else{
    throw Exception("response.statusCode not equal 200");
  }
}catch(error){
  throw Exception(error);
}

  }






  static Future<RegistrationModel> signUpData({required String email,required String password,required String phone,required String name}) async{
    try{
      Response response = await dio.post("https://elsewedyteam.runasp.net/api/Register/AddUser",
          data: {
            "Email":email,
            "Password":password,
            "Phone":phone,
            "Name":name,

          });
      if(response.statusCode==200){
        print(response.data);
        return RegistrationModel.fromJSon(response.data);
      }else{
        throw Exception("response.statusCode not equal 200");
      }
    }catch(error){
      throw Exception(error);
    }

  }
}
