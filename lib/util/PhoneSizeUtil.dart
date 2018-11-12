import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneSizeUtil{
  /** 获取屏幕宽度 */
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /** 获取屏幕高度 */
  static double getScreenHeight(BuildContext context) {
    return  MediaQuery.of(context).size.height;
  }

  /** 获取系统状态栏高度 */
  static double getSysStatsHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /** 返回当前时间戳 */
  static int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  /// 复制到剪粘板
  static copyToClipboard(final String text) {
    if (text == null) return;
    Clipboard.setData(new ClipboardData(text: text));
  }

  /// 隐藏软键盘
  static void hideSoftKey() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  /// 显示软键盘
  static void showSoftKey() {
    SystemChannels.textInput.invokeMethod('TextInput.show');
  }
}