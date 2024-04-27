

import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/api/data_response.dart';
import 'package:ecommerce_app/common/constants.dart';
import 'package:ecommerce_app/common/utils/share_pref.dart';
import 'package:ecommerce_app/features/auth/model/user.dart';

class UserRepository {
  User? _user;
  String _token ="";

  User? get user => _user;
  String get token => _token;

  Future<void> init()async {
    _user = await SharePref.user;
    _token = await SharePref.userToken ?? "";
  }


  Future<DataResponse<bool>> signUp({
    required String fullName, 
    required String address, 
    required String phone, 
    required String password, 
    required String email,
    })async {
      try{
        final body = {
          "name": fullName,
          "email": email,
          "password": password,
          "phone": phone,
	        "address": address,
        };
      final response = await Dio().post("${Constants.baseUrl}/auth/register",data: body);
      if(response.statusCode == null){
        return DataResponse.errror("Unable to register");
      }
      if(response.statusCode! >= 200 && response.statusCode! < 300) {
        return DataResponse.success(true);
      }else{
        return DataResponse.errror(response.data["message"]);
      }

      } on DioError catch(e){
        return DataResponse.errror(e.response?.data["message"] ?? "Unable to register user");

      }catch(e){
        return DataResponse.errror(e.toString());
      }
    }


   Future<DataResponse<User>> login({
    required String password, 
    required String email,
    })async {
      try{
        final body = {
          "email": email,
          "password": password,
        };
      final response = await Dio().post("${Constants.baseUrl}/auth/login",data: body);
      if(response.statusCode == null){
        return DataResponse.errror("Unable to login");
      }
      if(response.statusCode! >= 200 && response.statusCode! < 300) {
         final tempUser = User.fromJson(response.data["results"]);
         final String authenticationToken = response.data["token"];
         _user = tempUser;
         _token = authenticationToken;
         await SharePref.setUser(tempUser);
         await SharePref.setuserToken(_token);
         return DataResponse.success(tempUser);
      }else{
        return DataResponse.errror(response.data["message"]);
      }

      } on DioError catch(e){
        return DataResponse.errror(e.response?.data["message"] ?? "Unable to login user");

      }catch(e){
        return DataResponse.errror(e.toString());
      }
    }

    Future logout() async {
      _token = "";
      _user = null;
      await SharePref.deleteUser();
      await SharePref.deleteUserToken();
    }

}