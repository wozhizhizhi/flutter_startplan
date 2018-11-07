import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starforparents/dao/UserDao.dart';
import 'package:flutter_starforparents/modle/BaseModel.dart';
import 'package:flutter_starforparents/modle/BookListVos.dart';
import 'package:flutter_starforparents/r.dart';
import 'package:flutter_starforparents/util/StudentColors.dart';
import 'package:flutter_starforparents/widgets/commonloading.dart';
import 'package:flutter/cupertino.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  final int count = 3;
  @override
  bool get wantKeepAlive => true;
  BaseModel<BookListVos> bookLists;

  /// 请求图书的列表逻辑
  Future<void> _getBookData() async {
    if (!mounted) return; //异步处理，防止报错
    bookLists = await UserDao.getBookData();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBookData();
  }

  @override
  Widget build(BuildContext context) {
    var content;
    if (bookLists.data.bookListVoArr == null){
      content = new CommonLoading();
    }
    else{
      content = CustomScrollView(
        slivers: <Widget>[
          new CupertinoSliverRefreshControl(onRefresh: (){
            _getBookData();
            setState(() {
              
            });
          },),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 2.0),
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return _bannerWeight();
            }, childCount: 1),
          ),

          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 0.60),
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(child:_buildItem(index),margin: const EdgeInsets.only(left: 10.0,right: 10.0),);
            }, childCount: bookLists.data.bookListVoArr.length),
          ),
        ],
      );
    }
    return CupertinoPageScaffold(
      child: content,
    );
  }

  /// 广告
  Widget _bannerWeight() {
    return new Container(
      margin: const EdgeInsets.only(bottom: 22.0),
      height: 170.0,
      child: new BannerView(
        [
          new Image.asset(
            R.imagesBanner01Png,
            fit: BoxFit.fill,
          ),
        ],
        log: false,
        indicatorMargin: 4.0,
        indicatorNormal: new Container(
          width: 5.0,
          height: 5.0,
          decoration: new BoxDecoration(
            color: StudentColors.s_d1d1d1,
            shape: BoxShape.circle,
          ),
        ),
        indicatorSelected: new Container(
          width: 5.0,
          height: 5.0,
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        indicatorBuilder: (context, indicator) {
          Widget cc = new Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 2.0),
              alignment: Alignment.center,
              height: 15.0,
              width: double.infinity,
              color: Colors.transparent,
              child: indicator,
            ),
          );
          return cc;
        },
      ),
    );
  }

  /// item控件
  Widget _buildItem(int index) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(color: StudentColors.s_9a9a9a, blurRadius: 0.1)
                ],
              ),
              child: Image.network(
                bookLists.data.bookListVoArr[index].coverUrl,
                fit: BoxFit.fill,
                width: 103.0,
                height: 137.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7.0),
            child: Text(
              bookLists.data.bookListVoArr[index].name,
              style: TextStyle(fontSize: 12.0, color: StudentColors.s_484848),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  R.imagesRpThunderPng,
                  width: 11.0,
                  height: 15.0,
                ),
                Text(
                  "x${bookLists.data.bookListVoArr[index].difficultyIndex}",
                  style:
                      TextStyle(fontSize: 14.0, color: StudentColors.s_22b2e1),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
