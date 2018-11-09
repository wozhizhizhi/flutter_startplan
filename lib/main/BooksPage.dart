import 'package:flutter/material.dart';
import 'package:flutter_starforparents/widgets/MyTabViewWidget.dart';
import 'package:flutter_starforparents/util/StudentColors.dart';
import 'package:flutter_starforparents/pages/ClassificationPage.dart';
import 'package:flutter_starforparents/pages/RecommendPage.dart';

/// 图书
class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  int _index = 0;
  PageController _pageController;
  List<String> title = ["推荐", "分类"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      initialIndex: _index,
      length: title.length,
      child: MyTabViewWidget(
        titles: title,
        bgBarColor: StudentColors.s_22b2e1,
        pageController: _pageController,
        onPageChanged: pageChanged,
        backgroundColor: getBgColor(0),
        twoBackgroundColor: getBgColor(1),
        borderColor: Colors.white,
        oneSelectTextColor: getSelectColor(0),
        twoSelectTextColor: getSelectColor(1),
        pages: <Widget>[
          new RecommendPage(),
          new ClassificationPage(),
        ],
        onTapOne: () {
          _index = 0;
          _pageController.animateToPage(_index,
              duration: new Duration(milliseconds: 300), curve: Curves.easeOut);
        },
        onTapTwo: () {
          _index = 1;
          _pageController.animateToPage(_index,
              duration: new Duration(milliseconds: 300), curve: Curves.easeOut);
        },
      ),
    );
  }

  /// PageView中onPageChanged代表页面改变的时候
  pageChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  /// 选中于未选中的文字颜色转换效果
  Color getSelectColor(int index) {
    if (index == _index) {
      return Colors.white;
    } else {
      return StudentColors.s_22b2e1;
    }
  }

  /// 背景色选中于未选中的效果
  Color getBgColor(int index) {
    if (index == _index) {
      return StudentColors.s_22b2e1;
    } else {
      return Colors.white;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController?.dispose();
    super.dispose();
  }
}
