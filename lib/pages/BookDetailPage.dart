import 'package:flutter/material.dart';
import 'package:flutter_starforparents/widgets/SliverFab.dart';
import 'dart:ui' as ui;
import 'package:flutter_starforparents/widgets/StarRating.dart';
import 'package:flutter_starforparents/widgets/PhotoHero.dart';

class BookDetailPage extends StatefulWidget {
  final int ids;
  final String url;
  BookDetailPage({Key key,  @required this.ids, @required this.url})
      : super(key: key);
  @override
  _BookDetailPageState createState() => new _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  bool isvisable = false;
  String dataStr = "鸭子骑车？这可真是个疯狂的想法！但有一只鸭子真的办到了！"
      "农场里的马、牛、羊、鸡、狗、老鼠……对鸭子骑车这件事有什么看法呢？在一个平平常常的下午，"
      "动物们干了一件很不平凡的事情。对鸭子骑车这件事有什么看法呢？在一个平平常常…下午，动物们干了一件很不平凡的事情。";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new Container(
        color: Colors.white24,
        height: 50.0,
        child: new Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15.0),
          child: new TextField(
            decoration: new InputDecoration.collapsed(hintText: "我也聊一句"),
          ),
        ),
      ),
      body: new Builder(
        builder: (context) => new SliverFab(
              slivers: <Widget>[
                new SliverAppBar(
                  centerTitle: true,
                  elevation: 0.0,
                  title: new Text(
                    "鸭子学车记鸭子学车记凯迪克大奖得主代表作",
                    style: new TextStyle(fontSize: 16.0),
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
                  backgroundColor: const Color(0xff22b2e1),
                  expandedHeight: 256.0,
                  pinned: true,
                  flexibleSpace: new FlexibleSpaceBar(
                    background: Container(
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                            child: new Image.network(
                              widget.url,
                              fit: BoxFit.fill,
                              width: 720.0,
                            ),
                          ),
                          new BackdropFilter(
                            child: Opacity(
                              opacity: 0.35,
                              child: new Container(
                                color: Colors.white,
                              ),
                            ),
                            filter:
                                ui.ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                          ),
                          new Container(
                            margin: const EdgeInsets.only(
                                top: 60.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: new Row(
                              children: <Widget>[
                                new BackdropFilter(
                                  child: Opacity(
                                    opacity: 0.35,
                                    child: new Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                  filter: ui.ImageFilter
                                      .blur(sigmaX: 50.0, sigmaY: 50.0),
                                ),
                                new Container(
                                  child: new PhotoHero(
                                    photo: widget.url,
                                    width: 104.0,
                                    height: 145.0,
                                  ),
                                ),
                                new Expanded(
                                  child: new Container(
                                    alignment: Alignment.topRight,
                                    padding: const EdgeInsets.only(
                                        top: 32.0, left: 10.0),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          "鸭子学车记鸭子学车记凯迪克大奖得主代表作…",
                                          style: new TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white),
                                          softWrap: true,
                                        ),
                                        new Container(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
                                          child: new Text(
                                            "作者：大卫·夏农",
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                        new Container(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: new Text(
                                            " 23人读过",
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                        new Container(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: new Row(
                                            children: <Widget>[
                                              new Text(
                                                "难度指数：",
                                                style: new TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white),
                                              ),
                                              new Image.asset(
                                                "images/rp_thunder.png",
                                                width: 15.0,
                                                height: 15.0,
                                              ),
                                              new Text(
                                                " x 3",
                                                style: new TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        new Expanded(child: Container(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: new Row(
                                            children: <Widget>[
                                              new RaisedButton(
                                                onPressed: null,
                                                child: new Text(
                                                  "习题",
                                                  style: new TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0),
                                                ),
                                                disabledColor:
                                                    new Color(0xff76DEFC),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                17.0)),
                                              ),
                                              new Container(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0),
                                                child: new RaisedButton(
                                                  onPressed: null,
                                                  child: new Text(
                                                    "视频",
                                                    style: new TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.0),
                                                  ),
                                                  disabledColor:
                                                      new Color(0xffF4C925),
                                                  shape:
                                                      new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  17.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      width: 256.0,
                      height: 256.0,
                    ),
                  ),
                ),
//                new SliverList(
//                  delegate: new SliverChildListDelegate(
//                    new List.generate(
//                      30,
//                      (int index) =>
//                          new ListTile(title: new Text("Item $index")),
//                    ),
//                  ),
//                ),

                new SliverList(
                  delegate: new SliverChildListDelegate(<Widget>[
                    // 上
                    _buildTop(),
                    //和爸爸妈妈一起读
                    _buildCenter(),
                  ]),
                ),

                //和
                new SliverList(
                  delegate: new SliverChildListDelegate(
                    new List.generate(
                      2,
                      (int index) => _buildWhyItem(index),
                    ),
                  ),
                ),

                new SliverList(
                  delegate: new SliverChildListDelegate(<Widget>[
                    _buildBottom(),
                    // 简介
                    _buildMostBottom(),
                    // 评论
                    _buildComment(),
                    _buildCommentWidget(),
                  ]),
                ),
              ],
              floatingActionButton: null,
              expandedHeight: 256.0,
            ),
      ),
    );
  }

  Widget _buildTop() {
    return new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10.0),
      child: new Column(
        children: <Widget>[
          new Container(
            // 星耀小学图书馆
            margin: const EdgeInsets.only(top: 16.0, left: 15.0, right: 15.0),
            child: new Row(
              children: <Widget>[
                new Image.asset("images/icon_adress.png"),
                new Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: new Text(
                    "无敌图书馆",
                    style: new TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff484848),
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 150.0),
                  child: Text(
                    "在馆3",
                    style: new TextStyle(
                      color: Color(0xff484848),
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),

          // 广州图书馆
          new Container(
            // 广州图书馆
            margin: const EdgeInsets.only(top: 13.0, left: 15.0, right: 15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Image.asset("images/icon_adress.png"),
                new Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: new Text(
                    "寂寞图书馆",
                    style: new TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff484848),
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 150.0),
                  child: Text(
                    "在馆0",
                    style: new TextStyle(
                      color: Color(0xff484848),
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),

          // 共3家
          new Container(
            margin: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    "共3家图书馆",
                    style: new TextStyle(
                      fontSize: 13.0,
                      color: Color(0xff9a9a9a),
                    ),
                  ),
                ),
                new Image.asset(
                  "images/me_icon_arrowgary.png",
                  width: 12.0,
                  height: 12.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenter() {
    return new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: new Text(
              "和爸爸妈妈一起读",
              style:
                  new TextStyle(fontSize: 15.0, color: new Color(0xff484848)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10.0),
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 15.0),
            child: new Text(
              "推荐信息",
              style: new TextStyle(
                fontSize: 15.0,
                color: new Color(0xff484848),
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              new Container(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 15.0, bottom: 15.0),
                child: new Image.asset(
                  "images/highlight_icon.png",
                  width: 10.0,
                  height: 10.0,
                ),
              ),
              new Container(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 10.0, bottom: 15.0),
                child: new Text(
                  "凯迪克大奖得主大卫·夏农代表作",
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: new Color(0xff484848),
                  ),
                ),
              ),
            ],
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  // 简介
  Widget _buildMostBottom() {
    return new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 15.0),
            child: new Text(
              "简介",
              style: new TextStyle(
                fontSize: 15.0,
                color: new Color(0xff484848),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 15.0, right: 15.0),
            child: new Text(
              "鸭子骑车？这可真是个疯狂的想法！但有一只鸭子真的办到了！农场里的马、牛、羊、鸡、狗、老鼠……对鸭子骑车这件事有什么看法呢？在一个平平常常的下午，动物们干了一件很不平凡的事情。对鸭子骑车这件事有什么看法呢？在一个平平常常…下午，动物们干了一件很不平凡的事情。",
              style: new TextStyle(
                fontSize: 15.0,
                color: new Color(0xff484848),
              ),
              softWrap: true,
            ),
          ),
          _buildText(),
          new GestureDetector(
            child: Container(
              alignment: Alignment.centerRight,
              padding:
                  const EdgeInsets.only(top: 13.0, right: 15.0, bottom: 15.0),
              child: new Text(
                "全文",
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff22B2E1),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                if (isvisable == false) {
                  isvisable = true;
                } else {
                  isvisable = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    var content;
    if (isvisable == false) {
      //则显示Text
      content = new Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: new Text(
          dataStr,
          style: new TextStyle(
            fontSize: 15.0,
            color: new Color(0xff484848),
          ),
          softWrap: true,
        ),
      );
    } else if (isvisable == true) {
      // 当数据为空我们需要隐藏这个Text
      // 我们又不可以返回一个null给当前的Widget Tree
      // 只可以返回一个长宽为0的widget占位
      content = new Container(height: 0.0, width: 0.0);
    }
    return content;
  }

  // 和爸妈一起读的item
  Widget _buildWhyItem(int index) {
    return new Container(
      color: Colors.white,
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 15.0, left: 15.0),
              child: new Row(
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: new Image.asset(
                      "images/read_ask_tag.png",
                      width: 15.0,
                      height: 15.0,
                    ),
                  ),
                  new Text(
                    "这本书说明了什么道理？",
                    style: new TextStyle(
                      fontSize: 15.0,
                      color: new Color(0xff484848),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 10.0, left: 45.0),
              child: new Text(
                "这本书说明了一件不平凡的事",
                style: new TextStyle(fontSize: 13.0, color: Color(0xff9a9a9a)),
              ),
            )
          ]),
    );
  }

  // 简介
  Widget _buildComment() {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: new Text("评论 (23)"),
          ),
          new Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: new Text(
              ">",
              style: new TextStyle(
                fontSize: 25.0,
                color: new Color(0xff999999),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCommentWidget() {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                child: CircleAvatar(
                  backgroundImage: new NetworkImage(
                    "http://img.soogif.com/e2d43a22-cbba-47ab-b1cc-e7ea0810aab3.gif",
                  ),
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new Text(
                      "黄小星",
                      style: new TextStyle(
                        fontSize: 15.0,
                        color: new Color(0xff22B2E1),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                    child: new StarRating(
                      rating: 4.0,
                      size: 15.0,
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ],
          ),
          new Container(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 64.0,
            ),
            child: new Text(
              "他一摇一摆地走到男孩停着的自行车旁，爬上去，骑了起来。开始他骑得很慢，而且左摇右晃，但是很好玩！",
              style: new TextStyle(
                fontSize: 15.0,
                color: new Color(
                  0xff484848,
                ),
              ),
              textAlign: TextAlign.start,
              softWrap: true,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 64.0,
                ),
                child: new Text(
                  "2016-02-05 18:36",
                  style: new TextStyle(
                    fontSize: 11.0,
                    color: new Color(
                      0xffb5b5b5,
                    ),
                  ),
                ),
              ),
//              new ListTile(leading: new Image.asset("images/icon_like_s.png",width: 15.0,height: 15.0,),title: new Text("点赞"),)
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Image.asset(
                      "images/icon_like_s.png",
                      width: 15.0,
                      height: 15.0,
                    ),
                    new Text(
                      "点赞",
                      style: new TextStyle(
                          color: Color(0xffb5b5b5), fontSize: 11.0),
                    ),
                    new Container(
                      padding: const EdgeInsets.only(
                        right: 15.0,
                        left: 25.0,
                      ),
                      child: new Row(
                        children: <Widget>[
                          new Image.asset(
                            "images/icon_reply_s.png",
                            width: 15.0,
                            height: 15.0,
                          ),
                          new Text(
                            "回复",
                            style: new TextStyle(
                                color: Color(0xffb5b5b5), fontSize: 11.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
