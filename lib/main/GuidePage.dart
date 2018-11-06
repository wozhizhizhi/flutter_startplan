import 'package:flutter/material.dart';
import 'package:flutter_starforparents/r.dart';
import 'package:flutter_starforparents/util/PhoneSizeUtil.dart';
import 'package:flutter_starforparents/util/StudentColors.dart';
import 'package:flutter_starforparents/dao/UserDao.dart';
import 'package:flutter_starforparents/modle/HomeVoArrElement.dart';
import 'package:flutter_starforparents/modle/BaseModel.dart';
import 'dart:async';

/// 指导页面
class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  int listType;
  BaseModel<List<HomeVoArrElement>> model;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getGuideData();
  }

  /// 登录请求逻辑
  void _getGuideData() async {
    if (!mounted) return; //异步处理，防止报错
    model = await UserDao.getGuideData();

    /// 在这里我遇到了一个错误only value 0:1,这个一般是说你取错了，
    /// 只有位置0才有值，你取的是位置1，这种错有点类似于数组越界
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var content;

    /// 这里如果你不给一个加载页面当你网络请求你取值回来之前，
    /// 页面会呈现报错状态 “data was null”，还有一种方法是在组件里面判断null，
    /// 如果是空可以给一个默认值
    if (model == null) {
      content = Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.yellow),
        ),
      );
    } else {
      content = SingleChildScrollView(
        child: Container(
          /// 这里我将图片的宽高设为屏幕的宽高
          width: PhoneSizeUtil.getScreenWidth(context),
          height: PhoneSizeUtil.getScreenHeight(context),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(R.imagesHomeImgBgPng), fit: BoxFit.fill),
          ),
          child: Column(
            children: <Widget>[
              _buildTitle(),
              _buildButton(),
              Container(
                child: _buildItem(0, R.imagesImgCapabilitytrainingPng),
                margin: const EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: _buildItem(1, R.imagesImgThemereadingPng),
                margin: const EdgeInsets.only(top: 10.0),
              ),
              Container(
                child: _buildItem(2, R.imagesImgReadingreportPng),
                margin: const EdgeInsets.only(top: 10.0),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: content,
    );
  }

  /// 标题
  Widget _buildTitle() {
    double statsHeight = PhoneSizeUtil.getSysStatsHeight(context);
    return Container(
      margin: EdgeInsets.only(top: statsHeight + 10.0),
      child: Text(
        "星耀悦读",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }

  /// 布置作业的按钮
  Widget _buildButton() {
    return Container(
      width: 134.0,
      height: 34.0,
      margin: const EdgeInsets.only(top: 20.0),
      child: new FlatButton(
        onPressed: () {},
        color: Colors.white24,
        shape: StadiumBorder(),

        /// 根据[fit]缩放并定位其子项，我加了这个控件默认子项就是在中间
        child: new FittedBox(
          child: new Row(
            children: <Widget>[
              Image.asset(
                R.imagesIconAddPng,
                width: 13.0,
                height: 13.0,
              ),
              new Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: new Text(
                  "布置",
                  style: new TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///listview的子项
  Widget _buildItem(int index, String path) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),

        /// 给容器添加阴影 color 阴影的颜色 blurRadius模糊度
        boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey, blurRadius: 2.0)],
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Image.asset(
              path,
              width: 53.0,
              height: 53.0,
            ),
          ),

          /// 字数是超出了屏幕，所以我用了Expanded来包裹含有字体控件的空间
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 18.0, top: 20.0, bottom: 11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(model.data[index].listVoArr[0].title,
                      style: TextStyle(
                          fontSize: 18.0, color: StudentColors.s_186acc)),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      model.data[index].listVoArr[0].subTitle,
                      style: TextStyle(
                          fontSize: 12.0, color: StudentColors.s_9a9a9a),
                    ),
                  ),
                  Container(
                    width: 189.0,
                    margin: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: "未完成",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: StudentColors.s_9a9a9a),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "${model.data[index].listVoArr[0].unFinishNo == null ? 0 : model.data[index].listVoArr[0].unFinishNo}",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: StudentColors.s_22b2e1,
                                      letterSpacing: 5.0),
                                )
                              ]),
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                                text: "待检查",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: StudentColors.s_9a9a9a),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "${model.data[index].listVoArr[0].unCommentNo == null ? 0 : model.data[index].listVoArr[0].unCommentNo}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: StudentColors.s_22b2e1,
                                        letterSpacing: 5.0),
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
