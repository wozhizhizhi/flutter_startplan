import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_starforparents/main/BooksPage.dart';
import 'package:flutter_starforparents/main/UserPage.dart';
import 'package:flutter_starforparents/util/StudentColors.dart';
import 'package:flutter_starforparents/main/GuidePage.dart';
import 'package:flutter_starforparents/r.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

/// 应用的首页面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabTitles = ["指导", "图书", "我"];
  int _curIndex = 0;
  var _tabImages;
  var _body;

  /// 退出应用的时间
  int _lastClickTime = 0;

  /// 未选中的文字效果
  final textTabStyleNormal =
      new TextStyle(color: StudentColors.tabTextUnSelectedColor);

  /// 选中的文字效果
  final textTabStyleSelected =
      new TextStyle(color: StudentColors.tabTextSelectedColor);

  /// 获得导航图片我这里定义了一个控件
  Image getSizeImage(String path) {
    return Image.asset(
      path,
      width: 25.0,
      height: 25.0,
    );
  }

  /// 初始化底部tab的图片0未选中,1选中
  void _initImage() {
    if (_tabImages == null) {
      _tabImages = [
        [
          getSizeImage(R.imagesImgTabGuideNormalPng),
          getSizeImage(R.imagesImgTabGuidePng)
        ],
        [
          getSizeImage(R.imagesImgTabLibraryNormalPng),
          getSizeImage(R.imagesImgTabLibraryPng)
        ],
        [
          getSizeImage(R.imagesImgTabUserinfoNormalPng),
          getSizeImage(R.imagesImgTabUserinfoPng)
        ]
      ];
    }
  }

  /// 文字选中与未选中的效果根据index判断
  TextStyle getTextStyle(int index) {
    if (index == _curIndex) {
      return textTabStyleSelected;
    }
    return textTabStyleNormal;
  }

  /// 获得当前的图片
  Image setIndexImage(int index) {
    if (index == _curIndex) {
      return _tabImages[index][1];
    }
    return _tabImages[index][0];
  }

  /// 获得当前的文字
  Text setText(int index) {
    return Text(
      tabTitles[index],
      style: getTextStyle(index),
    );
  }

  void _initPage() {
    _body = IndexedStack(
      children: <Widget>[
        new GuidePage(),
        new BooksPage(),
        new UserPage(),
      ],
      index: _curIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    /// 初始化图片
    _initImage();
    _initPage();
    return WillPopScope(
        child: new Scaffold(
          body: _body,
          bottomNavigationBar: CupertinoTabBar(
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  icon: setIndexImage(0), title: setText(0)),
              new BottomNavigationBarItem(
                  icon: setIndexImage(1), title: setText(1)),
              new BottomNavigationBarItem(
                  icon: setIndexImage(2), title: setText(2)),
            ],
            currentIndex: _curIndex,
            onTap: (index) {
              setState(() {
                _curIndex = index;
              });
            },
          ),
        ),
        onWillPop: _doExitApp);
  }

  Future<bool> _doExitApp() {
    int nowTime = new DateTime.now().millisecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime < 1500) {
      return Future.value(true);
    } else {
      Fluttertoast.showToast(msg: "再按一次退出应用", gravity: ToastGravity.CENTER);
      _lastClickTime = new DateTime.now().millisecondsSinceEpoch;
      return Future.value(false);
    }
  }
}
