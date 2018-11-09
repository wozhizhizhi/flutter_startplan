import 'package:flutter/material.dart';
import 'package:flutter_starforparents/r.dart';
import 'package:flutter_starforparents/util/PhoneSizeUtil.dart';
import 'package:flutter_starforparents/util/StudentColors.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: StudentColors.s_f6f6f6,
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              width: PhoneSizeUtil.getScreenWidth(context),
              height: 244.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(R.imagesMeImgBgPng), fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 InkWell(child: Container(
                    margin: const EdgeInsets.only(right: 13.0, top: 13.0),
                    child: Image.asset(
                      R.imagesImgInfoSettingPng,
                      width: 30.0,
                      height: 30.0,
                    ),
                    alignment: Alignment.topRight,
                  ),onTap: (){
                   Navigator.pushNamed(context, "/SettingPage");
                 },),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(50.0),
                          border:
                              new Border.all(color: Colors.white, width: 2.5),
                        ),
                        width: 96.0,
                        height: 96.0,
                        child: new CircleAvatar(
                          backgroundImage: new AssetImage(R.imagesHeaderPng),
                        ),
                      ),
                      Container(
                        width: 96.0,
                        height: 96.0,
                        child: Image.asset(
                          R.imagesImgUserinfoCameraPng,
                          width: 30.0,
                          height: 30.0,
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 13.0),
                    child: Text(
                      "小A老师",
                      style: TextStyle(
                          color: StudentColors.s_fde805, fontSize: 18.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 0.5),
                    child: Text(
                      "第二小学",
                      style: TextStyle(
                          color: StudentColors.s_fde805, fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              margin: const EdgeInsets.only(
                  top: 15.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Image.asset(
                      R.imagesIcon01Png,
                      width: 28.0,
                      height: 23.0,
                    ),
                    title: Text(
                      "作业管理",
                      style: TextStyle(
                          fontSize: 14.0, color: StudentColors.s_9a9a9a),
                    ),
                    trailing: Image.asset(
                      R.imagesMeIconArrowgaryPng,
                      width: 7.0,
                      height: 14.0,
                    ),
                  ),
                  Container(
                    child: Divider(
                      height: 0.5,
                      color: StudentColors.s_c7c7c7,
                    ),
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  ),
                  ListTile(
                    leading: Image.asset(
                      R.imagesIcon02Png,
                      width: 28.0,
                      height: 23.0,
                    ),
                    title: Text(
                      "借书记录",
                      style: TextStyle(
                          fontSize: 14.0, color: StudentColors.s_9a9a9a),
                    ),
                    trailing: Image.asset(
                      R.imagesMeIconArrowgaryPng,
                      width: 7.0,
                      height: 14.0,
                    ),
                  ),
                  Container(
                    child: Divider(
                      height: 0.5,
                      color: StudentColors.s_c7c7c7,
                    ),
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  ),
                  ListTile(
                    leading: Image.asset(
                      R.imagesIcon03Png,
                      width: 28.0,
                      height: 23.0,
                    ),
                    title: Text(
                      "收藏",
                      style: TextStyle(
                          fontSize: 14.0, color: StudentColors.s_9a9a9a),
                    ),
                    trailing: Image.asset(
                      R.imagesMeIconArrowgaryPng,
                      width: 7.0,
                      height: 14.0,
                    ),
                  ),
                  Container(
                    child: Divider(
                      height: 0.5,
                      color: StudentColors.s_c7c7c7,
                    ),
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  ),
                  ListTile(
                    leading: Image.asset(
                      R.imagesIcon04Png,
                      width: 28.0,
                      height: 23.0,
                    ),
                    title: Text(
                      "回复评论",
                      style: TextStyle(
                          fontSize: 14.0, color: StudentColors.s_9a9a9a),
                    ),
                    trailing: Image.asset(
                      R.imagesMeIconArrowgaryPng,
                      width: 7.0,
                      height: 14.0,
                    ),
                  ),
                  Container(
                    child: Divider(
                      height: 0.5,
                      color: StudentColors.s_c7c7c7,
                    ),
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  ),
                  ListTile(
                    leading: Image.asset(
                      R.imagesIcon05Png,
                      width: 28.0,
                      height: 23.0,
                    ),
                    title: Text(
                      "消息中心",
                      style: TextStyle(
                          fontSize: 14.0, color: StudentColors.s_9a9a9a),
                    ),
                    trailing: Image.asset(
                      R.imagesMeIconArrowgaryPng,
                      width: 7.0,
                      height: 14.0,
                    ),
                  ),
                  Container(
                    child: Divider(
                      height: 0.5,
                      color: StudentColors.s_c7c7c7,
                    ),
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  ),
                ],
              ),
            )
          ],
          padding: const EdgeInsets.only(
            top: 0.0,
            bottom: 0.0,
          ),
        ),
      ),
    );
  }
}
