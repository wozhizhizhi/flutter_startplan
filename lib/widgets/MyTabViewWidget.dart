import 'package:flutter/material.dart';
import 'package:flutter_starforparents/widgets/MyAppBar.dart';

class MyTabViewWidget extends StatefulWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final List<Widget> pages;
  final List<String> titles;
  /// appbar的背景颜色
  final Color bgBarColor;

  /// 描边的颜色
  final Color borderColor;

  /// tab按钮里面的背景颜色
  final Color backgroundColor;
  final Color twoBackgroundColor;

  /// 选中于未选中的文字颜色转换效果
  final Color oneSelectTextColor;
  final Color twoSelectTextColor;

  /// tab按钮的点击事件
  final GestureTapCallback onTapOne;
  final GestureTapCallback onTapTwo;

  MyTabViewWidget(
      {Key key,
      this.pageController,
      this.titles,
      this.pages,
      this.borderColor,
      this.bgBarColor,
      this.backgroundColor,
      this.twoBackgroundColor,
      this.oneSelectTextColor,
      this.twoSelectTextColor,
      this.onPageChanged,
      this.onTapOne,
      this.onTapTwo})
      : super(key: key);
  @override
  _MyTabViewWidgetState createState() => _MyTabViewWidgetState();
}

class _MyTabViewWidgetState extends State<MyTabViewWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: widget.bgBarColor,
        title: new Container(
          width: 170.0,
          height: 30.0,
          child: new Row(
            children: <Widget>[
              new InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: 85.0,
                  height: 30.0,
                  decoration: new BoxDecoration(
                    border: Border.all(width: 1.0, color: widget.borderColor),
                    color: widget.backgroundColor,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                  ),
                  child: new Text(
                    widget.titles[0],
                    style: TextStyle(
                        fontSize: 16.0, color: widget.oneSelectTextColor),
                  ),
                ),
                onTap: widget.onTapOne,
              ),
              new InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: 85.0,
                  height: 30.0,
                  decoration: new BoxDecoration(
                    border: Border.all(width: 1.0, color: widget.borderColor),
                    color: widget.twoBackgroundColor,
                    borderRadius: new BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: new Text(
                    widget.titles[1],
                    style: TextStyle(
                        fontSize: 16.0, color: widget.twoSelectTextColor),
                  ),
                ),
                onTap: widget.onTapTwo,
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        children: widget.pages,
        controller: widget.pageController,
        onPageChanged: widget.onPageChanged,
      ),
    );
  }
}
