import 'package:flutter/material.dart';

class ClassificationPage extends StatefulWidget {
  @override
  _ClassificationPageState createState() => _ClassificationPageState();
}

/// StatefulWidget 的子页面每次都会重新调用initState。这肯定不是我们想要的，所以这时你就需要AutomaticKeepAliveClientMixin  。
/// 每个 Tab 对应的 StatefulWidget 的 State ，需要通过with AutomaticKeepAliveClientMixin ，
/// 然后重写 @override bool get wantKeepAlive => true; ，就可以实不重新构建的效果了，
class _ClassificationPageState extends State<ClassificationPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("分类"),);
  }
}
