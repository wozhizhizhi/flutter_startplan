import 'package:flutter/material.dart';
import 'package:flutter_starforparents/util/StudentColors.dart';
import 'package:flutter_starforparents/r.dart';
import 'package:flutter_starforparents/dao/UserDao.dart';
import 'package:flutter_starforparents/modle/BaseModel.dart';
import 'package:flutter_starforparents/modle/loginVo.dart';
import 'package:flutter_starforparents/net/HttpMannage.dart';
import 'package:flutter_starforparents/util/LocalSharePreferences.dart';
import 'package:flutter_starforparents/net/Config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_starforparents/util/PhoneSizeUtil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _textEditingNameController;
  TextEditingController _textEditingpwdController;
  String name, pwd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingNameController = new TextEditingController();
    _textEditingpwdController = new TextEditingController();
    isNameandPwdTuer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingNameController.dispose();
    _textEditingpwdController.dispose();
  }

  /// 在build方法里面调用判断是否存在缓存
  void isNameandPwdTuer() async {
    String name = await LocalSharePreferences.get(Config.USER_NAME_KEY);
    String pwd = await LocalSharePreferences.get(Config.PW_KEY);
      if (name.isNotEmpty && pwd.isNotEmpty) {
        /// 这两种方法都可以目前我没有发现区别
//      _textEditingNameController.value = TextEditingValue(text: name);
//      _textEditingpwdController.value = TextEditingValue(text: pwd);

        _textEditingNameController.text = name;
        _textEditingpwdController.text = pwd;
      }
  }

  /// 清空密码和用户名输入框目前用不到
  void onEditTextClear() {
    _textEditingpwdController.text = "";
    _textEditingpwdController.text = "";
  }

  /// 登录请求逻辑
  void _getLoginData(String account, String realPassword) async {
    if (!mounted) return; //异步处理，防止报错
    BaseModel<LoginVo> model = await UserDao.getLogin(account, realPassword);
    if (model.data.token != null && model.data.token != "") {
      Navigator.pushReplacementNamed(context, "/HomePage");
    }
    else{
      /// 弹出登录不成功的提示
      Fluttertoast.showToast(msg: model.statusMsg,gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        resizeToAvoidBottomPadding: true, //输入框抵住键盘
      body:new GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: ListView(
        padding: const EdgeInsets.only(top: 0.0,bottom: 0.0),children: <Widget>[
        Container(
          width: PhoneSizeUtil.getScreenWidth(context),
          height: PhoneSizeUtil.getScreenHeight(context),
          color: StudentColors.s_186acc,
          child: _buildLogin(),
        ),
      ],)
    ),);
  }

  /// 登录的界面
  Widget _buildLogin() {
    return new Column(
      children: <Widget>[
        Container(
          child: Image.asset(
            R.imagesLoginLogoPng,
            width: 150.0,
            height: 150.0,
          ),
          margin: const EdgeInsets.only(top: 60.0),
        ),

        /// 输入框
        Container(
          margin: const EdgeInsets.only(right: 33.0, left: 33.0, top: 25.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(12.0)),
          height: 112.0,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10.0, left: 15.0),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  controller: _textEditingNameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Image.asset(
                        R.imagesImgLoginUserPng,
                        width: 25.0,
                        height: 25.0,
                      ),
                      hintText: "请输入手机号"),
                  style:
                      TextStyle(fontSize: 14.0, color: StudentColors.s_484848),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  height: 0.5,
                  color: StudentColors.s_999999,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, left: 15.0),
                child: TextField(
                  controller: _textEditingpwdController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Image.asset(
                        R.imagesImgLoginPwdPng,
                        width: 25.0,
                        height: 25.0,
                      ),
                      hintText: "请输入密码"),
                  style:
                      TextStyle(fontSize: 14.0, color: StudentColors.s_484848),
                  // 输入的字符换成（.）
                  obscureText: true,
                ),
              ),
            ],
          ),
        ),

        /// 忘记密码文字描述
        GestureDetector(
          child: Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 12.0, right: 44.0),
            child: Text(
              "忘记密码",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "/RegisteredPage");
          },
        ),

        /// 登录按钮
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          width: 260.0,
          height: 45.0,
          child: RaisedButton(
            disabledColor: Colors.yellow,
            color: Colors.yellow,
            shape: StadiumBorder(),
            onPressed: () {
              if (_textEditingNameController.text.trim().isNotEmpty &&
                  _textEditingpwdController.text.trim().isNotEmpty) {
                _getLoginData(_textEditingNameController.text,
                    _textEditingpwdController.text);
                print("token is a : ${HttpMannage.getToken().toString()}");
              }
              else {
                Fluttertoast.showToast(
                    msg: "请输入账号或密码!", toastLength: Toast.LENGTH_SHORT);
                }
            },
            child: Text(
              "登录",
              style: TextStyle(fontSize: 18.0, color: StudentColors.s_22b2e1),
            ),
          ),
        ),

        /// 登录按钮
        GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(top: 104.0),
            width: 240.0,
            height: 45.0,
            child: OutlineButton(
              shape: StadiumBorder(),
              onPressed: null,
              borderSide: BorderSide(width: 1.5),
              child: Text(
                "出来报到 ? 注册戳这里",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "/RegisteredPage");
          },
        ),
      ],
    );
  }
}
