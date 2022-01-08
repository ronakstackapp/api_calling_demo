import 'package:api_calling_demo/model/user_model.dart';
import 'package:api_calling_demo/rest_api/user_details/rest_api.dart';
import 'package:api_calling_demo/screen/user_screen/user_screen.dart';



class UserScreenViewModel{


  SimpleApiCallingState? simpleApiCallingState;
  List<UserModel> userModelList = [];


  UserScreenViewModel(this.simpleApiCallingState) {
    userApiCalling();
  }

  userApiCalling() async {
    List<UserModel>? apiRes = await ApiService.getUSerApi();
    if(apiRes != null){
      userModelList = apiRes;
    }
  }
}