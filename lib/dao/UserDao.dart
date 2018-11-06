import 'dart:async';
import 'package:flutter_starforparents/util/LocalSharePreferences.dart';
import 'package:flutter_starforparents/util/Strings.dart';
import 'package:flutter_starforparents/net/Config.dart';
import 'package:flutter_starforparents/net/HttpMannage.dart';
import 'package:flutter_starforparents/net/Address.dart';
import 'package:flutter_starforparents/modle/loginVo.dart';
import 'package:flutter_starforparents/modle/BaseModel.dart';
import 'package:flutter_starforparents/modle/HomeVoArrElement.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:io';

class UserDao {
  /// 发起登录网络请求
  /// [username] 登录名
  /// [password] 登录密码
  static Future<BaseModel<LoginVo>> getLogin(username, password) async {
    LoginVo loginVo;
    String statusMsg;
    int code;
    Map requestParams = {
      "account":username,
      "password":md5.convert(utf8.encode(password + Strings.MD5_T_MARK)).toString(),
      "realPassword":password,
      "loginType":2,
    };

    var res = await HttpMannage.netFetch(Address.URL_LOGIN, requestParams, null, new Options(method: "post"));
    if (res.data["token"] != null&&res.data["token"] != ""){
      await LocalSharePreferences.saveString(Config.USER_NAME_KEY, username);
      await LocalSharePreferences.saveString(Config.PW_KEY, password);
      await LocalSharePreferences.saveString(Config.TOKEN_KEY, res.data["token"]);
    }

    statusMsg = res.data["statusMsg"];
    code = res.data["statusCode"];
    loginVo = LoginVo.fromJson(res.data);
    return new BaseModel(statusCode: code,statusMsg: statusMsg,data: loginVo);
  }

  /// 获取用户首页的数据
  static Future<BaseModel<List<HomeVoArrElement>>> getGuideData() async{
    List<HomeVoArrElement> homevoList;
    String statusMsg;
    int code;
    var res = await HttpMannage.netFetch(Address.URL_HOMEPAGE, null, null, new Options(method: "get"));

    if (res != null && res.data["homeVoArr"] != null){
     List list =res.data["homeVoArr"];
     homevoList = list.map((list){
       return HomeVoArrElement.fromJson(list);
     }).toList();

    }
    statusMsg = res.data["statusMsg"];
    code = res.data["statusCode"];
    return new BaseModel(statusCode: code,statusMsg: statusMsg,data: homevoList);
  }

}
