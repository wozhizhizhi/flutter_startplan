import 'package:flutter/material.dart';
import 'package:flutter_starforparents/widgets/MyAppBar.dart';
import 'package:flutter_starforparents/util/StudentColors.dart';
import 'package:flutter_starforparents/util/PhoneSizeUtil.dart';
import 'package:flutter_starforparents/r.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_starforparents/dao/UserDao.dart';
import 'package:flutter_starforparents/modle/BaseModel.dart';
import 'package:flutter_starforparents/modle/PictureUrlArr.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class PersonalMessageSetting extends StatefulWidget {
  @override
  _PersonalMessageSettingState createState() => _PersonalMessageSettingState();
}

class _PersonalMessageSettingState extends State<PersonalMessageSetting> {
  String dateTime = "1995-08-05";
  int _selectedColorIndex = 0;
  FixedExtentScrollController scrollController;
  List coolColorNames = ["男", "女"];
  File _image;
  BaseModel<PictureUrlArr> _pictureUrlArr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController =
        FixedExtentScrollController(initialItem: _selectedColorIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController?.dispose();
    super.dispose();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _upLoadHeadData(image);
    setState(() {
      _image = image;
    });
  }

  /// 请求图书的列表逻辑
  Future<void> _upLoadHeadData(File image) async {
    print("pic: ${image.path}");
    FormData formData = new FormData.from({ "pictureArr":[new UploadFileInfo(image, "pictureArr")]});
//  List<String> list = [_image.toString()];

    if (!mounted) return; //异步处理，防止报错
    _pictureUrlArr = await UserDao.getUpLoadHeadImageData(formData);
    setState(() {
//      _image = _pictureUrlArr.data.pictureUrlArr[0];
    });
  }

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
                   InkWell(child: new Container(
                      margin: const EdgeInsets.only(
                          top: 8.0, right: 22.0, bottom: 8.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(50.0),
                      ),
                      width: 73.0,
                      height: 73.0,
                      child: new CircleAvatar(
                        backgroundImage: _image == null
                            ? AssetImage(R.imagesHeaderPng)
                            : FileImage(_image),
                      ),
                    ),onTap: (){
                     getImage();
                   },),
                  ],
                ),
                Container(
                  child: Divider(
                    color: StudentColors.s_e5e5e5,
                    height: 0.5,
                  ),
                  margin: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                ),

                /// 昵称
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                          left: 32.0, top: 15.0, bottom: 15.0),
                      child: Text(
                        "昵称",
                        style: TextStyle(
                            fontSize: 15.0, color: StudentColors.s_484848),
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(right: 25.0),
                      child: Text(
                        "小美老师",
                        style: TextStyle(
                            fontSize: 15.0, color: StudentColors.s_484848),
                      ),
                    ),
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
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            left: 32.0, top: 15.0, bottom: 15.0),
                        child: Text(
                          "性别",
                          style: TextStyle(
                              fontSize: 15.0, color: StudentColors.s_484848),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(right: 25.0),
                        child: Text(
                          coolColorNames[_selectedColorIndex],
                          style: const TextStyle(
                              color: StudentColors.s_484848
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () async {
                    await showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildBottomPicker(
                          CupertinoPicker(
                            scrollController: scrollController,
                            itemExtent: 36.0,
                            backgroundColor: CupertinoColors.white,
                            onSelectedItemChanged: (int index) {
                              setState(() => _selectedColorIndex = index);
                            },
                            children: List<Widget>.generate(
                                coolColorNames.length, (int index) {
                              return Center(
                                child: Text(coolColorNames[index]),
                              );
                            }),
                          ),
                        );
                      },
                    );
                  },
                ),
                Container(
                  child: Divider(
                    color: StudentColors.s_e5e5e5,
                    height: 0.5,
                  ),
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                /// 生日
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            left: 32.0, top: 15.0, bottom: 15.0),
                        child: Text(
                          "生日",
                          style: TextStyle(
                              fontSize: 15.0, color: StudentColors.s_484848),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(right: 25.0),
                        child: Text(
                          dateTime,
                          style: TextStyle(
                              fontSize: 15.0, color: StudentColors.s_484848),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
//                    showModalBottomSheet(
//                      context: context,
//                      builder: (context) {
//                        return SizedBox(
//                          child: CupertinoDatePicker(
//                            onDateTimeChanged: (dateTime) {
//                              setState(() {
//                                dateTime = dateTime;
//                              });
//                            },
//                            mode: CupertinoDatePickerMode.date,
//                            initialDateTime: DateTime(2018, 11, 13),
//                            maximumYear: 2050,
//                            minimumYear: 1970,
//                          ),
//                          width: PhoneSizeUtil.getScreenWidth(context),
//                          height: 200.0,
//                        );
//                      },
//                    );

                    return DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      locale: 'zh',
                      minYear: 1970,
                      maxYear: 2050,
                      initialYear: 2018,
                      initialMonth: 1,
                      initialDate: 1,
                      dateFormat: 'yyyy-mm-dd',
                      onConfirm: (year, month, date) {
                        setState(() {
                          dateTime = "$year-$month-$date";
                        });
                      },
                    );
                  },
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

  Widget _buildMenu(List<Widget> children) {
    return Container(
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
          bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
        ),
      ),
      height: 44.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          top: false,
          bottom: false,
          child: DefaultTextStyle(
            style: const TextStyle(
              letterSpacing: -0.24,
              fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 180.0,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 18.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}
