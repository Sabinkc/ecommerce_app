import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/model/user.dart';

class SharePref{
 static const String _tokenKey = "userToken";
 static const String _userKey = "user";

 static Future<void> setuserToken(String token)async {
  final sharePref = await SharedPreferences.getInstance();
  await sharePref.setString(_tokenKey, token);
 }

 static Future<String?> get userToken async {
  final sharePref = await SharedPreferences.getInstance();
  return sharePref.getString(_tokenKey);
 }

 static Future<void> deleteUserToken() async{
  final sharePref = await SharedPreferences.getInstance();
  await sharePref.remove(_tokenKey);

 }

  static Future<void> setUser(User user)async {
  final sharePref = await SharedPreferences.getInstance();
  final Map<String, dynamic>userMap = user.toJson(); 
  final String encodedData = json.encode(userMap);
  await sharePref.setString(_userKey, encodedData);
 }

 static Future<User?> get user async {
  final sharePref = await SharedPreferences.getInstance();
  final encodedData = sharePref.getString(_userKey);
  if(encodedData != null){
    final decodedData = json.decode(encodedData);
    final mapData = Map<String, dynamic>.from(decodedData);
    return User.fromJson(mapData);

  }else{
    return null;
  }
 }

 static Future<void> deleteUser() async{
  final sharePref = await SharedPreferences.getInstance();
  await sharePref.remove(_userKey);
 }
}