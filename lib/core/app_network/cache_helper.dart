import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/filter_feature/data/models/categories_model.dart';
import '../errors/exceptions.dart';


class SharedPrefs {

  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();


  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }


  setTheme(String? value) {
    _sharedPrefs?.setString(selectedTheme, value!);
  }

  static const String selectedTheme = "theme";

  static Future<bool> setString(String key, String value) async =>
      await _sharedPrefs.setString(key, value);


   static String? getString(String key){
  return _sharedPrefs.getString(key);
}
  static dynamic getDta({
    required String key,
  }){
    return  _sharedPrefs.get(key);
  }
  static Future<bool> saveData({
    required String key,
    required dynamic value
  })async{

    if(value is String) return await _sharedPrefs.setString(key, value);
    if(value is int) return await _sharedPrefs.setInt(key, value);
    if(value is bool) return await _sharedPrefs.setBool(key, value);
    return await _sharedPrefs.setDouble(key, value);
  }
  static Future<bool?> removeData({
    required String key,
  })async{
    return await _sharedPrefs.remove(key, );

  }
  Future<bool> saveToken(String token)async {
     return await _sharedPrefs.setString('token', token);
  }
  Future<bool> saveLang(String lang)async {
     return await _sharedPrefs.setString('lang', lang);
  }
  static const CACHED_CATEGORIES = "CACHED_CATEGORIES";
  static const CACHED_CARD = "CACHED_CARD";
  static const token_key = "token";
  Future<Unit> cacheLogin(String token) {
    SharedPrefs.setString(token_key,token );
    return Future.value(unit);
  }
  CategoriesModel cacheCategories() {
    final jsonString = SharedPrefs.getString(CACHED_CATEGORIES);
    if (jsonString != null) {
      return CategoriesModel.fromJson(json.decode(jsonString));
    } else {
      throw EmptyCacheException();
    }
  }
/*  Future<Unit> cacheUsers(AllUsersModel allUsers) {
    SharedPrefs.setString(CACHED_USERS, json.encode(allUsers.toJson()));
    return Future.value(unit);
  }
  Future<Unit> cacheCard(CardModel cardModel) {
    SharedPrefs.setString(CACHED_USERS, json.encode(cardModel.toJson()));
    return Future.value(unit);
  }
  Future<AllUsersModel> getCachedUsers() {
    final jsonString = SharedPrefs.getString(CACHED_USERS);
    if (jsonString != null) {
      return Future.value(AllUsersModel.fromJson(json.decode(jsonString)));
    } else {
      throw EmptyCacheException();
    }
  }
  Future<CardModel> getCachedCard() {
    final jsonString = SharedPrefs.getString(CACHED_CARD);
    if (jsonString != null) {
      return Future.value(CardModel.fromJson(json.decode(jsonString)));
    } else {
      throw EmptyCacheException();
    }
  }
  static const token_key = "token";
  Future<Unit> cacheLogin(String token) {
    SharedPrefs.setString(token_key,token );
    return Future.value(unit);
  }
  Future<LogInModel> getCachedLogin() {
    final jsonString = SharedPrefs.getString(token_key);
    if (jsonString != null) {
      return Future.value(LogInModel.fromJson(json.decode(jsonString)));
    } else {
      throw EmptyCacheException();
    }
  }*/
  String get theme=>_sharedPrefs?.getString('theme')??'system';

   String get token => _sharedPrefs.getString('token')??'';

}