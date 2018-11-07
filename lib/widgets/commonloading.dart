import 'package:flutter/material.dart';
import 'package:flutter_starforparents/r.dart';

class CommonLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Image.asset(
          R.imagesLoadingGif,
         fit: BoxFit.contain,
        ),
      ),
    );
  }
}
