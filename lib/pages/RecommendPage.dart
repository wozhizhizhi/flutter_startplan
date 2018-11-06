import 'package:flutter/material.dart';
import 'package:flutter_starforparents/util/PhoneSizeUtil.dart';
import 'package:flutter_starforparents/r.dart';
import 'package:flutter_starforparents/util/StudentColors.dart';
import 'package:banner_view/banner_view.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  int count = 3;
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 0.56),
            itemBuilder: (context, index) {
              return _buildItem(index);
            },
            itemCount: 19,
          )),
    );
  }

  /// 广告
  Widget _bannerWeight() {
    return new Container(
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
              child: Image.asset(
                R.imagesCcBookNoPng,
                fit: BoxFit.fill,
                width: 103.0,
                height: 137.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7.0),
            child: Text(
              "大家丛书：梦想与火箭一同起飞-梁...",
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
                  "x2",
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
