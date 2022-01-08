import 'dart:developer';
import 'package:api_calling_demo/common/constants/strings.dart';
import 'package:api_calling_demo/model/user_model.dart';

import 'package:http/http.dart' as http;

class ApiService{

 static Future<List<UserModel>?> getUSerApi() async {
      http.Response res = await http.get(Uri.parse(StringResources.userUrl));
      print("apicalling --->>>>${res.body}");
      // apiRes = jsonDecode(res.body);
      // print("apiRes --->$apiRes");
      if(res.statusCode == 200){
        return userModelFromJson(res.body);
      }else{
        log("getUSerApi --->>statusCode -${res.statusCode} ");
        return null;
      }
  }
}