import 'package:flutter/material.dart';
import 'package:flutter_starforparents/r.dart';
import 'package:flutter_starforparents/net/HttpMannage.dart';
import 'CupertinoPickerDemo.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    _countToPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
              image: AssetImage(R.imagesLaunchPng), fit: BoxFit.fill),
        ),
        child: new Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.fromLTRB(0.0, 45.0, 10.0, 0.0),
          child: new OutlineButton(
            onPressed: () {
              goHome();
            },

            /// 设定外圈线的大小
            borderSide: BorderSide(width: 0.8, color: Colors.white),
            shape: StadiumBorder(),
            child: Text(
              "跳过",
              style: TextStyle(fontSize: 13.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  /// 倒计时跳转
  void _countToPage() {
    var duration = new Duration(seconds: 3);
    new Future.delayed(duration, goHome);
  }

  void goHome() async{
    String token = await HttpMannage.getToken();
    if (token != null && token.isNotEmpty){
      Navigator.pushReplacementNamed(context, "/HomePage");

//    Navigator.push(context, MaterialPageRoute(builder: (context){
//      return new CupertinoPickerDemo();
//    }));
    }
    else{
      Navigator.pushReplacementNamed(context, "/LoginPage");
    }

  }
}
