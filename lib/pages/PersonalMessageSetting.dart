import 'package:flutter/material.dart';
import 'package:flutter_starforparents/widgets/MyAppBar.dart';
import 'package:flutter_starforparents/util/StudentColors.dart';
import 'package:flutter_starforparents/util/PhoneSizeUtil.dart';
import 'package:flutter_starforparents/r.dart';

class PersonalMessageSetting extends StatefulWidget {
  @override
  _PersonalMessageSettingState createState() => _PersonalMessageSettingState();
}

class _PersonalMessageSettingState extends State<PersonalMessageSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        backgroundColor: StudentColors.s_22b2e1,
        centerTitle: true,
        title: Text(
          "个人信息修改",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        leading: new InkWell(
          child: new Container(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
            child: new Image.asset(
              "images/btn_back_yellow.png",
              width: 5.0,
              height: 5.0,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Container(
      color: StudentColors.s_22b2e1,
      child: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            width: PhoneSizeUtil.getScreenWidth(context),
            height: PhoneSizeUtil.getScreenHeight(context),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 34.0, left: 32.0),
                      child: Text(
                        "头像",
                        style: TextStyle(
                            fontSize: 15.0, color: StudentColors.s_484848),
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(
                          top: 8.0, right: 22.0, bottom: 8.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(50.0),
                      ),
                      width: 73.0,
                      height: 73.0,
                      child: new CircleAvatar(
                        backgroundImage: new AssetImage(R.imagesHeaderPng),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Divider(
                    color: StudentColors.s_e5e5e5,
                    height: 0.5,
                  ),
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0,),
                ),
                /// 昵称
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 32.0 ,top: 15.0, bottom: 15.0),
                      child: Text(
                        "昵称",
                        style: TextStyle(
                            fontSize: 15.0, color: StudentColors.s_484848),
                      ),
                    ),
                    new Container(margin: const EdgeInsets.only(right: 25.0),
                      child: Text(
                      "小美老师",
                      style: TextStyle(
                          fontSize: 15.0, color: StudentColors.s_484848),
                    ),),
                  ],
                ),
                Container(
                  child: Divider(
                    color: StudentColors.s_e5e5e5,
                    height: 0.5,
                  ),
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                /// 性别
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 32.0 ,top: 15.0, bottom: 15.0),
                      child: Text(
                        "性别",
                        style: TextStyle(
                            fontSize: 15.0, color: StudentColors.s_484848),
                      ),
                    ),
                    new Container(margin: const EdgeInsets.only(right: 25.0),
                      child: Text(
                        "女",
                        style: TextStyle(
                            fontSize: 15.0, color: StudentColors.s_484848),
                      ),),
                  ],
                ),
                Container(
                  child: Divider(
                    color: StudentColors.s_e5e5e5,
                    height: 0.5,
                  ),
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                /// 生日
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 32.0 ,top: 15.0, bottom: 15.0),
                      child: Text(
                        "生日",
                        style: TextStyle(
                            fontSize: 15.0, color: StudentColors.s_484848),
                      ),
                    ),
                    new Container(margin: const EdgeInsets.only(right: 25.0),
                      child: Text(
                        "1980-04-03",
                        style: TextStyle(
                            fontSize: 15.0, color: StudentColors.s_484848),
                      ),),
                  ],
                ),
                Container(
                  child: Divider(
                    color: StudentColors.s_e5e5e5,
                    height: 0.5,
                  ),
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
