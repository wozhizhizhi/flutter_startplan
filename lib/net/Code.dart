import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_starforparents/util/Strings.dart';

class Code{

  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  /// 请求成功
  static const SUCCESS = 200;

  static errorHandleFunction(code, message, noTip){
    switch (code){
      case NETWORK_ERROR:
        if (!noTip){
          Fluttertoast.showToast(msg: Strings.network_error);
        }
        return Strings.network_error;
      case 401:
        if(!noTip) {
          Fluttertoast.showToast(msg: Strings.network_error_401);
        }
        return Strings.network_error_401; //401 Unauthorized
      case 403:
        if(!noTip) {
          Fluttertoast.showToast(msg: Strings.network_error_403);
        }
        return Strings.network_error_403;
      case 404:
        if(!noTip) {
          Fluttertoast.showToast(msg: Strings.network_error_404);
        }
        return Strings.network_error_404;
      case NETWORK_TIMEOUT:
      //超时
        if(!noTip) {
          Fluttertoast.showToast(msg: Strings.network_error_timeout);
        }
        return Strings.network_error_timeout;
      default:
        /// 如果提示语句不为空弹出提示
        if(!noTip) {
          Fluttertoast.showToast(msg: Strings.network_error_unknown + " " + message);
        }
        return Strings.network_error_unknown;
    }
  }
}